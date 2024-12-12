import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:word_events/screens/activities_screen/activities_page.dart';
import 'package:word_events/screens/activityDetail_screen/activityDetail_page.dart';
import 'package:word_events/screens/home_screen/home_page.dart';
import 'package:word_events/screens/logIn_screen/logIn_page.dart';
import 'package:word_events/screens/profile_screen/profile_page.dart';
import 'package:word_events/screens/search_screen/search_page.dart';
import 'package:word_events/screens/signUp_screen/signUp_page.dart';
import 'package:word_events/services/activity_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /*ActivityService activityService = ActivityService();
    activityService.getAllActivities();*/

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/logIn',
      routes: {
        '/logIn': (context) => const LogInPage(),
        '/signUp': (context) => const SignUpPage(),
        '/home': (context) => const HomePage(),
        '/search': (context) => const SearchPage(),
        '/add': (context) => const SearchPage(),
        '/profile': (context) => const ProfilePage(),
        '/activities': (context) => const ActivitiesPage(),
        '/activityDetail': (context) => const ActivityDetailPage()
      },
    );
  }
}


