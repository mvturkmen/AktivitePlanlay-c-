import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:word_events/globals/api_constants.dart';
import 'package:word_events/globals/app_theme.dart';
import 'package:word_events/models/token.dart';
import 'package:word_events/models/user.dart';
import 'package:word_events/services/user_service.dart';
import 'package:word_events/widgets/button.dart';
import 'package:word_events/widgets/input_field.dart';

TextEditingController tfFirstNameController = TextEditingController();
TextEditingController tfLastNameController = TextEditingController();
TextEditingController tfDateOfBirth = TextEditingController();
TextEditingController tfBioController = TextEditingController();
TextEditingController tfEmailController = TextEditingController();
TextEditingController tfPasswordController = TextEditingController();

UserService userService = UserService();

TextEditingController tfCodeController = TextEditingController();
late bool code_verification;

AppColors _appColors = AppColors();

Widget signUp(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // FirstName
          InputField(tfController: tfFirstNameController, tfIcon: const Icon(Icons.person), tfLabel: "Name", tfFunction: (){}),
          // LastName
          InputField(tfController: tfLastNameController, tfIcon: const Icon(Icons.person), tfLabel: "SurName", tfFunction: (){}),
          // Date of Birth
          InputField(tfController: tfDateOfBirth, tfIcon: const Icon(Icons.person), tfLabel: "BirthDay", tfFunction: (){}),
          // Biography
          InputField(tfController: tfBioController, tfIcon: const Icon(Icons.remove_red_eye_sharp), tfLabel: "Biography", tfFunction: (){}),
          // E Mail
          InputField(tfController: tfEmailController, tfIcon: const Icon(Icons.mail), tfLabel: "Email", tfFunction: (){}),
          // Password
          InputField(tfController: tfPasswordController, tfIcon: const Icon(Icons.remove_red_eye_sharp), tfLabel: "Password", tfFunction: (){}),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [   // navigate homepage
              AppButton(
                  label: "Sign Up",
                  function: (){
                    createUser(context);
                    // KULLANILMAYAN DOĞRULAMA _showMyDialog(context);
                  }
              ), // navigate signup
            ],
          )
        ],
      ),
    ),
  );
}

// Unused functions
void _showMyDialog(BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Verification Code"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text("We sent a code to your ${tfEmailController.text} account"),
              //InputField(tfController: tfCodeController, tfIcon: const Icon(Icons.security), tfLabel: "Code", tfFunction: (){}),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              _codeVerification(context);
              //Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),

        ],
      );
    },
  );
}
void _codeVerification(BuildContext context) async {
  String correctCode = "drogba"; // API process

  if (tfCodeController.text == correctCode) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Verification Successful")),
    );
    Navigator.pushNamed(context, '/home');

    return;
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: Text(
            "Verification Failed",
            style: TextStyle(color: _appColors.secondaryColor),
        )
    ),
  );
}


// Repository
Future<void> createUser(BuildContext context) async{
  User user = User(
    firstName: tfFirstNameController.text,
    lastName: tfLastNameController.text,
    birthOfDate: DateTime.parse(tfDateOfBirth.text),
    bio: tfBioController.text,
    mailProperties: tfEmailController.text,
    passwordString: tfPasswordController.text,
  );

  final resp = await userService.postUser(user);

  if(resp.statusCode == HttpStatus.ok){
    // JSON'u parse et
    final responseBody = jsonDecode(resp.body);

    // Token nesnesine ata
    final token = Token.fromJson(responseBody);

    // Global değişkene atama
    passwordToken = token.password!;

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("New User Added !"))
    );
    Navigator.pop(context);
  }
  else{
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to signUp ."))
    );
  }
}
