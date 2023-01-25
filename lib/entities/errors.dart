abstract class Failure implements Exception {
  final String message;
  final StackTrace? stackTrace;

  const Failure(this.message, [this.stackTrace]);
}

class Error extends Failure {
  Error(super.message, [super.stackTrace]);
}
