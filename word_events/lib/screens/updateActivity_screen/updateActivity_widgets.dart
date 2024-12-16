import 'dart:io';
import 'package:flutter/material.dart';
import 'package:word_events/models/activity.dart';
import 'package:word_events/services/activity_service.dart';
import 'package:word_events/widgets/button.dart';
import 'package:word_events/widgets/input_field.dart';

import '../../globals/api_constants.dart';

TextEditingController tfTitleController = TextEditingController();
TextEditingController tfDescriptionController = TextEditingController();
TextEditingController tfCategoryController = TextEditingController();
TextEditingController tfDateController = TextEditingController();
TextEditingController tfTeamSizeController = TextEditingController();

ActivityService activityService = ActivityService();

Widget updateUI(BuildContext context, Activity activity) {
  return Scaffold(
    appBar: AppBar(title: const Text("Update Page "),centerTitle: true ,),
    body: SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // title
            InputField(tfController: tfTitleController, tfIcon: const Icon(Icons.title), tfLabel: "Title", tfHint: activity.title!, tfFunction: (){}),
            // description
            InputField(tfController: tfDescriptionController, tfIcon: const Icon(Icons.description), tfLabel: "Description", tfHint: activity.description!, tfFunction: (){}),
            // category
            InputField(tfController: tfCategoryController, tfIcon: const Icon(Icons.category), tfLabel: "Category", tfHint: activity.category!, tfFunction: (){}),
            // date
            InputField(tfController: tfDateController, tfIcon: const Icon(Icons.calendar_month), tfLabel: "Date", tfHint: "date", tfFunction: (){}),
            // teamSize
            InputField(tfController: tfTeamSizeController, tfIcon: const Icon(Icons.group_rounded), tfLabel: "Team Size", tfHint: activity.teamSize!.toString(), tfFunction: (){}),

            AppButton(
                label: "EDIT",
                function: (){
                  editActivity(context, activity, activity.id!);
                }
            )
          ],
        ),
      ),
    ),
  );
}


// edit activity function
Future<void> editActivity(BuildContext context, Activity activity, int id) async{

  activity.title = tfTitleController.text;
  activity.description = tfDescriptionController.text;
  activity.category = tfCategoryController.text;
  activity.timeOfActivity = DateTime.parse(tfDateController.text);
  activity.teamSize = int.parse(tfTeamSizeController.text);


  final resp = await activityService.updateActivity(activity,id);
  print("updatewidgetta http kodu : ${resp.statusCode}");
  if(resp.statusCode == HttpStatus.ok){
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Activity Updated Succesfully !"))
    );
    tfTitleController.clear();
    tfDescriptionController.clear();
    tfCategoryController.clear();
    tfDateController.clear();
    tfTeamSizeController.clear();
  }
  else{
    print("updateWidgetta hata oldu : ${resp.statusCode}");
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to update . "))
    );
  }
}