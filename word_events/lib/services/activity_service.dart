import 'dart:convert';
import 'package:get/get.dart';
import 'package:word_events/controllers/activity_controller.dart';
import 'package:word_events/globals/api_constants.dart';
import 'package:word_events/models/activity.dart';
import 'package:http/http.dart' as http;

//
//final ActivityController activityController = Get.find<ActivityController>();


class ActivityService {
  // Create (POST)
  Future<http.Response> postActivity(Activity activity) async {
    final response = await http.post(
      Uri.parse(activitiePostUrl),
      headers: <String, String>{
        'Content-Type' : 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        activity.toJson(),
      ),
    );
    print(response.body);
    return response;
  }

  // Read (GET)
  Future<List<Activity>> getActivities() async {
    try {
      final response = await http.get(Uri.parse(activitiesGetUrl));

      if(response.statusCode == 200) {
        print(response.body);
        List<dynamic> responseList = json.decode(response.body);

        var activities = responseList.map((jsonItem) => Activity.fromJson(jsonItem)).toList();
        return activities;
      }
      else {
        throw Exception("Failed to load activities");
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('Failed to load activities');
    }



    //print(response.statusCode);
    //print(response.body);
    /*
    List<Activity> list = List.empty();
    return list;
     */
  }


  // Update

  // Delete
}