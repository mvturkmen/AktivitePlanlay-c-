import 'package:get/get.dart';
import 'package:word_events/models/activity.dart';

class ActivityController extends GetxController{
  List<Activity> activities = <Activity>[].obs;

  void addActivity(Activity activity){
    activities.add(activity);
  }
}