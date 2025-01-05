import {inject, injectable} from "inversify";
import {
    Body,
    Get,
    JsonController,
    Patch,
    Post,
    Req,
    Res,
    UseBefore,
} from "routing-controllers";
import {Response} from "express";
import {validateOrReject} from "class-validator";
import {SignUp} from "../../../core/write/usecases/authentication/Signup";
import {SignupCommand} from "./commands/SignupCommand";
import {Identifiers} from "../../../core/Identifiers";
import {IdentityGateway} from "../../../core/write/domain/gateway/IdentityGateway";
import {SignIn} from "../../../core/write/usecases/authentication/SignIn";
import {SignInCommand} from "./commands/SignInCommand";
import {CreateProfile} from "../../../core/write/usecases/user/CreateProfile";
import {CreateProfileCommand} from "./commands/CreateProfileCommand";
import {AuthenticatedRequest} from "../../config/AuthenticatedRequest";
import {AuthenticationMiddleware} from "../../middlewares/AuthenticationMiddleware";
import {UserDto} from "./dtos/UserDto";
import {ResetPasswordCommand} from "./commands/ResetPasswordCommand";
import {GenerateRecoveryCodeCommand} from "./commands/GenerateRecoveryCodeCommand";
import {GenerateRecoveryCode} from "../../../core/write/usecases/user/GenerateRecoveryCode";
import {AddProfilePictureCommand} from "./commands/AddProfilePictureCommand";
import {AddProfilePicture} from "../../../core/write/usecases/user/AddProfilePicture";
import { ResetPassword } from "../../../core/write/usecases/user/ResetPassword";
import { GetUserPersonalInformation } from "../../../core/read/queries/GetUserPersonalInformation";

@injectable()
@JsonController("/user")
export class UserController {
    private readonly _userDto = new UserDto();

    constructor(
        @inject(Identifiers.signUp) private readonly _signUp: SignUp,
        @inject(Identifiers.identityGateway)
        private readonly _identityGateway: IdentityGateway,
        @inject(SignIn) private readonly _signIn: SignIn,
        @inject(CreateProfile) private readonly _createProfile: CreateProfile,
        @inject(ResetPassword) private readonly _resetPassword: ResetPassword,
        @inject(GenerateRecoveryCode)
        private readonly _generateRecoveryCode: GenerateRecoveryCode,
        @inject(AddProfilePicture)
        private readonly _addProfilePicture: AddProfilePicture,
        @inject(GetUserPersonalInformation)
        private readonly _getUserPersonalInformation: GetUserPersonalInformation,
    ) {}

    @Post("/signup")
    async signup(@Res() res: Response, @Body() cmd: SignupCommand) {
        const body = SignupCommand.setProperties(cmd);
        await validateOrReject(body);

        const user = await this._signUp.execute({
            email: body.email,
            password: body.password,
        });
        const {email, id} = user.props;
        const response = this._userDto.fromDomain(user);
        const token = await this._identityGateway.encode({email, id});
        return res.status(201).send({token, user: response});
    }

    @Post("/signin")
    async signIn(@Res() res: Response, @Body() cmd: SignInCommand) {
        const body = SignInCommand.setProperties(cmd);
        await validateOrReject(body);
        const user = await this._signIn.execute({
            email: body.email,
            password: body.password,
        });
        const {email, id, phone} = user.props;
        const response = this._userDto.fromDomain(user);
        const token = await this._identityGateway.encode({email, id, phone});
        return res.status(201).send({token, user: response});
    }

    @Patch("/password/recovery")
    async generateRecoveryCode(
        @Res() res: Response,
        @Body() cmd: GenerateRecoveryCodeCommand
    ) {
        const body = GenerateRecoveryCodeCommand.setProperties(cmd);
        await validateOrReject(body);
        await this._generateRecoveryCode.execute({
            email: body.email,
        });
        return res.sendStatus(200);
    }

    @Patch("/password/reset")
    async resetPassword(
        @Res() res: Response,
        @Body() cmd: ResetPasswordCommand
    ) {
        const body = ResetPasswordCommand.setProperties(cmd);
        await validateOrReject(body);
        await this._resetPassword.execute({
            password: body.password,
            email: body.email,
            recoveryCode: body.recoveryCode,
        });
        return res.sendStatus(200);
    }

    @UseBefore(AuthenticationMiddleware)
    @Post("/profile")
    async createProfile(
        @Res() res: Response,
        @Req() req: AuthenticatedRequest,
        @Body() cmd: CreateProfileCommand
    ) {
        const body = CreateProfileCommand.setProperties(cmd);
        await validateOrReject(body);
        const {firstname, lastname, birthDate, gender} = body;
        const result = await this._createProfile.execute({
            id: req.identity.id,
            firstname,
            lastname,
            birthDate,
            gender
        });
        return res.status(200).send(result.props);
    }

    @UseBefore(AuthenticationMiddleware)
    @Patch("/picture")
    async addProfilePicture(
        @Req() req: AuthenticatedRequest,
        @Body() cmd: AddProfilePictureCommand,
        @Res() res: Response
    ) {
        const body = AddProfilePictureCommand.setProperties(cmd);
        await validateOrReject(body);

        await this._addProfilePicture.execute({
            id: req.identity.id,
            profilePicture: body.profilePicture,
        });
        return res.sendStatus(200);
    }


    @UseBefore(AuthenticationMiddleware)
    @Get("/me")
    async getUserInformation(
        @Res() res: Response,
        @Req() req: AuthenticatedRequest
    ) {
        const userInfo = await this._getUserPersonalInformation.execute({
            id: req.identity.id,
        });
        return res.status(200).send(userInfo);
    }
}
