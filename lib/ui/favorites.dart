import 'dart:async';
import 'package:cheki_keja/blocs/favorites/favoritebloc.dart';
import 'package:cheki_keja/blocs/favorites/favoriteevent.dart';
import 'package:cheki_keja/blocs/home/homebloc.dart';
import 'package:cheki_keja/blocs/home/homeevent.dart';
import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/constants/constants.dart';
import 'package:cheki_keja/models/apartment.dart';
import 'package:cheki_keja/models/user.dart' as myuser;
import 'package:cheki_keja/ui/favorieview.dart';
import 'package:cheki_keja/ui/homeview.dart';
import 'package:cheki_keja/utility/connectioncallback.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cheki_keja/management/management.dart';

class Favorites extends StatefulWidget {
  Favorites(
      {Key key,})
      : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Favorites> {
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
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
            create: (context) =>
                FavoriteBloc(id: paginationId,userid: userId)..add(FavoriteFetched()),
            child:  FavoriteView());
  }

}
