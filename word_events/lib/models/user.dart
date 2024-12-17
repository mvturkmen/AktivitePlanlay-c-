
class User {
  int? id;
  String? firstName;
  String? lastName;
  DateTime? birthOfDate;
  String? mailProperties;
  String? passwordString;
  String? bio;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.birthOfDate,
        this.mailProperties,
        this.passwordString,
        this.bio});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    birthOfDate = json['birthOfDate'] != null
      ? DateTime.parse(json['birthOfDate'])
      : null;
    //birthOfDate = json['birthOfDate'];
    mailProperties = json['mailProperties'];
    passwordString = json['passwordString'];
    bio = json['bio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = firstName;
    data['lastName'] = lastName;
    data['birthOfDate'] = birthOfDate?.toIso8601String();
    data['mailProperties'] = mailProperties;
    data['password'] = passwordString;
    data['bio'] = bio;
    return data;
  }
}


/*
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
*/

