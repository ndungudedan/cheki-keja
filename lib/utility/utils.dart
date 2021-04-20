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

Future<void> dynamicLink() async {
  final DynamicLinkParameters parameters = DynamicLinkParameters(
    uriPrefix: 'https://abc123.app.goo.gl',
    link: Uri.parse('https://example.com/'),
    androidParameters: AndroidParameters(
      packageName: 'com.tidtech.cheki_keja',
      minimumVersion: 125,
    ),
    iosParameters: IosParameters(
      bundleId: 'com.tidtech.cheki_keja',
      minimumVersion: '1.0.1',
      appStoreId: '123456789',
    ),
    googleAnalyticsParameters: GoogleAnalyticsParameters(
      campaign: 'example-promo',
      medium: 'social',
      source: 'orkut',
    ),
    itunesConnectAnalyticsParameters: ItunesConnectAnalyticsParameters(
      providerToken: '123456',
      campaignToken: 'example-promo',
    ),
    socialMetaTagParameters: SocialMetaTagParameters(
      title: 'Example of a Dynamic Link',
      description: 'This link works whether app is installed or not!',
    ),
  );

  final Uri dynamicUrl = await parameters.buildUrl();
  return dynamicUrl;
}

class Utils {}
