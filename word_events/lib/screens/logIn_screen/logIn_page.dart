import 'package:flutter/material.dart';
import 'package:word_events/globals/app_theme.dart';
import 'package:word_events/screens/logIn_screen/logIn_widgets.dart';

final AppColors appColors = AppColors();

class LogInPage extends StatelessWidget {

  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: logIn(context),
    );
  }
}
