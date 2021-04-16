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
  String day = "";
  String course = "";
  String lab = "";
  String seat = "";
  String clock = "";
  // String _messageText = "";

  @override
  void initState() {
    final pushNotificationService =
        PushNotificationService(_firebaseMessaging, context);
    pushNotificationService.getToken().then((value) {
      setState(() {
        _token = value;
      });
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        setState(() {
          day = message['data']['day'];
          course = message['data']['course'];
          lab = message['data']['lab'];
          seat = message['data']['seat'];
          clock = message['data']['clock'];
        });
        print("onMessage: $message");

        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: Container(
                    height: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (message['notification']['title']),
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          (message['notification']['body']),
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Oke"),
                    )
                  ],
                ));
      },
      onLaunch: (Map<String, dynamic> message) async {
        setState(() {
          day = message['data']['day'];
          course = message['data']['course'];
          lab = message['data']['lab'];
          seat = message['data']['seat'];
          clock = message['data']['clock'];
        });
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        setState(() {
          day = message['data']['day'];
          course = message['data']['course'];
          lab = message['data']['lab'];
          seat = message['data']['seat'];
          clock = message['data']['clock'];
        });

        print("onResume: $message");
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: Container(
                    height: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (message['notification']['title'] ?? "null"),
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          (message['notification']['body'] ?? "null"),
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Oke"),
                    )
                  ],
                ));
      },
    );

    super.initState();
  }

  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Jadwal Praktikum"),
          backgroundColor: Colors.teal,
        ),
        body: ListView(children: <Widget>[
          pressed
              ? Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      width: MediaQuery.of(context).size.height * 100,
                      height: 55,
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          day,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.height * 100,
                        color: Color(0xffFFFFFF),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  course,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.schedule,
                                                    size: 16,
                                                    color: Colors.teal,
                                                  ),
                                                  Text(
                                                    clock,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color(0xffA0A0A0),
                                                    ),
                                                  ),
                                                ],
                                              ))),
                                      Container(
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.meeting_room,
                                                    size: 16,
                                                    color: Colors.teal,
                                                  ),
                                                  Text(
                                                    lab,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color(0xffA0A0A0),
                                                    ),
                                                  ),
                                                ],
                                              ))),
                                      Container(
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.computer,
                                                    size: 16,
                                                    color: Colors.teal,
                                                  ),
                                                  Text(
                                                    seat,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color(0xffA0A0A0),
                                                    ),
                                                  ),
                                                ],
                                              ))),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ))
                  ]))
              : RaisedButton(
                  child: Text("Tampilkan Jadwal"),
                  onPressed: () {
                    setState(() {
                      pressed = true;
                    });
                  },
                )
        ]));
  }
}
