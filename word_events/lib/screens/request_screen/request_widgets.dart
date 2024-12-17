import 'package:flutter/material.dart';
import 'package:word_events/models/request.dart';
import 'package:word_events/models/user.dart';
import 'package:word_events/widgets/request_card.dart';

AppBar appBarRequest(BuildContext context) {
  return AppBar(
    title: const Text('Requests'),
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    ),
  );
}

Widget bodyRequest() {
  return FutureBuilder<List<RequestModel>>(
    future: fetchRequests(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }
      else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      }
      else if (snapshot.hasData && snapshot.data!.isEmpty) {
        return const Center(child: Text('No requests found'));
      }
      else {
        final requests = snapshot.data!;
        return ListView.builder(
          itemCount: requests.length,
          itemBuilder: (context, index) {
            return RequestCard(request: requests[index]);
          },
        );
      }
    },
  );
}


// Sample Test function
Future<List<RequestModel>> fetchRequests() async {
  // Simulate fetching data from an API or database
  await Future.delayed(const Duration(seconds: 2));
  return [
    RequestModel(sender: User(firstName: 'Batshuayi')),
    RequestModel(sender: User(firstName: 'Ayşe Demir')),
    RequestModel(sender: User(firstName: 'Mehmet Çalışkan')),
  ];
}