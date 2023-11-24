import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning_app/data/Exception/exception.dart';
import 'package:learning_app/data/datasource/remote_datasource/django_remote_datasource.dart';
import 'package:http/http.dart' as http;
class DjangoRemoteDatasourceImpl extends DjanogRemoteDatasource {
  @override
  Future<String> createPaymentIntent() async{
 
    try {
        final url = Uri.parse('http://192.168.56.1:8000/ulearn/create-payment-intent/');
      final user = FirebaseAuth.instance.currentUser;
      final idToken = await user!.getIdToken();
     
         final response = await http.get(url, headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':'Bearer$idToken'});
     final jsonResponse = jsonDecode(response.body);
      return jsonResponse['clientSecret'];
   

      
    } catch (e) {
      
       throw ServerException();
    }
  }

}