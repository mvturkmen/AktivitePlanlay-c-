import 'package:flutter/material.dart';
import 'package:word_events/controllers/activity_controller.dart';
import 'package:get/get.dart';
import 'package:word_events/globals/app_theme.dart';
import 'package:word_events/models/activity.dart';
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
      body: FutureBuilder(
          future: _activityService.getActivities(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(
                  color: appColors.secondaryColor,
                ),
              );
            }
            else if(snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            else if(!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('There is not any activity'),
              );
            }
            else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var activityItem = snapshot.data![index];
                    return ActivityCard(activity: activityItem);
                  }
              );
            }
          }
      )
      );
  }
}


/*
StreamBuilder<List<Activity>>(
          stream: _activityService.getAllActivities(),
          builder: (context,snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                  itemBuilder: (context,index) {
                    return ActivityCard(activity: activity)
                  }
              );
            }
            else if(snapshot.hasError) {
              print("${snapshot.error}");
              return const CircularProgressIndicator();
            }

            return const CircularProgressIndicator();
          }
      )
 */