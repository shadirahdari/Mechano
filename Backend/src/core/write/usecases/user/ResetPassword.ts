import {inject, injectable} from "inversify";
import {UserRepository} from "../../domain/repositories/UserRepository";
import {Usecase} from "ddd";
import {Identifiers} from "../../../Identifiers";
import {PasswordGateway} from "../../domain/gateway/PasswordGateway";
import {EventDispatcher} from "ddd";
import {UserErrors} from "../../domain/errors/UserErrors";


export interface ResetPasswordInput {
  email: string;
  recoveryCode: string;
  password: string;
}

@injectable()
export class ResetPassword implements Usecase<ResetPasswordInput, void> {

  constructor(
    @inject(Identifiers.userRepository)
    private readonly userRepository: UserRepository,
    @inject(Identifiers.passwordGateway)
    private readonly passwordGateway: PasswordGateway,
    @inject(EventDispatcher)
    private readonly eventDispatcher: EventDispatcher,
  ) {}

  async execute(request: ResetPasswordInput): Promise<void> {
     const { password, recoveryCode, email } = request;
     const user = await this.userRepository.getByEmail(email);
     if(!user) {
         throw new UserErrors.UserNotFound();
     }
     const encryptedPassword = await this.passwordGateway.encrypt(password);
     user.resetPassword({
       password: encryptedPassword,
       recoveryCode,
     })
     await this.userRepository.save(user);
     await this.eventDispatcher.dispatch(user);
     return;
  }
}
