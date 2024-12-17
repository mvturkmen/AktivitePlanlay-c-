import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:word_events/globals/api_constants.dart';
import 'package:word_events/models/token.dart';
import 'package:word_events/models/user.dart';
import 'package:word_events/services/user_service.dart';
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

UserService userService = UserService();

Widget logIn(BuildContext context){
  return Center(
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("Welcome the World Event App !",style: TextStyle(color: Color(0xFF4C4B16),height: 10,fontSize: 25),),
          // Name
          InputField(tfController: tfNameController, tfIcon: const Icon(Icons.person), tfLabel: "firstname", tfFunction: (){}),
          // Password
          InputField(tfController: tfPasswordController, tfIcon: const Icon(Icons.remove_red_eye), tfLabel: "Password", tfFunction: (){}),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButton(label: "Log In", function: (){
                authUser(context);0;
                //Navigator.pushNamed(context, '/home');
              }),   // navigate homepage
              AppButton(label: "Sign Up", function: (){Navigator.pushNamed(context, '/signUp');}), // navigate signup
            ],
          )
        ],
      ),
    ),
  );
}


// Repository function
Future<void> authUser(BuildContext context) async{
  User user = User(
    firstName: tfNameController.text,
    passwordString: tfPasswordController.text,
  );

  final resp = await userService.authUserE(user);

  if(resp.statusCode == HttpStatus.ok){
    // JSON'u parse et
    final responseBody = jsonDecode(resp.body);

    // Token nesnesine ata
    final token = Token.fromJson(responseBody);

    // Global değişkene atama
    accessToken = token.accessToken!;

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Success !"))
    );
    tfNameController.clear();
    tfPasswordController.clear();

    Navigator.pushNamed(context, '/home');
  }
  else{
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to LogIn ."))
    );
  }
}