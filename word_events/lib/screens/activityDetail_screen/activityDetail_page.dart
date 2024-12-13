import 'package:flutter/material.dart';
import 'package:word_events/models/activity.dart';
import 'package:word_events/widgets/button.dart';
import 'package:word_events/widgets/info_bar.dart';

class ActivityDetailPage extends StatelessWidget {
  final Activity? activity;

  const ActivityDetailPage({super.key, this.activity});

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
                  buildDetailRow('Title:', activity?.title ?? 'No Title'),
                  buildDetailRow('Description:', activity?.description ?? 'No Description'),
                  buildDetailRow('Category:', activity?.category ?? 'No Category'),
                  buildDetailRow('Time:', activity?.timeOfActivity ?? 'No Time Provided'),
                  buildDetailRow('Team Size:', activity?.teamSize?.toString() ?? 'No Team Size'),
                  buildDetailRow('Location:', 'Default Location'),
                  buildDetailRow('Participants:', 'Default Participants'),
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
}

