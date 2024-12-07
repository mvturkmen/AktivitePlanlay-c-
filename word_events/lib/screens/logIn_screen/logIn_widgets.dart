import 'package:flutter/material.dart';
import 'package:word_events/globals/app_theme.dart';
import 'package:word_events/widgets/button.dart';
import 'package:word_events/widgets/input_field.dart';

TextEditingController tfNameController = TextEditingController();
TextEditingController tfSurnameController = TextEditingController();
TextEditingController tfAgeController = TextEditingController();
TextEditingController tfEmailController = TextEditingController();
TextEditingController tfPhoneNoController = TextEditingController();
TextEditingController tfPasswordController = TextEditingController();
TextEditingController tfLocationController = TextEditingController();
TextEditingController tfHobiesController = TextEditingController();
TextEditingController tfBiographyController = TextEditingController();

Widget logIn(BuildContext context){
  return Center(
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("Welcome the World Event App !",style: TextStyle(color: Color(0xFF4C4B16),height: 10,fontSize: 25),),
          InputField(tfController: tfEmailController, tfIcon: const Icon(Icons.mail), tfLabel: "Email", tfFunction: (){}),
          InputField(tfController: tfPhoneNoController, tfIcon: const Icon(Icons.phone), tfLabel: "Phone No", tfFunction: (){}),
          InputField(tfController: tfPasswordController, tfIcon: const Icon(Icons.remove_red_eye), tfLabel: "Password", tfFunction: (){}),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButton(label: "Log In", function: (){Navigator.pushNamed(context, '/home');}),   // navigate homepage
              AppButton(label: "Sign Up", function: (){Navigator.pushNamed(context, '/signUp');}), // navigate signup
            ],
          )
        ],
      ),
    ),
  );
}