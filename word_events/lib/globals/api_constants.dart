
import '../models/user.dart';

const String link =
      "https://166e-151-135-32-167.ngrok-free.app"
  ;

  // Activities links
    // Get
    const String activitiesGetUrl =
        "$link/rest/api/activity/list"
    ;
    // Post
    const String activitiePostUrl =
        "$link/rest/api/activity/save"
    ;
    // Put
    const String activitiePutUrl =
        "$link/rest/api/activity/update/"
    ;
    // Delete
    const String activitieDeleteUrl =
        "$link/rest/api/activity/delete/"
    ;

  // Users links
    // Get
    const String usersGetUrl =
        "$link/rest/api/user/list"

    ;
    // Post
    const String userPostUrl =
        //"$link/rest/api/user/save"
    // /authenticate
        "$link/register"
    ;

    const String userAuthUrl =
        "$link/authenticate"
    ;

    // Put
    const String userPutUrl =
        "$link/rest/api/activity/update/"
    ;
    // Delete
    const String userDeleteUrl =
        "$link/rest/api/activity/delete/"
    ;

  // Request links
    // Get
    const String requestssGetUrl =
        "$link/rest/api/user/list"
    ;
    // Post
    const String requestPostUrl =
        "$link/rest/api/user/save"
    ;
    // Put
    const String requestPutUrl =
        "$link/rest/api/activity/update/"
    ;
    // Delete
    const String requestDeleteUrl =
        "$link/rest/api/activity/delete/"
    ;



    // Tokens
    String passwordToken = "";
    String accessToken = "";

    // Active User
    User activeUser = User();