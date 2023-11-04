abstract class Exception {}

class ServerException implements Exception {}
class GeneralExceptio implements Exception {}
class InvalidEmailException implements Exception{
  final String errorMessage;
  InvalidEmailException({required this.errorMessage});
}