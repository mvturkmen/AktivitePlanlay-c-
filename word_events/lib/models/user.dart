
import 'package:word_events/models/activity.dart';

class User {
  String name;
  String surname;
  int age;
  String email;
  String phoneNo;
  String password;
  String location;
  String bio;
  List<Activity> activities;

  // Profile Photo
  // Comments and Reviews

  User({
    required this.name,
    required this.surname,
    required this.age,
    required this.email,
    required this.phoneNo,
    required this.password,
    required this.location,
    required this.bio,
    required this.activities
  });

}

enum Hobies{
  football,
  trekking,
}