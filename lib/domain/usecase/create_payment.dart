import 'package:dartz/dartz.dart';
import 'package:learning_app/domain/failure/failure.dart';
import 'package:learning_app/domain/repository/django_repository.dart';

class PaymentWithStrip {
   DjangoRepository djangoRepository;
   PaymentWithStrip({required this.djangoRepository});
   Future<Either<String,Failure>> createPayment(){
        return djangoRepository.createPaymentIntent();
   }
}