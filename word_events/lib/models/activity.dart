import 'package:flutter/material.dart';
import 'package:word_events/models/user.dart';

class Activity {
  int? id;
  String? title;
  String? description;
  String? category;
  String? timeOfActivity;
  int? teamSize;

  Activity(
      {this.id,
        this.title,
        this.description,
        this.category,
        this.timeOfActivity,
        this.teamSize});

  Activity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    timeOfActivity = json['timeOfActivity'];
    teamSize = json['teamSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['category'] = category;
    data['timeOfActivity'] = timeOfActivity;
    data['teamSize'] = teamSize;
    return data;
  }
}




/*
class Activity {
  // int id;
  User? admin;
  String? title;
  String? description;
  String? location;
  // Category category
  String? category;
  DateTime? dateTime;
  TimeOfDay? timeOfActivity;
  User? organizer;
  int? maxTeamSize;
  List<User>? attendedUsers;
  List<String>? equipment;

  // Media about activity
  // Join requests

  Activity({
    this.admin,
    this.title,
    this.description,
    this.location,
    this.category,
    this.dateTime,
    this.timeOfActivity,
    this.organizer,
    this.maxTeamSize,
    this.attendedUsers,
    this.equipment
  });
}

enum Category{
  football,
  trekking,
}
*/
