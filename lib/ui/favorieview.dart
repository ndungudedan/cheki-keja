import 'dart:async';
import 'dart:convert';
import 'package:cheki_keja/blocs/favorites/favoritebloc.dart';
import 'package:cheki_keja/blocs/favorites/favoriteevent.dart';
import 'package:cheki_keja/blocs/favorites/favoritestate.dart';
import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/constants/constants.dart';
import 'package:cheki_keja/models/apartment.dart';
import 'package:cheki_keja/models/status.dart';
import 'package:cheki_keja/views/PostWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final List<String> imageList = [];
final List<String> tagList = [];

class FavoriteView extends StatefulWidget {
  FavoriteView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FavoriteView> {
  bool onlineData=true;
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  FavoriteBloc favoriteBloc;
  ApartmentList apartmentList = ApartmentList();
  List<MyApartment> homeList = List<MyApartment>();
  int _current = 0;
  List<int> comments_count = List();
  StreamController<MyApartment> _streamController =
      StreamController<MyApartment>();
  SharedPreferences prefs;
  bool _loadingMore = true;
  bool empty = false;
  var _hasMoreItems = true;
  var paginationId = '0';
  var userId;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    favoriteBloc = BlocProvider.of<FavoriteBloc>(context);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      favoriteBloc.add(FavoriteFetched());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Favorites'),
          actions: <Widget>[],
        ),
        body: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is FavoriteFailure) {
              return Center(
                child: Text('failed to fetch posts'),
              );
            }
            if (state is FavoriteSuccess) {
              if (state.posts.isEmpty) {
                return Center(
                  child: Text('no posts'),
                );
              }
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return index >= state.posts.length
                      ? BottomLoader()
                      : PostWidget(online:onlineData,
                          myApartment: state.posts[index], 
                          index: index);
                },
                itemCount: state.hasReachedMax
                    ? state.posts.length
                    : state.posts.length + 1,
                controller: _scrollController,
              );
            }
          },
        ));
  }

  Container BottomLoader() {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }

  Future<bool> likes(var id) async {
    var result = await NetworkApi().addLike(id, userId);
    print(result);
    var res = json.decode(result);
    var status = Status.fromJson(res);
    if (status.code == Constants.success) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> dislike(var id) async {
    var result = await NetworkApi().disLike(id, userId);
    print(result);
    var res = json.decode(result);
    var status = Status.fromJson(res);
    if (status.code == Constants.success) {
      return false;
    } else {
      return true;
    }
  }
}
