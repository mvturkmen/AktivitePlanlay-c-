import 'dart:convert';
import 'package:word_events/models/user.dart';
import 'package:word_events/globals/api_constants.dart';
import 'package:http/http.dart' as http;


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

  // LogIn function
  Future<http.Response> authUserE(User user) async {
    final response = await http.post(
      Uri.parse(userAuthUrl),
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
  Future<List<User>> getUsers() async {
    try {
      final response = await http.get(Uri.parse(usersGetUrl));

      if(response.statusCode == 200){
        List<dynamic> responseList = json.decode(response.body);

        List<User> users = responseList.map((jsonItem) => User.fromJson(jsonItem)).toList();
        return users;
      }
      else {
        throw Exception("Failed to connect ! ${response.statusCode}");
      }

    } catch (error) {
      throw Exception("Failed to load users ! Error: $error");
    }
  }

  // Update (PUT)
  Future<http.Response> updateUser(User user, int id) async {
    try {
      final response = await http.post(Uri.parse("$userPutUrl$id"),
          headers: <String, String>{
            'Content-Type' : 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            user.toJson(),
          )
      );
      return response;
    } catch (error) {
      throw Exception("Failed when to update ! Error: $error");
    }
  }

  // Delete
  Future<http.Response> deleteUser (int id) async {
    try {
      final response = http.delete(Uri.parse("$userDeleteUrl$id"));
      return response;
    } catch (error) {
      throw Exception("Failed when delete user's data ! Error: $error");
    }
  }
}