abstract class Failure {
  final String genericMessage;
  final String message;
  final StackTrace stackTrace;
  Failure(this.genericMessage, this.message, this.stackTrace);
}

class EmptyFailure extends Failure {
  EmptyFailure(super.genericMessage, super.message, super.stackTrace);
}

class UnknownFailure extends Failure {
  UnknownFailure(super.genericMessage, super.message, super.stackTrace);
}
