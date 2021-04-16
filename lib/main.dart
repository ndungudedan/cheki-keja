import 'dart:convert';

import 'package:cheki_keja/management/management.dart';
import 'package:cheki_keja/models/apartment.dart';
import 'package:cheki_keja/ui/index.dart';
import 'package:cheki_keja/ui/introduction.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
  await Firebase.initializeApp();
  await sharedPreferences.init();
  runApp(MyApp());
}

Future<void> backgroundMessageHandler(RemoteMessage message)async{
  /* if (message.containsKey('data')) {
    if (message['data']['action'] == 'vacant') {
      final dynamic data = message['data']['apartment'];
      return MyApartment.fromJson(json.decode(data));
    }
  }

  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
  } */

  // Or do other work.
}

class MyApp extends StatelessWidget {
  bool firsttime = false;

  Future<void> initPrefs() async {
    if (!sharedPreferences.checkFirstTime()) {
      sharedPreferences.setFirstLogin(false);
      firsttime = true;
    } else {
      firsttime = sharedPreferences.getFirstLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    initPrefs();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 255, 101, 6),
        accentColor: Color.fromARGB(255, 255, 161, 46),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => firsttime ? OnBoardingPage() : Index(),
        '/index': (context) => Index(),
      },
      //home: firsttime ? OnBoardingPage() : OnBoardingPage(),
    );
  }
}
