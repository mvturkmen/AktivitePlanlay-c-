import 'package:flutter/material.dart';
import 'package:word_events/controllers/activity_controller.dart';
import 'package:word_events/models/activity.dart';
import 'package:word_events/models/user.dart';
import 'package:word_events/widgets/button.dart';
import 'package:word_events/widgets/search_field.dart';
import 'package:get/get.dart';


TextEditingController tfCategoryController = TextEditingController();
TextEditingController tfLocationController = TextEditingController();
TextEditingController tfDateController = TextEditingController();
TextEditingController tfTeamSizeController = TextEditingController();

final ActivityController activityController = Get.put(ActivityController());

Widget searchUI(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Category
        SearchField(tfController: tfCategoryController, tfIcon: const Icon(Icons.category), tfLabel: "Category", tfFunction: (){ /* filter list == category */ }),
        // Location
        SearchField(tfController: tfLocationController, tfIcon: const Icon(Icons.location_pin), tfLabel: "Location", tfFunction: (){ /* filter list == location */ }),
        // Date
        SearchField(tfController: tfDateController, tfIcon: const Icon(Icons.date_range), tfLabel: "Date", tfFunction: (){ /* filter list == date */ }),
        // Team Size
        SearchField(tfController: tfTeamSizeController, tfIcon: const Icon(Icons.group_rounded), tfLabel: "Team Size", tfFunction: (){ /* filter list == teamSize */ }),

        AppButton(
            label: "Search",
            function: (){
              // filtering list function

              // test for activity card
              User user = User(name: "Emir");

              Activity activity = Activity(
                title: "Halısaha Maçı",
                category: "Futbol"
              );
              activityController.addActivity(activity);
              //

              Navigator.pushNamed(context, '/activities');
            }
        ),

      ],
    ),
  );
}