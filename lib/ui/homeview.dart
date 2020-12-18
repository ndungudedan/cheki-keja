import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cheki_keja/blocs/home/homebloc.dart';
import 'package:cheki_keja/blocs/home/homeevent.dart';
import 'package:cheki_keja/blocs/home/homestate.dart';
import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/constants/constants.dart';
import 'package:cheki_keja/management/management.dart';
import 'package:cheki_keja/models/apartment.dart';
import 'package:cheki_keja/models/status.dart';
import 'package:cheki_keja/ui/apartdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:like_button/like_button.dart';

class HomeView extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeView> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  PostBloc _postBloc;
  bool signed_in = false;
  int _current = 0;
  Constants constants = Constants();
  List<int> likes_count = List();
  List<int> comments_count = List();
  VoidCallback press;
  bool _loadingMore = true;
  var _hasMoreItems = true;
  var userId;
  var paginationId = '0';
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _postBloc = BlocProvider.of<PostBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostInitial) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PostFailure) {
          return Center(
            child: Text('failed to fetch posts'),
          );
        }
        if (state is PostSuccess) {
          if (state.posts.isEmpty) {
            return Center(
              child: Text('no posts'),
            );
          }
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return index >= state.posts.length
                  ? BottomLoader()
                  : PostWidget(state.posts[index], index);
            },
            itemCount: state.hasReachedMax
                ? state.posts.length
                : state.posts.length + 1,
            controller: _scrollController,
          );
        }
      },
    );
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
      _postBloc.add(PostFetched());
    }
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

  Container PostWidget(MyApartment myApartment, var index) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Apartdetails(apartment: myApartment)));
            },
            child: Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: CachedNetworkImage(
                        imageUrl: constants.path +
                            myApartment.owner_id +
                            constants.folder +
                            myApartment.owner_logo,
                        placeholder: (context, url) => Container(
                            alignment: Alignment(0.0, 2.0),
                            child:
                                Center(child: CircularProgressIndicator())),
                        errorWidget: (context, url, error) => Container(
                            alignment: Alignment(0.0, 2.0),
                            child: Center(child: Icon(Icons.error))),
                      ),
                    ),
                    title: Text(
                      myApartment.owner_name,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                    subtitle: Text(
                      myApartment.title,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                    trailing: RatingBarIndicator(
                      rating: double.parse(myApartment.rating),
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: CachedNetworkImage(
                        imageUrl: constants.path +
                            myApartment.owner_id +
                            constants.folder +
                            myApartment.banner.first.banner,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => Container(
                            alignment: Alignment(0.0, 2.0),
                            child: Center(child: SizedBox(
                              height: 30,
                              width: 3,
                              child: CircularProgressIndicator()))),
                        errorWidget: (context, url, error) => Container(
                            alignment: Alignment(0.0, 2.0),
                            child: Center(child: Icon(Icons.error))),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: ButtonBar( 
                  children: <Widget>[
                    LikeButton(
                      isLiked: myApartment.liked.isNotEmpty ,
                      size: 30,
                      circleColor: CircleColor(
                          start: Colors.redAccent, end: Colors.redAccent),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: Colors.red,
                        dotSecondaryColor: Colors.redAccent,
                      ),
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          Icons.favorite,
                          color: isLiked ? Colors.red : Colors.grey,
                          size: 30,
                        );
                      },
                      likeCount: int.tryParse(myApartment.likes),
                      countBuilder: (int count, bool isLiked, String text) {
                        var color = isLiked ? Colors.red : Colors.grey;
                        Widget result;
                        if (count == 0) {
                          result = Text(
                            "love",
                            style: TextStyle(color: color),
                          );
                        } else {
                          result = Text(
                            text,
                            style: TextStyle(color: color),
                          );
                        }
                        return result;
                      },
                      onTap: (isLiked) {
                        if (!isLiked) {
                         return likes(myApartment.id);
                        } else {
                          return dislike(myApartment.id);
                        }
                      },
                    ),
                    IconButton(
                        icon: Icon(Icons.comment),
                        onPressed: () {
                          setState(() {});
                        }),
                    Text(myApartment.comments ),
                  ],
                ),
              ),
            ],
          ),
        ],
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

  Future<void> getPrefs() async {
    if (sharedPreferences.checkSignedIn()) {
      userId = sharedPreferences.getUserId();
    }
  }
}
