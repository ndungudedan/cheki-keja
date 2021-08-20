import 'package:another_flushbar/flushbar_helper.dart';
import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/management/management.dart';
import 'package:cheki_keja/ui/apartdetails.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:package_info/package_info.dart';

void cloudMessage() {
  FirebaseMessaging.instance.onTokenRefresh.listen((token) async {
    assert(token != null);
    sharedPreferences.setFirebaseToken(token);
    var result = await NetworkApi().updateFirebaseToken();
    print(result);
    print(token);
  });
  FirebaseMessaging.instance.getToken().then((String? token) async {
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

Future<String> dynamicLink(var value) async {
  var packageInfo = await PackageInfo.fromPlatform();
  var appName = packageInfo.appName;
  var packageName = packageInfo.packageName;
  var version = packageInfo.version;
  var buildNumber = packageInfo.buildNumber;
  final parameters = DynamicLinkParameters(
    uriPrefix: 'https://chekikeja.page.link',
    link: Uri.parse('https://chekikeja.page.link.com?value=$value'),
    androidParameters: AndroidParameters(
      packageName: packageName,
      minimumVersion: int.tryParse(buildNumber),
    ),
    iosParameters: IosParameters(
      bundleId: packageName,
      minimumVersion: version,
      appStoreId: '123456789',
    ), /* 
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
    ), */
  );

  final shortDynamicLink = await parameters.buildShortLink();
final shortUrl = shortDynamicLink.shortUrl;
  return shortUrl.toString();
}

void initDynamicLinks(BuildContext context) async {
  FirebaseDynamicLinks.instance.onLink(
      onSuccess: (PendingDynamicLinkData? dynamicLink) async {
        if (dynamicLink == null) {
    return;
  }
    final deepLink = dynamicLink.link;

    if (deepLink != null) {
      if (deepLink.queryParameters.containsKey('value')) {
        var id = deepLink.queryParameters['value'];
        await fetchApartment(context, id);
      }
    }
  }, onError: (OnLinkErrorException e) async {
    print('onLinkError');
    print(e.message);
  });

  final data = await FirebaseDynamicLinks.instance.getInitialLink();
  if (data == null) {
    return;
  }
  final deepLink = data.link;
  if (deepLink != null) {
    if (deepLink.queryParameters.containsKey('value')) {
      var id = deepLink.queryParameters['value'];
      await fetchApartment(context, id);
    }
  }
}

Future<void> fetchApartment(BuildContext context, var id) async {
  var result = await NetworkApi().getSingleApartment(id);
  print(result);
  if (result != null) {
    await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            Apartdetails(online: true, apartment: result.first)));
  }
}

Future<void> successDialog(var context,var message) async {
  await CoolAlert.show(
            context: context,
            title: 'Transaction Request Successful',
            type: CoolAlertType.success,
            text: message,
            confirmBtnColor: Theme.of(context).primaryColor);
}

void errorDialog(var context, var message){
   CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: 'Request failed',
        text: message,
        //loopAnimation: false,
      );
}

String numberFormatter(String val) {
  var formatter = NumberFormat("#,##0.00", "en_US");
  print(formatter.format(int.tryParse(val)));
  return formatter.format(int.parse(val));
}


void startLoader(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      useSafeArea: false,
      context: context,
      builder: (_) => SpinKitFadingCircle(
          color: Theme.of(context).primaryColor));
}

void closeLoader(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop();
}

void errorSnackBar(BuildContext context, var message) {
  FlushbarHelper.createError(message: message, duration: Duration(seconds: 5))
      .show(context);
}

void displaySnackBar(BuildContext context, var message) {
  FlushbarHelper.createInformation(
          message: message, duration: Duration(seconds: 5))
      .show(context);
}


class Utils {}
