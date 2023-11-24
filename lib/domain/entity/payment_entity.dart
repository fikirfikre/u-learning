import 'package:equatable/equatable.dart';

class PaymentEntity extends Equatable{
  final String paymentId;
  final String userId;
  final String courseId;
  final String amount;

  PaymentEntity({required this.paymentId,required this.userId,required this.courseId,required this.amount});


  @override
  // TODO: implement props
  List<Object?> get props => [paymentId,userId,courseId,amount];}
