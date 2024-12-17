
class Activity {
  int? id;
  String? title;
  String? description;
  String? category;
  DateTime? timeOfActivity;
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
    timeOfActivity = json['timeOfActivity'] != null
        ? DateTime.parse(json['timeOfActivity'])
        : null;
    teamSize = json['teamSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['category'] = category;
    data['timeOfActivity'] = timeOfActivity?.toIso8601String();
    data['teamSize'] = teamSize;
    return data;
  }
}
