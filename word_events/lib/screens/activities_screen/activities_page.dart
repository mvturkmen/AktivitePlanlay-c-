import 'package:flutter/material.dart';
import 'package:word_events/controllers/activity_controller.dart';
import 'package:get/get.dart';
import 'package:word_events/widgets/activity_card.dart';


class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {

  ActivityController activityController = Get.find<ActivityController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: activityController.activities.length,
          itemBuilder: (context, index) {
            var activity = activityController.activities[index];
            return ActivityCard(activity: activity);
          }
      ),
      );
  }
}
