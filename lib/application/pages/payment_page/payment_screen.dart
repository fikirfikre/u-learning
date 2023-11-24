import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:learning_app/application/pages/welcom_page/widget/button.dart';

import '../../../domain/entity/course_entity.dart';
import 'bloc/payment_bloc.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key,required this.courses});
  final CourseEntity courses;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Make Payment"),
        centerTitle: true,
        actions: [
          IconButton(
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
                context.read<PaymentBloc>().add(PaymentStart());
              },
              icon: const Icon(Icons.clear))
        ],
      ),
      body: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          if(state.status == PaymentStatus.initial){
            CardFormEditController controller = CardFormEditController(initialDetails: state.cardFieldInputDetails);
               return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Card Form",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              CardFormField(
                onCardChanged: (details){
                  print(details);
                  // context.read<PaymentBloc>().add(const PaymentCreateIntent(billingDetails:BillingDetails(email: "fikir@gmail.com")));
                  },
                style: CardFormStyle(
                    cursorColor: Colors.amber, placeholderColor: Colors.amber),
                controller: controller
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: GestureDetector(
                    onTap: (){
                      context.read<PaymentBloc>().add( PaymentCreateIntent(billingDetails:const BillingDetails(email: "fikir@gmail.com"),courses: widget.courses));
                    },
                      child: const CustomeButton(buttonText: "Pay")))
            ],
          );

          }
         else if (state.status == PaymentStatus.loading){
            return Center(child: CircularProgressIndicator(),);
          }
         else if(state.status == PaymentStatus.success){
            return Center(child: Text("success"),);

          }
          else if(state.status == PaymentStatus.failure){
            return Center(child: Text("something wrong"),);
          }
          else {
          return  Container();
          }
        },
      ),
    );
  }
}
