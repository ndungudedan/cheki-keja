import 'package:cheki_keja/management/management.dart';
import 'package:cheki_keja/ui/index.dart';
import 'package:cheki_keja/ui/introduction.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await sharedPreferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool firsttime =false;

  Future<void> initPrefs() async {
    var prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('firsttime')) {
      prefs.setBool('firsttime', false);
      firsttime = true;
    } else {
      firsttime = prefs.getBool('firsttime');
    }
  }

  @override
  Widget build(BuildContext context) {
    initPrefs();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 238, 133, 57),
        accentColor:  Color.fromARGB(255, 250, 180, 70),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: firsttime ? OnBoardingPage() : Index(),
    );
  }
}