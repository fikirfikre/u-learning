import 'package:dartz/dartz.dart';
import 'package:learning_app/data/datasource/remote_datasource/django_remote_datasource.dart';
import 'package:learning_app/data/datasource/remote_datasource/django_remote_datasourceImpl.dart';
import 'package:learning_app/domain/repository/django_repository.dart';

import '../../domain/failure/failure.dart';

class DjangoRepositoryImpl extends DjangoRepository{
  DjanogRemoteDatasource djanogRemoteDatasource;
  DjangoRepositoryImpl({required this.djanogRemoteDatasource});
  @override
  Future<Either<String,Failure>> createPaymentIntent() async{
     try {
     final  result = await djanogRemoteDatasource.createPaymentIntent();
     return left(result);
     } catch (e) {
       return right(ServerFailure());
     }
  }

}