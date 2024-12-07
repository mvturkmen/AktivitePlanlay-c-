import 'package:flutter/material.dart';
import 'package:word_events/models/user.dart';

class Activity {
  User admin;
  String title;
  String description;
  String location;
  Category category;
  DateTime dateTime;
  TimeOfDay timeOfDay;
  User organizer;
  int maxTeamSize;
  List<User> attendedUsers;
  List<String> equipment;

  // Media about activity
  // Join requests

  Activity({
    required this.admin,
    required this.title,
    required this.description,
    required this.location,
    required this.category,
    required this.dateTime,
    required this.timeOfDay,
    required this.organizer,
    required this.maxTeamSize,
    required this.attendedUsers,
    required this.equipment
  });
}

enum Category{
  football,
  trekking,
}