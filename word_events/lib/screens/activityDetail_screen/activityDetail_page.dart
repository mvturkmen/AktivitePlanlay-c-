import 'package:flutter/material.dart';
import 'package:word_events/models/activity.dart';
import 'package:word_events/screens/activityDetail_screen/activityDetail_widgets.dart';

class ActivityDetailPage extends StatelessWidget {
  final Activity? activity;
  ActivityDetailPage({super.key,this.activity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Details'),
        centerTitle: true,
      ),
      body: detailUI(context, activity!),
    );
  }
}



