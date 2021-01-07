import 'dart:async';
import 'dart:convert';
import 'package:cheki_keja/blocs/favorites/favoritebloc.dart';
import 'package:cheki_keja/blocs/favorites/favoriteevent.dart';
import 'package:cheki_keja/blocs/favorites/favoritestate.dart';
import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/constants/constants.dart';
import 'package:cheki_keja/models/apartment.dart';
import 'package:cheki_keja/models/status.dart';
import 'package:cheki_keja/ui/apartdetails.dart';
import 'package:cheki_keja/ui/reviews.dart';
import 'package:cheki_keja/ui/viewonmap.dart';
import 'package:cheki_keja/utility/connectioncallback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:like_button/like_button.dart';
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
      body:BlocBuilder<FavoriteBloc, FavoriteState>(
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
                  : PostWidget(state.posts[index],index);
            },
            itemCount: state.hasReachedMax
                ? state.posts.length
                : state.posts.length + 1,
            controller: _scrollController,
          );
        }
      },
    )
       );
  }
   Container BottomLoader(){
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
  Container PostWidget(MyApartment myApartment,var index){
    return Container(
                          child: Column(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Apartdetails(
                                          apartment: myApartment)));
                                },
                                child: Card(
                                  child: Column(
                                    children: <Widget>[
                                      ListTile(
                                        leading: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: CachedNetworkImage(
                                            imageUrl: constants.path +myApartment.ownerid +
                                                constants.folder +
                                                myApartment.ownerlogo,
                                            placeholder: (context, url) =>
                                                Container(
                                                    alignment:
                                                        Alignment(0.0, 2.0),
                                                    child: Center(
                                                        child:
                                                            CircularProgressIndicator())),
                                            errorWidget: (context, url,
                                                    error) =>
                                                Container(
                                                    alignment:
                                                        Alignment(0.0, 2.0),
                                                    child: Center(
                                                        child: Icon(
                                                            Icons.error))),
                                          ),
                                        ),
                                        title: Text(myApartment.ownername),
                                        subtitle: Text(myApartment.title),
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
                                            imageUrl: constants.path +myApartment.ownerid +
                                                constants.folder +myApartment.banner.first.banner,
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) => Container(
                                                alignment: Alignment(0.0, 2.0),
                                                child: Center(
                                                    child:
                                                        CircularProgressIndicator())),
                                            errorWidget: (context, url, error) =>
                                                Container(
                                                    alignment:
                                                        Alignment(0.0, 2.0),
                                                    child: Center(
                                                        child:
                                                            Icon(Icons.error))),
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
                alignment: MainAxisAlignment.start,
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
                      icon: Icon(Icons.comment,color: Colors.amber,),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Reviews(apartmentId: myApartment.id,)));
                      }),
                  Text(myApartment.comments ),
                  IconButton(
                      icon: Icon(Icons.location_on_outlined,color: Colors.amber,),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ViewOnMap(
                  title: myApartment.title,
                  address: myApartment.address,
                  latitude: myApartment.latitude,
                  longitude: myApartment.longitude,
                  )));
                      }),
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
}
