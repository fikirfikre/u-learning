abstract class Failure {
  
}
class ServerFailure extends Failure {}
class GeneralFailure extends Failure {}
class InvalidFailure extends Failure {
  final String errorMessage;
  InvalidFailure({required this.errorMessage});
}