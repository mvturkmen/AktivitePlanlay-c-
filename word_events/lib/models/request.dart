import 'package:word_events/models/activity.dart';
import 'package:word_events/models/user.dart';

class RequestModel {
  int? id;
  User? sender;
  Activity? activity;
  DateTime? requestDate;
  bool? isAccepted;

  RequestModel(
      {this.id, this.sender, this.activity, this.requestDate, this.isAccepted});

  RequestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sender =
      json['sender'] != null ? new User.fromJson(json['sender']) : null;
    activity = json['activity'] != null
        ? new Activity.fromJson(json['activity'])
        : null;
    requestDate = json['request_date'];
    isAccepted = json['isAccepted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.sender != null) {
      data['sender'] = this.sender!.toJson();
    }
    if (this.activity != null) {
      data['activity'] = this.activity!.toJson();
    }
    data['request_date'] = this.requestDate;
    data['isAccepted'] = this.isAccepted;
    return data;
  }
}