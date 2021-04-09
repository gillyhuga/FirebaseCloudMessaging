import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:praktikum3/pushNotificationService.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String _token = "";

  @override
  void initState() {
    final pushNotificationService =
        PushNotificationService(_firebaseMessaging, context);
    pushNotificationService.initialise();
    pushNotificationService.getToken().then((value) {
      setState(() {
        _token = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sd"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(_token)],
        ),
      ),
    );
  }
}
