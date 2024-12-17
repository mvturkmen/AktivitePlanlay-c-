import 'dart:io';

import 'package:flutter/material.dart';
import 'package:word_events/globals/app_theme.dart';
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

AppColors appColors = AppColors();

Widget updateProfileUI(BuildContext context, User user) {
  return Center(
    child: SingleChildScrollView(
      child: Column(
        children: [
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
            children: [
              AppButton(
                  label: "Update",
                  function: (){
                    editUser(context, user, user.id!);
                  }
              ),
            ],
          )
        ],
      ),
    ),
  );
}

// Repository
Future<void> editUser(BuildContext context, User user, int id) async{

  user.firstName = tfFirstNameController.text;
  user.lastName = tfLastNameController.text;
  user.birthOfDate = DateTime.parse(tfDateOfBirth.text);
  user.bio = tfBioController.text;
  user.mailProperties = tfEmailController.text;
  user.passwordString = tfPasswordController.text;

  final resp = await userService.updateUser(user, id);

  if(resp.statusCode == HttpStatus.ok){
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("User Updated Succesfully !"))
    );
    tfFirstNameController.clear();
    tfLastNameController.clear();
    tfDateOfBirth.clear();
    tfBioController.clear();
    tfEmailController.clear();
    tfPasswordController.clear();
  }
  else{
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to update . "))
    );
  }
}