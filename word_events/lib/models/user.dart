
import 'package:word_events/models/activity.dart';

class User {
  String? name;
  String? surname;
  int? age;
  String? email;
  String? password;
  String? location;
  String? bio;
  //List<Activity> activities;

  // Profile Photo
  // Comments and Reviews

  User({
    this.name,
    this.surname,
    this.age,
    this.email,
    this.password,
    this.location,
    this.bio,
  });

}

enum Hobies{
  football,
  trekking,
}