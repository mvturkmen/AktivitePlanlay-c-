import 'package:flutter/material.dart';
import 'package:word_events/widgets/button.dart';
import 'package:word_events/widgets/input_field.dart';

TextEditingController tfTitleController = TextEditingController();
TextEditingController tfDescriptionController = TextEditingController();
TextEditingController tfCategoryController = TextEditingController();
TextEditingController tfDateController = TextEditingController();
TextEditingController tfTeamSizeController = TextEditingController();

Widget addUI(BuildContext context) {
  return Center(
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
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("New Activity Posted")),
          );
        }
        )
      ],
    ),
  );
}