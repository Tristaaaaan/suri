import 'dart:convert';
import 'dart:developer' as devtools show log;

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:suri/config/app_config.dart';
import 'package:suri/config/app_environments.dart';

// @pragma('vm:entry-point')
// Future<void> handleBackgroundMessage(RemoteMessage message) async {
//   devtools.log('Handling a background message ${message.messageId}');
//   devtools.log(message.data.toString());
//   showNotification(message);
// }

void showNotification(RemoteMessage message) {
  AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: message.messageId.hashCode,
      channelKey: 'high_importance_channel',
      title: message.notification?.title,
      body: message.notification?.body,
    ),
  );
}

class FirebaseMessage {
  final firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await firebaseMessaging.requestPermission();

    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }

    AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'high_importance_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: const Color(0xFF9D50DD),
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          defaultRingtoneType: DefaultRingtoneType.Notification,
          enableLights: true,
          enableVibration: true,
          vibrationPattern: highVibrationPattern,
          onlyAlertOnce: true,
        )
      ],
    );

    AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) {
        if (!isAllowed) {
          // Request permission to send notifications
          AwesomeNotifications().requestPermissionToSendNotifications().then(
            (isAllowed) {
              if (isAllowed) {
                devtools.log('User allowed notifications');
              } else {
                devtools.log('User denied notifications');
              }
            },
          );
        }
      },
    );

    await firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    // FirebaseMessaging.onMessage.listen(
    //   (RemoteMessage message) async {
    //     if (message.notification != null) {
    //       showNotification(message);
    //       // int id = Random().nextInt(1000000);
    //       // await AwesomeNotifications().createNotification(
    //       //   content: NotificationContent(
    //       //     id: id,
    //       //     channelKey: 'high_importance_channel',
    //       //     title: message.data['title'],
    //       //     body: message.data['body'],
    //       //     actionType: ActionType.SilentAction,
    //       //     notificationLayout: NotificationLayout.Default,
    //       //     payload: {},
    //       //   ),
    //       // );
    //       // print("message: ${message.toMap()}");
    //     }
    //   },
    // );
  }

  Future<String?> getFCMToken() async {
    return await firebaseMessaging.getToken();
  }

  Future<bool> sendPushMessage({
    required String recipientToken,
    required String title,
    required String body,
    required String route,
    String? classId,
    String? tutorId,
  }) async {
    String path;
    String senderId;
    if (AppConfig.environment == Flavors.production) {
      path = 'lib/structure/messaging/ServiceAccountKeyProduction.json';

      senderId = '378925058177';
    } else {
      path = 'lib/structure/messaging/ServiceAccountKeyDevelopment.json';
      senderId = '188110141525';
    }

    String credentialsJson = await rootBundle.loadString(path);

    Map<String, dynamic> credentials = json.decode(credentialsJson);
    final client = await clientViaServiceAccount(
      ServiceAccountCredentials.fromJson(credentials),
      ['https://www.googleapis.com/auth/cloud-platform'],
    );

    final notificationData = {
      'message': {
        'token': recipientToken,
        'notification': {
          'title': title,
          'body': body,
        },
      },
    };

    final response = await client.post(
      Uri.parse(
          'https://fcm.googleapis.com/v1/projects/$senderId/messages:send'),
      headers: {
        'content-type': 'application/json',
      },
      body: jsonEncode(notificationData),
    );

    client.close();
    if (response.statusCode == 200) {
      return true; // Success!
    }

    devtools.log(
        'Notification Sending Error Response status: ${response.statusCode}');
    devtools.log('Notification Response body: ${response.body}');
    return false;
  }
}
