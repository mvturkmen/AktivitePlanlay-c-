import 'package:flutter/material.dart';
import 'package:word_events/models/user.dart';
import 'package:word_events/screens/updateProfile_screen/updateProfile_widget.dart';

class UserUpdatePage extends StatefulWidget {
  final User? user;
  const UserUpdatePage({super.key, this.user});

  @override
  State<UserUpdatePage> createState() => _UserUpdatePageState();
}

class _UserUpdatePageState extends State<UserUpdatePage> {
  @override
  Widget build(BuildContext context) {
    return updateProfileUI(context, widget.user!);
  }
}
