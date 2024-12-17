import 'dart:io';
import 'package:flutter/material.dart';
import 'package:word_events/models/activity.dart';
import 'package:word_events/services/activity_service.dart';
import 'package:word_events/widgets/button.dart';
import 'package:word_events/widgets/input_field.dart';

TextEditingController tfTitleController = TextEditingController();
TextEditingController tfDescriptionController = TextEditingController();
TextEditingController tfCategoryController = TextEditingController();
TextEditingController tfDateController = TextEditingController();
TextEditingController tfTeamSizeController = TextEditingController();

ActivityService activityService = ActivityService();

Widget addUI(BuildContext context) {
  return SingleChildScrollView(
    child: Center(
      child: Column(
        mainAxisAlignment:  MainAxisAlignment.center,
        children: [
          // title
          InputField(tfController: tfTitleController, tfIcon: const Icon(Icons.title), tfLabel: "Title", tfFunction: (){}),
          // description
          InputField(tfController: tfDescriptionController, tfIcon: const Icon(Icons.description), tfLabel: "Description", tfFunction: (){}),
          // category
          InputField(tfController: tfCategoryController, tfIcon: const Icon(Icons.category), tfLabel: "Category", tfFunction: (){}),
          // date
          InputField(tfController: tfDateController, tfIcon: const Icon(Icons.calendar_month), tfLabel: "Date", tfFunction: (){}),
          // teamSize
          InputField(tfController: tfTeamSizeController, tfIcon: const Icon(Icons.group_rounded), tfLabel: "Team Size", tfFunction: (){}),
    
          AppButton(
          label: "ADD",
          function: (){
            // Add activity function
            createActivity(context);
          }
          )
        ],
      ),
    ),
  );
}


// Repository
Future<void> createActivity(BuildContext context) async{
  Activity activity = Activity(
    title: tfTitleController.text,
    description: tfDescriptionController.text,
    category: tfCategoryController.text,
    timeOfActivity: DateTime.parse(tfDateController.text),
    teamSize: int.parse(tfTeamSizeController.text),
  );

  final resp = await activityService.postActivity(activity);

  if(resp.statusCode == HttpStatus.ok){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("New Activity Added !"))
    );
    tfTitleController.clear();
    tfDescriptionController.clear();
    tfCategoryController.clear();
    tfDateController.clear();
    tfTeamSizeController.clear();
  }
  else{
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to create ."))
    );
  }
}