import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:learning_app/data/Exception/exception.dart';
import 'package:learning_app/domain/entity/course_entity.dart';
import 'package:learning_app/domain/usecase/add_courses_to_user.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final AddCourseToUserList addCourseToUserList;
  PaymentBloc({required this.addCourseToUserList}) : super(const PaymentState().copywWith(status:PaymentStatus.initial)) {
    on<PaymentStart>(_onPaymentStart);
    on<PaymentCreateIntent>(_onPaymentCreate);
    on<PaymentConfirmIntent>(_onPaymentConfirmIntent);
  }

  void _onPaymentStart(PaymentStart event, Emitter<PaymentState> emit) async {
    emit(state.copywWith(status: PaymentStatus.initial));
  }

  void _onPaymentCreate(
      PaymentCreateIntent event, Emitter<PaymentState> emit) async {
    emit(state.copywWith(
        status: PaymentStatus.loading,
        cardFieldInputDetails: CardFieldInputDetails(complete: true)));
    final pay = PaymentMethodData(billingDetails: event.billingDetails);
    try {
      final paymentMethod = await Stripe.instance.createPaymentMethod(
          params: PaymentMethodParams.card(paymentMethodData: pay));
      final paymentIntentResult = await _callPayEndpointMethodId(
          userStripeSdk: true,
          paymentMethodId: paymentMethod.id,
          course_id:event.courses.courseId,
          currency: 'usd',
          amount: '200');
      String? secret;

      
      secret = paymentIntentResult["clinetSecret"];
  
      final isRequire = paymentIntentResult["requiresAction"];
      final clinetSecret = secret == null;

      if (paymentIntentResult["clinetSecret"] != null &&
          paymentIntentResult["requiresAction"] == null) {
        emit(state.copywWith(status: PaymentStatus.success));
      }
      if (isRequire && clinetSecret) {
        final String clinetSecret = paymentIntentResult["clientSecret"];
        add(PaymentConfirmIntent(clientSecret: clinetSecret,courses: event.courses));
      }
    } on StripeException catch (e) {
      // Handle Stripe-related errors
      emit(state.copywWith(status: PaymentStatus.failure));
    } catch (e) {
      emit(state.copywWith(status: PaymentStatus.failure));
    }
  }

  void _onPaymentConfirmIntent(
      PaymentConfirmIntent event, Emitter<PaymentState> emit) async {
    try {
      final paymentIntent =
          await Stripe.instance.handleNextAction(event.clientSecret);
      if (paymentIntent.status == PaymentIntentsStatus.RequiresConfirmation) {
        Map<String, dynamic> results =
            await _callPayEndpointIntentId(paymentIntentId: paymentIntent.id);
        if (results['error'] != null) {
          emit(state.copywWith(status: PaymentStatus.failure));
        } else {
         final user =  FirebaseAuth.instance.currentUser;
          addCourseToUserList.addCourseToUserList(event.courses.courseId);
          emit(state.copywWith(status: PaymentStatus.success));
        }
      }
    } catch (e) {
      emit(state.copywWith(status: PaymentStatus.failure));
    }
  }

  Future<Map<String, dynamic>> _callPayEndpointIntentId({
    required String paymentIntentId,
  }) async {
    final url = Uri.parse('http://192.168.56.1:8000/ulearn/confirm/');
    final response = await http.post(url,
        headers: {
          'content-Type': "application/json",
        },
        body: json.encode({
          'paymentIntentId': paymentIntentId,
        }));
    return json.decode(response.body);
  }
}

Future<Map<String, dynamic>> _callPayEndpointMethodId(

    {required bool userStripeSdk,
    required String paymentMethodId,
    required String course_id, 
    required String currency,
    required String amount}) async {
  final user = FirebaseAuth.instance.currentUser;
  final idToken = await user!.getIdToken();
  try {
      final url =
      Uri.parse('http://192.168.56.1:8000/ulearn/create-payment-intent/');
  final response = await http.post(url,
      headers: {
        'content-Type': "application/json",
        "Authorization": "Bearer$idToken"
      },
      body: json.encode({
        'userStripeSdk': userStripeSdk,
        'paymentMethodId': paymentMethodId,
        'currency': currency,
        'amount': amount,
        'courses':course_id
      }));
  return json.decode(response.body);
  } catch (e) {
    throw ServerException();
  }

}
