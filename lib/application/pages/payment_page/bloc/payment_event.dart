part of 'payment_bloc.dart';

sealed class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}
class PaymentStart extends PaymentEvent{
//   final BillingDetails billingDetails;
//   final CourseEntity course;
// const  PaymentStart({required this.billingDetails,required this.course});
  @override
  List<Object> get props => [];
}
class PaymentCreateIntent extends PaymentEvent{
  final BillingDetails billingDetails;
   final CourseEntity courses;
  const  PaymentCreateIntent({required this.billingDetails,required this.courses});
}
class PaymentConfirmIntent extends PaymentEvent{
  final String clientSecret;
  final CourseEntity courses;
 
  const PaymentConfirmIntent({required this.clientSecret,required this.courses});
}