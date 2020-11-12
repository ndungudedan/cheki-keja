import 'dart:async';
import 'dart:convert';
import 'package:cheki_keja/apartClass.dart';
import 'package:cheki_keja/apartdetails.dart';
import 'package:cheki_keja/drawer.dart';
import 'package:cheki_keja/networkApi.dart';
import 'package:cheki_keja/utility/connectioncallback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final List<String> imageList = [];
final List<String> tagList = [];

class favorites extends StatefulWidget {
  favorites({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<favorites> {
  ApartmentList apartmentList = ApartmentList();
  List<Apartment> homeList = List<Apartment>();
  final String path = 'http://www.thebuktu.com/chekiKeja/uploads/';
  //final String path = 'http://192.168.43.247/chekiKeja/uploads/';
  final String folder = '/images/';
  int _current = 0;
  List<int> likes_count = List();
  List<int> comments_count = List();
  StreamController<Apartment> _streamController = StreamController<Apartment>();
  SharedPreferences prefs;
  bool _loadingMore = true;
  bool empty = false;
  var _hasMoreItems = true;
  var paginationId = '0';
  var userId;

  @override
  void initState() {
    super.initState();
    getPrefs();
  }

  @override
  void dispose() {
    super.dispose();
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
      body: StreamBuilder(
        stream: _streamController.stream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: homeList.length,
                itemBuilder: (BuildContext context, int index) {
                  if ((_hasMoreItems ?? false) &&
                      index == homeList.length - 1) {
                    if (!(_loadingMore ?? false)) {
                      _loadMoreItems();
                    }
                  }
                  return Container(
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Apartdetails(
                                    apartment: homeList.elementAt(index))));
                          },
                          child: Card(
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  leading: Image.network(path +
                                      homeList.elementAt(index).owner_id +
                                      folder +
                                      homeList.elementAt(index).owner_logo),
                                  title: Text(
                                      homeList.elementAt(index).owner_name),
                                  subtitle:
                                      Text(homeList.elementAt(index).title),
                                  trailing: RatingBarIndicator(
                                    rating: 3.5,
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
                                  child: CarouselSlider(
                                    items: populateImageList(
                                        homeList.elementAt(index)),
                                    options: CarouselOptions(
                                        viewportFraction: 0.9,
                                        autoPlay: true,
                                        autoPlayInterval: Duration(seconds: 3),
                                        autoPlayAnimationDuration:
                                            Duration(milliseconds: 1000),
                                        autoPlayCurve: Curves.slowMiddle,
                                        enlargeCenterPage: true,
                                        aspectRatio: 2.0,
                                        scrollDirection: Axis.horizontal,
                                        onPageChanged: (index, reason) {
                                          setState(() {
                                            _current = index;
                                          });
                                        }),
                                  ),
                                ),
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
                                  IconButton(
                                      icon: Icon(
                                        homeList
                                                .elementAt(index)
                                                .liked
                                                .isNotEmpty
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: homeList
                                                .elementAt(index)
                                                .liked
                                                .isNotEmpty
                                            ? Colors.red
                                            : null,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (homeList
                                              .elementAt(index)
                                              .liked
                                              .isEmpty) {
                                            likes_count.insert(
                                                index,
                                                likes_count.elementAt(index) +
                                                    1);
                                            homeList.elementAt(index).liked =
                                                '1';
                                            likes(homeList.elementAt(index).id);
                                          } else {
                                            likes_count.insert(
                                                index,
                                                likes_count.elementAt(index) -
                                                    1);
                                            homeList.elementAt(index).liked =
                                                '';
                                            dislike(
                                                homeList.elementAt(index).id);
                                          }
                                        });
                                      }),
                                  Text(likes_count.elementAt(index).toString() +
                                      'likes'),
                                  IconButton(
                                      icon: Icon(Icons.comment),
                                      onPressed: () {
                                        setState(() {
                                          comments_count.insert(index,
                                              likes_count.elementAt(index) + 1);
                                        });
                                      }),
                                  Text(comments_count
                                          .elementAt(index)
                                          .toString() +
                                      'comments'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      
                      ConnectionCallback(onlineCall: () {
                        
                      },),],
                    ),
                  );
                });
          } else if (empty) {
            return Center(
              child: Text('No results'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      drawer: Draw(),
    );
  }

  void fetchApartments() async {
    var result = await NetworkApi().getFavorites(paginationId, userId);
    print(result);
    var Map = json.decode(result);
    setState(() {
      if (result.toString().isEmpty) {
        _loadingMore = !_loadingMore;
        _hasMoreItems = false;
      }
      _loadingMore = !_loadingMore;
      apartmentList = ApartmentList.fromJson(Map);
      if (apartmentList.apartments.isEmpty) {
        if (paginationId.contains('0')) {
          empty = true;
        }
        _hasMoreItems = false;
      } else {
        for (int i = 0; i < apartmentList.apartments.length; i++) {
          _streamController.add(apartmentList.apartments.elementAt(i));
          homeList.add(apartmentList.apartments.elementAt(i));
          if (int.parse(apartmentList.apartments.elementAt(i).id) >
              int.parse(paginationId)) {
            paginationId = apartmentList.apartments.elementAt(i).id;
          }
        }
      }
    });
  }

  List<Widget> populateImageList(Apartment apartment) {
    imageList.clear();
    tagList.clear();
    if (apartment.likes != null) {
      likes_count.add(int.parse(apartment.likes));
      comments_count.add(int.parse(apartment.comments));
    }
    imageList.add(path + apartment.owner_id + folder + apartment.image0);
    imageList.add(path + apartment.owner_id + folder + apartment.image1);
    imageList.add(path + apartment.owner_id + folder + apartment.image2);

    tagList.add(apartment.tag0);
    tagList.add(apartment.tag1);
    tagList.add(apartment.tag2);
    return imageList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        CachedNetworkImage(
                          imageUrl: item,
                          width: 1000.0,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            alignment: Alignment(0.0, 2.0),
                            child: Center(child: CircularProgressIndicator()),
                          ),
                          errorWidget: (context, url, error) => Container(
                              alignment: Alignment(0.0, 2.0),
                              child: Center(child: Icon(Icons.error))),
                        ),
                        //Image.network(item, fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              tagList.elementAt(imageList.indexOf(item)),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
  }

  void _loadMoreItems() {
    fetchApartments();
  }

  Future<void> likes(var id) async {
    var result = await NetworkApi().addLike(id, userId);
    print(result);
  }

  Future<void> dislike(var id) async {
    var result = await NetworkApi().disLike(id, userId);
    print(result);
  }

  Future<void> getPrefs() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('issignedin')) {
      userId = prefs.getString('userId');
      fetchApartments();
    }
  }
}
