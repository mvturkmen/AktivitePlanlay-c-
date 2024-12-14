import 'package:flutter/material.dart';
import 'package:word_events/models/activity.dart';
import 'package:word_events/screens/updateActivity_screen/updateActivity_widgets.dart';

class ActivityUpdatePage extends StatefulWidget {
  final Activity? activity;
  const ActivityUpdatePage({super.key, this.activity});

  @override
  State<ActivityUpdatePage> createState() => _ActivityUpdatePageState();
}

class _ActivityUpdatePageState extends State<ActivityUpdatePage> {
  @override
  Widget build(BuildContext context) {
    //return testUI(context);
    return updateUI(context,widget.activity!);
  }
}
