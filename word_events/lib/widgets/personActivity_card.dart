
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:word_events/models/activity.dart';
import 'package:word_events/screens/add_screen/add_widgets.dart';
import 'package:word_events/screens/updateActivity_screen/updateActivity_screen.dart';
import 'package:word_events/services/activity_service.dart';

class PersonActivityCard extends StatelessWidget {
  final Activity activity;

  const PersonActivityCard({super.key,required this.activity});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      color: const Color(0xFF31363F),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sol Sütun - Network Image + Saydam Title
            Expanded(
              flex: 3,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://cdn.pixabay.com/photo/2024/01/03/19/37/photography-8486085_1280.jpg", // Default Resim
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Saydam Background Üzerinde Title
                  Container(
                    height: 30,
                    width: double.infinity,
                    color: Colors.black54,
                    alignment: Alignment.center,
                    child: Text(
                      activity.title ?? "No Title",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 100),
            // Sağ Sütun - Tarih, TeamSize ve Butonlar
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Aktivite Tarihi
                  Text(
                    "Date: ${_formatDate(activity.timeOfActivity)}",
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 6),
                  // Team Size
                  Text(
                    "Team Size: ${activity.teamSize ?? 'N/A'}",
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                  // Edit ve Delete Butonları
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: (){
                          // update activity
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ActivityUpdatePage(activity: activity)),
                          );
                        },
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        tooltip: "Edit",
                      ),
                      IconButton(
                        onPressed: (){
                          // delete activity
                          //removeActivity(context, activity.id!);
                          _showMyDialog(context, activity.id!);
                        },
                        icon: const Icon(Icons.delete, color: Colors.red),
                        tooltip: "Delete",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Tarihi düzgün formatlamak için yardımcı method
  String _formatDate(DateTime? date) {
    if (date == null) return "Not Set";
    return "${date.day}/${date.month}/${date.year}";
  }

  void _showMyDialog(BuildContext context, int id) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Do you want to delete ? "),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("This action cannot be undone"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                removeActivity(context, id);
                //Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),

          ],
        );
      },
    );
  }

  Future<void> removeActivity (BuildContext context, int id) async {
    final resp = await activityService.deleteActivity(id);

    if(resp.statusCode == HttpStatus.ok){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Activity Removed !"))
      );
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to delete ."))
      );
    }
  }
}
