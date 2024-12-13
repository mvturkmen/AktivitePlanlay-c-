import 'package:flutter/material.dart';

class InfoBar extends StatelessWidget {
  String label;
  InfoBar({super.key,required this.label});

  @override
  Widget build(BuildContext context) {
    return SnackBar(content: Text(label));
  }
}
