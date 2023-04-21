import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_notification/main.dart';
import 'package:firebase_notification/services/local_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String notificationMsg = 'Waiting for Notification';
  @override
  void initState() {
    super.initState();
    Noti.initialize(flutterLocalNotificationsPlugin);
    FirebaseMessaging.instance.getInitialMessage().then((event) {
      if (event != null) {
        setState(() {
          notificationMsg =
              '${event.notification!.title}${event.notification!.body} I am coming from terminated state';
        });
      }
    });
    FirebaseMessaging.onMessage.listen((event) {
      setState(() {
        notificationMsg =
            '${event.notification!.title}${event.notification!.body} I am coming from foreground';
      });
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      setState(() {
        notificationMsg =
            '${event.notification!.title}${event.notification!.body} I am coming from background';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(Noti.initialize(flutterLocalNotificationsPlugin));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Notification'),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              notificationMsg,
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Noti.showBigTextNotification(
                    title: 'Notification',
                    body: 'this is the new message',
                    fln: flutterLocalNotificationsPlugin);
              },
              child: const Text('Send message'))
        ],
      ),
    );
  }
}
