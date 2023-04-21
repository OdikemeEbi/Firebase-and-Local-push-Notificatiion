// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class Noti {
//   static Future initialize(
//       FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
//     var androidInitialize =
//         new AndroidInitializationSettings('mipmap/ic_launcher');
//     var iOSInitialize = IOSInitializationSettings();
//     var initializationSettings = new InitializationSettings(
//         android: androidInitialize, iOS: iOSInitialize);
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }

//   static Future showBigTextNotification(
//       {var id = 0,
//       required String title,
//       required String body,
//       var payload,
//       required FlutterLocalNotificationsPlugin fln}) async {
//     AndroidNotificationDetails androidPlatformChannelSpecifics =
//         new AndroidNotificationDetails('channelId', 'channelName',
//             playSound: true,
//             sound: RawResourceAndroidNotificationSound('notification'),
//             importance: Importance.max,
//             priority: Priority.high);

//     var not = NotificationDetails(
//         android: androidPlatformChannelSpecifics,
//         iOS: IOSNotificationDetails());
//     await fln.show(0, title, body, not);
//   }
// }

// THE ABOVE CODE SNIPPET IS FOR PLATFRM ANDROID AND IOS

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Noti {
  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize =
        new AndroidInitializationSettings('mipmap/ic_launcher');
    var initializationSettings =
        new InitializationSettings(android: androidInitialize);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future showBigTextNotification(
      {var id = 0,
      required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        new AndroidNotificationDetails("my_channel", 'channelName',
            playSound: true,
            // sound: RawResourceAndroidNotificationSound('notification'),
            importance: Importance.max,
            priority: Priority.high);

    var not = NotificationDetails(android: androidPlatformChannelSpecifics);
    await fln.show(0, title, body, not);
  }
}
