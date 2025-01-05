import "reflect-metadata";
import dotenv from "dotenv";
dotenv.config();
import {Container} from "inversify";
import {Identifiers} from "../../core/Identifiers";
import {HandlersModule} from "../modules/handlers/HandlersModule";
import {
    dataSourceConfig, jwtConfig,
} from "./config";
import {DataSource} from "typeorm";
import {
    EventManager,
    MessageModule,
    MessageQueueEntity,
    PostgresEventRepository,
} from "messages-adapters";
import { SignIn } from "../../core/write/usecases/authentication/SignIn";
import { SignUp } from "../../core/write/usecases/authentication/SignUp";
import { CreateProfile } from "../../core/write/usecases/user/CreateProfile";
import { ActivateUser } from "../../core/write/usecases/user/ActivateUser";
import { IsEmailTaken } from "../../core/write/usecases/user/IsEmailTaken";
import { ResetPassword } from "../../core/write/usecases/user/ResetPassword";
import { GenerateRecoveryCode } from "../../core/write/usecases/user/GenerateRecoveryCode";
import { AddProfilePicture } from "../../core/write/usecases/user/AddProfilePicture";
import { SaveRecipient } from "../../core/write/usecases/notification/SaveRecipient";
import { AuthenticationMiddleware } from "../middlewares/AuthenticationMiddleware";
import { JwtIdentityGateway } from "../../adapters/gateways/jwt/JwtIdentityGateway";
import { UserController } from "../modules/authentication/UserController";
import { PostgresUserRepository } from "../../adapters/repositories/user/write/PostgresUserRepository";
import { PostgresProfileRepository } from "../../adapters/repositories/user/write/PostgresProfileRepository";
import { PostgresScaVerifierRepository } from "../../adapters/repositories/user/write/PostgresScaVerifierRepository";
import { UserEntity } from "../../adapters/repositories/user/write/entities/UserEntity";
import { ScaVerifierEntity } from "../../adapters/repositories/user/write/entities/ScaVerifierEntity";
import { BcryptPasswordGateway } from "../../adapters/gateways/bcrypt/BcryptPasswordGateway";
import { ProfileEntity } from "../../adapters/repositories/user/write/entities/ProfileEntity";
import { GetUserPersonalInformation } from "../../core/read/queries/GetUserPersonalInformation";
import { PostgresPersonalInformationReadRepository } from "../../adapters/repositories/user/read/PostgresPersonalInformationReadRepository";
import { VehicleEntity } from "../../adapters/repositories/user/write/entities/VehicleEntity";
import { PostgresVehicleRepository } from "../../adapters/repositories/user/write/PostgresVehicleRepository";
import { AttachVehicle } from "../../core/write/usecases/vehicle/AttachVehicle";

export class AppDependencies extends Container {
    async init() {
        const messageModule = new MessageModule(this);

        const myDataSource = new DataSource({
            ...dataSourceConfig,
            entities: [
                MessageQueueEntity,
                UserEntity,
                ProfileEntity,
                VehicleEntity,
                ScaVerifierEntity
            ],
        });

        await myDataSource.initialize();

        this.bind(Identifiers.passwordGateway).toConstantValue(
            new BcryptPasswordGateway()
        );
        
        this.bind(Identifiers.scaVerifierRepository).toConstantValue(
            new PostgresScaVerifierRepository(myDataSource.manager)
        );
        
        this.bind(Identifiers.userRepository).toConstantValue(
            new PostgresUserRepository(myDataSource.manager)
        );
        this.bind(Identifiers.profileRepository).toConstantValue(
            new PostgresProfileRepository(myDataSource.manager)
        );
        this.bind(Identifiers.vehicleRepository).toConstantValue(
            new PostgresVehicleRepository(myDataSource.manager)
        );


        this.bind(Identifiers.personalInformationReadModelRepository).toConstantValue(
            new PostgresPersonalInformationReadRepository(myDataSource.manager)
        );
        
        this.bind(Identifiers.identityGateway).toConstantValue(
            new JwtIdentityGateway(jwtConfig.secret, jwtConfig.config)
        );


        this.bind(AuthenticationMiddleware).toSelf();

        this.bind(UserController).toSelf();

        //user
        this.bind(SignIn).toSelf();
        this.bind(Identifiers.signUp).to(SignUp);
        this.bind(CreateProfile).toSelf();
        this.bind(ActivateUser).toSelf();
        this.bind(SaveRecipient).toSelf();
        this.bind(IsEmailTaken).toSelf();
        this.bind(ResetPassword).toSelf();
        this.bind(GenerateRecoveryCode).toSelf();
        this.bind(AddProfilePicture).toSelf();
        this.bind(GetUserPersonalInformation).toSelf();

        //vehicle
        this.bind(AttachVehicle).toSelf();

        messageModule.configure({
            dataSource: new PostgresEventRepository(myDataSource.manager),
        });

        await messageModule.register((em: EventManager) => {
            HandlersModule.configureHandlers(em);
        });

        return this;
    }
}
