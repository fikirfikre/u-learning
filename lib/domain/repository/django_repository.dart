import 'package:dartz/dartz.dart';
import 'package:learning_app/domain/failure/failure.dart';

abstract class DjangoRepository{
  Future<Either<String,Failure>> createPaymentIntent();
}