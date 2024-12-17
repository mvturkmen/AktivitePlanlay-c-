import 'package:flutter/material.dart';
import 'package:word_events/globals/app_theme.dart';
import 'package:word_events/models/activity.dart';
import 'package:word_events/services/activity_service.dart';
import 'package:word_events/widgets/activity_card.dart';

final ActivityService _activityService = ActivityService();
final AppColors appColors = AppColors();

Widget activitiesUI() {
  return StreamBuilder(
      stream: Stream<List<Activity>>.fromFuture(_activityService.getActivities()),
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
  );
}