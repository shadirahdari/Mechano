export class Identifiers {
    static readonly identityGateway = Symbol.for("identityGateway");
    static readonly passwordGateway = Symbol.for("passwordGateway");
    static readonly userRepository = Symbol.for("userRepository");
    static readonly scaVerifierRepository = Symbol.for("scaVerifierRepository");
    static readonly claimRepository = Symbol.for("claimRepository");
    static readonly profileRepository = Symbol.for("profileRepository");
    static readonly vehicleRepository = Symbol.for("vehicleRepository");
    static readonly recipientRepository = Symbol.for("recipientRepository");
    static readonly storageGateway = Symbol.for("storageGateway");
    static readonly emailGateway = Symbol.for("emailGateway");
    static readonly pushNotificationGateway = Symbol.for(
        "pushNotificationGateway"
    );
    static readonly personalInformationReadModelRepository = Symbol.for(
        "personalInformationReadModelRepository"
    );
    static readonly identityCheckRepository = Symbol.for(
        "identityCheckRepository"
    );
    static readonly signUp = Symbol.for("signUpRepository");
}
