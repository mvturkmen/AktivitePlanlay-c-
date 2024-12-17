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
      json['sender'] != null ? User.fromJson(json['sender']) : null;
    activity = json['activity'] != null
        ? Activity.fromJson(json['activity'])
        : null;
    requestDate = json['request_date'];
    isAccepted = json['isAccepted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (sender != null) {
      data['sender'] = sender!.toJson();
    }
    if (activity != null) {
      data['activity'] = activity!.toJson();
    }
    data['request_date'] = requestDate;
    data['isAccepted'] = isAccepted;
    return data;
  }
}