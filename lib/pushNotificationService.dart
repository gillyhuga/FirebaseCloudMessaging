import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm;
  final context;
  String title = "";
  // String _messageText = "Waiting for message...";
  PushNotificationService(this._fcm, this.context);

  Future getToken() async {
    String token = await _fcm.getToken();
    print("FirebaseMessaging token: $token");
    return token;
  }
}
