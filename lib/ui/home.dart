import 'dart:async';
import 'package:cheki_keja/blocs/home/homebloc.dart';
import 'package:cheki_keja/blocs/home/homeevent.dart';
import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/constants/constants.dart';
import 'package:cheki_keja/models/apartment.dart';
import 'package:cheki_keja/models/user.dart' as myuser;
import 'package:cheki_keja/ui/homeview.dart';
import 'package:cheki_keja/utility/connectioncallback.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cheki_keja/management/management.dart';

import 'apartdetails.dart';

class Home extends StatefulWidget {
  Home(
      {Key key,
      @required this.controller,
      @required this.iscollapsed,
      @required this.press})
      : super(key: key);
  bool iscollapsed;
  AnimationController controller;
  final VoidCallback press;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool iscollapsed;
  AnimationController _controller;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  auth.User fireuser;
  myuser.User user;
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  PostBloc _postBloc;
  bool signed_in = false;
  ApartmentList apartmentList = ApartmentList();
  List<MyApartment> homeList = List<MyApartment>();
  int _current = 0;
  Constants constants = Constants();
  List<int> likes_count = List();
  List<int> comments_count = List();
  StreamController<MyApartment> _streamController =
      StreamController<MyApartment>();
  VoidCallback press;
  bool _loadingMore = true;
  var _hasMoreItems = true;
  var userId;
  var paginationId = '0';

  @override
  void initState() {
    super.initState();
    getPrefs();
    initPrefs();
    press = widget.press;
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    iscollapsed = widget.iscollapsed;
    _controller = widget.controller;
    press = widget.press;
    return Container(
      color: Colors.white,
      child: content(),
    );
  }

  Column content() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 50),
          color: Color.fromARGB(255, 255, 101, 6),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: () {
                  press();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                'Home',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Icon(
                Icons.search,
                color: Colors.white,
              ),
            ],
          ),
        ),
         Flexible(
                    child: BlocProvider(
            create: (context) =>
                PostBloc(id: paginationId,userid: userId)..add(PostFetched()),
            child:  HomeView()),
         ),
        ConnectionCallback(
          onlineCall: () {},
        ),
      ],
    );
  }

  Future<void> initPrefs() async {
    setState(() {
      signed_in = sharedPreferences.checkSignedIn();
    });
  }

  Future<void> getPrefs() async {
    if (sharedPreferences.checkSignedIn()) {
      userId = sharedPreferences.getUserId();
    }
  }

}
