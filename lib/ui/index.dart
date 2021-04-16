import 'dart:async';
import 'dart:convert';
import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/constants/constants.dart';
import 'package:cheki_keja/management/management.dart';
import 'package:cheki_keja/models/apartment.dart';
import 'package:cheki_keja/ui/apartdetails.dart';
import 'package:cheki_keja/ui/home.dart';
import 'package:cheki_keja/views/drawer.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  Index({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Index>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _dashscaleAnimation;
  Animation<Offset> _slideAnimation;
  ApartmentList apartmentList = ApartmentList();
  List<MyApartment> homeList = List<MyApartment>();
  int _current = 0;
  Constants constants = Constants();
  List<int> likes_count = List();
  List<int> comments_count = List();
  StreamController<MyApartment> _streamController =
      StreamController<MyApartment>();
  bool _loadingMore = true;
  var _hasMoreItems = true;
  var paginationId = '0';
  var userId;
  bool iscollapsed = true;
  double screenwidth, screenheight;
  final Duration duration = const Duration(milliseconds: 300);
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _dashscaleAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
    cloudMessage();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenheight = size.height;
    screenwidth = size.width;
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
            Color.fromARGB(255, 255, 161, 46),
            Color.fromARGB(255, 255, 101, 6),
          ])),
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            duration: duration,
            top: 0,
            bottom: 0,
            left: 0,
            right: iscollapsed ? 0 : 0.3 * screenwidth,
            child: SlideTransition(
              position: _slideAnimation,
              child: ScaleTransition(scale: _dashscaleAnimation, child: Draw()),
            ),
          ),
          AnimatedPositioned(
            duration: duration,
            top: 0,
            bottom: 0,
            left: iscollapsed ? 0 : 0.6 * screenwidth,
            right: iscollapsed ? 0 : -0.2 * screenwidth,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: InkWell(
                onTap: () {
                  if (!iscollapsed) {
                    setState(() {
                      iscollapsed = !iscollapsed;
                      _controller.reverse();
                    });
                  }
                },
                child: Home(
                  press: () {
                    setState(() {
                      if (iscollapsed) {
                        _controller.forward();
                      } else {
                        _controller.reverse();
                      }
                      iscollapsed = !iscollapsed;
                    });
                  },
                  controller: _controller,
                  iscollapsed: iscollapsed,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  void cloudMessage() {
    if (sharedPreferences.getSignedIn()) {
      firebaseMessaging.getToken().then((String token) async {
        assert(token != null);
        sharedPreferences.setFirebaseToken(token);
        var result = await NetworkApi().updateFirebaseToken();
        print(result);
        print(token);
      });
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
  print('Message data: ${message.data}');

  if (message.notification != null) {
    print('Message also contained a notification: ${message.notification}');
  }
    });

    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) {
        print("onMessage: $message");
        /* var myApartment = backgroundMessageHandler(message);
         Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                Apartdetails(online: true, apartment: myApartment))); */
      },
      onLaunch: (Map<String, dynamic> message) {
        print("onLaunch: $message");
        var myApartment = backgroundMessageHandler(message);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                Apartdetails(online: true, apartment: myApartment)));
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        var myApartment = backgroundMessageHandler(message);
        await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                Apartdetails(online: true, apartment: myApartment)));
      },
    );

    firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(
            sound: true, badge: true, alert: true, provisional: true));
    firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }
}
