import 'dart:convert';
import 'package:get/get.dart';
import 'package:word_events/controllers/activity_controller.dart';
import 'package:word_events/globals/api_constants.dart';
import 'package:word_events/models/activity.dart';
import 'package:http/http.dart' as http;

//
final ActivityController activityController = Get.find<ActivityController>();


class ActivityService {
  // Create (SET)

  // Read (GET)
  Future<List<Activity>> getActivities() async {
    final response = await http.get(Uri.parse(activitiesUrl));

    List<Activity> activities = [];

    List<dynamic> responseList = jsonDecode(response.body);

    for (var i = 0; i<responseList.length; i++){
      activities.add(Activity.fromJson(responseList[i]));
    }

    return activities;

    //print(response.statusCode);
    //print(response.body);
    /*
    List<Activity> list = List.empty();
    return list;
     */
  }

    // shop app api function
  Future<List<Activity>> getAllActivities() async {
    try {
      final response = await http.get(Uri.parse(activitiesUrl));

      if(response.statusCode == 200) {
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