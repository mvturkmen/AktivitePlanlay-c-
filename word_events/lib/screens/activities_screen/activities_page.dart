import 'package:flutter/material.dart';
import 'package:word_events/globals/app_theme.dart';
import 'package:word_events/models/activity.dart';
import 'package:word_events/screens/activities_screen/activities_widgets.dart';
import 'package:word_events/services/activity_service.dart';
import 'package:word_events/widgets/activity_card.dart';


class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {

  final ActivityService _activityService = ActivityService();
  final AppColors appColors = AppColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: activitiesUI(),
    );
  }
}
