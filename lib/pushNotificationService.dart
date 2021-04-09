import 'dart:io';
import 'package:flutter/material.dart';
import 'package:praktikum3/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm;
  final context;
  PushNotificationService(this._fcm, this.context);

  Future getToken() async {
    String token = await _fcm.getToken();
    print("FirebaseMessaging token: $token");
    return token;
  }

  void initialise() {
    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        showDialog(
            context: context,
            builder: (context) => AlertDialog(title: Text("$message")));
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }
}
