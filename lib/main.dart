import 'package:cheki_keja/ui/category.dart';
import 'package:cheki_keja/ui/home.dart';
import 'package:cheki_keja/ui/introduction.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: firsttime ? OnBoardingPage() : home(),
      //MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  bool signed_in = false;
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          home(),
          category(),
          //Gmap(),
        ],
      ),
    );
  }
}
