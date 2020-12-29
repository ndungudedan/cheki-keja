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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 255, 101, 6),
        accentColor:  Color.fromARGB(255, 255, 161, 46),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: sharedPreferences.getFirstLogin() ? OnBoardingPage() : Index(),
    );
  }
}