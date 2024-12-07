import 'package:flutter/material.dart';
import 'package:word_events/globals/app_theme.dart';
import 'package:word_events/widgets/button.dart';
import 'package:word_events/widgets/input_field.dart';

TextEditingController tfNameController = TextEditingController();
TextEditingController tfEmailController = TextEditingController();
TextEditingController tfPasswordController = TextEditingController();
TextEditingController tfPasswordAgainController = TextEditingController();

TextEditingController tfCodeController = TextEditingController();
late bool code_verification;

AppColors _appColors = AppColors();

Widget signUp(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Name
          InputField(tfController: tfNameController, tfIcon: const Icon(Icons.person), tfLabel: "Name", tfFunction: (){}),
          // E Mail
          InputField(tfController: tfEmailController, tfIcon: const Icon(Icons.mail), tfLabel: "Email", tfFunction: (){}),
          // Password
          InputField(tfController: tfPasswordController, tfIcon: const Icon(Icons.remove_red_eye_sharp), tfLabel: "Password", tfFunction: (){}),
          // Password Again
          InputField(tfController: tfPasswordAgainController, tfIcon: const Icon(Icons.remove_red_eye_sharp), tfLabel: "Password again", tfFunction: (){}),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [   // navigate homepage
              AppButton(
                  label: "Sign Up",
                  function: (){
                    _showMyDialog(context);
                    //Navigator.pushNamed(context, '/logIn');
                  }
              ), // navigate signup
            ],
          )
        ],
      ),
    ),
  );
}

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
              InputField(tfController: tfCodeController, tfIcon: const Icon(Icons.security), tfLabel: "Code", tfFunction: (){}),
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

