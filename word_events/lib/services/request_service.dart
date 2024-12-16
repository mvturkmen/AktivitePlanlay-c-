import 'dart:convert';
import 'package:word_events/globals/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:word_events/models/request.dart';

class RequestService {
  // Create (POST)
  Future<http.Response> postActivity(RequestModel request) async {
    try {
      final response = await http.post(
        Uri.parse(activitiePostUrl),
        headers: <String, String>{
          'Content-Type' : 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          request.toJson(),
        ),
      );
      print(response.body);
      return response;
    } catch (error){
      throw Exception("Failed when create a json data ! Error: $error");
    }

  }

  // Read (GET)
  Future<List<RequestModel>> getActivities() async {
    try {
      final response = await http.get(Uri.parse(activitiesGetUrl));

      if(response.statusCode == 200) {
        print(response.body);
        List<dynamic> responseList = json.decode(response.body);

        List<RequestModel> activities = responseList.map((jsonItem) => RequestModel.fromJson(jsonItem)).toList();
        return activities;
      }
      else {
        throw Exception("Failed to connect");
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('Failed to load activities ! Error: $error');
    }

  }


  // bu http isteği atılan kısım
  // Update (PUT)
  Future<http.Response> updateActivity(RequestModel activity, int id) async{
    try{

      final response = await http.post(Uri.parse("$activitiePutUrl$id"),
          headers: <String, String>{
            'Content-Type' : 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            activity.toJson(),
          )
      );
      if(response.statusCode == 200){
        return response;
      }
      else {
        print("Serviste hata oldu : ${response.statusCode}");
        throw Exception("Fail fail error: ${response.statusCode}");
      }
    } catch(error) {
      throw Exception("Failed when to update ! Error: $error");
    }
  }

  // Delete
  Future<http.Response> deleteActivity(int id) async{
    try {
      final response = http.delete(Uri.parse("$activitieDeleteUrl$id"));
      return response;
    } catch(error) {
      throw Exception("Failed when delete json data ! Error: $error");
    }
  }
}