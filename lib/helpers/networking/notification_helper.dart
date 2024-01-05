// import 'dart:convert';
// import 'dart:developer';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import '../../main.dart';

// class NotificationHelper {
//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   void initialize() {
//     const InitializationSettings settings = InitializationSettings(
//       android: AndroidInitializationSettings('@drawable/ic_notification'),
//       iOS: DarwinInitializationSettings(),
//     );
//     _flutterLocalNotificationsPlugin.initialize(
//       settings,
//       onDidReceiveNotificationResponse: tapNotification,
//       onDidReceiveBackgroundNotificationResponse: tapNotification,
//     );
//   }

//   void display(RemoteMessage message) async {
//     try {
//       var android = const AndroidNotificationDetails(
//         "guider",
//         "guider chanel",
//         importance: Importance.high,
//         priority: Priority.high,
//         channelDescription: "guider description",
//         colorized: true,
//         color: Color(0xffC8284C),
//       );
//       var iOS = const DarwinNotificationDetails();
//       var platform = NotificationDetails(android: android, iOS: iOS);
//       _flutterLocalNotificationsPlugin.show(
//         0,
//         message.notification!.title,
//         message.notification!.body,
//         platform,
//         payload: json.encode(message.data),
//       );
//     } catch (e) {
//       log(e.toString());
//     }
//   }
// }
