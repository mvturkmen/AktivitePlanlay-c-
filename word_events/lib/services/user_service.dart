import 'dart:convert';
import 'package:get/get.dart';
import 'package:word_events/controllers/activity_controller.dart';
import 'package:word_events/globals/api_constants.dart';
import 'package:word_events/models/activity.dart';
import 'package:http/http.dart' as http;
import 'package:word_events/models/user.dart';

class UserService {
  // Create (SET)
  Future<http.Response> postUser(User user) async {
    final response = await http.post(
      Uri.parse(userPostUrl),
      headers: <String, String>{
        'Content-Type' : 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        user.toJson(),
      ),
    );
    print(response.body);
    return response;
  }

  // Read (GET)

  // Update (PUT)

  // Delete
}