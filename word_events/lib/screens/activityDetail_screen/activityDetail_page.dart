import 'dart:io';

import 'package:flutter/material.dart';
import 'package:word_events/models/activity.dart';
import 'package:word_events/screens/updateActivity_screen/updateActivity_screen.dart';
import 'package:word_events/services/activity_service.dart';
import 'package:word_events/widgets/button.dart';
import 'package:word_events/widgets/info_bar.dart';

class ActivityDetailPage extends StatefulWidget {
  final Activity? activity;

  ActivityDetailPage({super.key, this.activity});

  @override
  State<ActivityDetailPage> createState() => _ActivityDetailPageState();
}

class _ActivityDetailPageState extends State<ActivityDetailPage> {
  final ActivityService activityService = ActivityService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Düzenleyen: Emir',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://via.placeholder.com/300x200',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildDetailRow('Title:', widget.activity?.title ?? 'No Title'),
                  buildDetailRow('Description:', widget.activity?.description ?? 'No Description'),
                  buildDetailRow('Category:', widget.activity?.category ?? 'No Category'),
                  buildDetailRow('Time:', widget.activity?.timeOfActivity.toString()  ?? 'No Time Provided'),
                  buildDetailRow('Team Size:', widget.activity?.teamSize?.toString() ?? 'No Team Size'),
                  buildDetailRow('Location:', 'Default Location'),
                  buildDetailRow('Participants:', 'Default Participants'),
                  buildDetailRow('ID:', widget.activity?.id.toString() ?? "Unknown data"),
                ],
              ),
              AppButton(
                  label: "Join Activity",
                  function: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Joined to activity !")),
                    );
                  }
              ),
              AppButton(
                  label: "Update",
                  function: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ActivityUpdatePage(activity: widget.activity)),
                    );
                  }
              ),
              AppButton(
                  label: "Delete",
                  function: (){
                    var id = widget.activity!.id!;
                    print(id);
                    removeActivity(context, id);
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> removeActivity(BuildContext context,int id) async{
    final resp = await activityService.deleteActivity(id);

    if(resp.statusCode == HttpStatus.ok){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Activity Removed !"))
      );
      Navigator.pop(context);
    }
    else{
      print(resp.statusCode);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to delete ."))
      );
    }
  }
}

