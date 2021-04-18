
import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/management/management.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void cloudMessage() {

      FirebaseMessaging.instance.onTokenRefresh.listen((token) async {
        assert(token != null);
        sharedPreferences.setFirebaseToken(token);
        var result = await NetworkApi().updateFirebaseToken();
        print(result);
        print(token);
      });
      FirebaseMessaging.instance.getToken().then((String token) async {
        assert(token != null);
        sharedPreferences.setFirebaseToken(token);
        var result = await NetworkApi().updateFirebaseToken();
        print(result);
        print(token);
      });


    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

class Utils{

}