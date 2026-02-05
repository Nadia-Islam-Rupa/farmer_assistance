abstract class Failures {}

class UserNotFoundFailure extends Failures {}

class InvalidCredentialFailure extends Failures {}

class UserDisabledFailure extends Failures {}

class WrongPasswordFailure extends Failures {}

class GeneralFailure extends Failures {
  String message;
  GeneralFailure(this.message);
}

class InvalidEmailFailure extends Failures {}

class UnknownAuthFailure extends Failures {}

class EmailAlreadyInUseFailure extends Failures {}

class WeakPasswordFailure extends Failures {}

class UserMismatchFailure extends Failures {}

class UnexpectedFailure extends Failures {
  String message;
  UnexpectedFailure(this.message);
}

class NullFailure extends Failures {}
