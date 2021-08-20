import 'dart:async';
import 'dart:convert';
import 'package:cheki_keja/constants/constants.dart';
import 'package:cheki_keja/models/apartment.dart';
import 'package:cheki_keja/ui/apartdetails.dart';
import 'package:cheki_keja/ui/home.dart';
import 'package:cheki_keja/utility/utils.dart';
import 'package:cheki_keja/views/drawer.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

Future<void> backgroundMessageHandler(RemoteMessage message) async {
  print('handling bacground messso');
}

class Index extends StatefulWidget {
  Index({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Index>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _dashscaleAnimation;
  late Animation<Offset> _slideAnimation;
  ApartmentList apartmentList = ApartmentList();
  List<MyApartment> homeList =[];
  int _current = 0;
  Constants constants = Constants();
  List<int> likes_count = [];
  List<int> comments_count = [];
  StreamController<MyApartment> _streamController =
      StreamController<MyApartment>();
  bool _loadingMore = true;
  var _hasMoreItems = true;
  var paginationId = '0';
  var userId;
  bool iscollapsed = true;
  late double screenwidth, screenheight;
  final Duration duration = const Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller!);
    _dashscaleAnimation = Tween<double>(begin: 0, end: 1).animate(_controller!);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller!);
    cloudMessage();
    notification();
    initDynamicLinks(context);
  }

  @override
  void dispose() {
    _controller!.dispose();
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
                      _controller!.reverse();
                    });
                  }
                },
                child: Home(
                  press: () {
                    setState(() {
                      if (iscollapsed) {
                        _controller!.forward();
                      } else {
                        _controller!.reverse();
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

  Future<void> notification() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null && initialMessage.data['action'] == 'vacant') {
      var data =
          MyApartment.fromJson(json.decode(initialMessage.data['apartment']));
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Apartdetails(online: true, apartment: data)));
    }

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data['action'] == 'vacant') {
        var data = MyApartment.fromJson(json.decode(message.data['apartment']));
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Apartdetails(online: true, apartment: data)));
      }
    });
  }
}
