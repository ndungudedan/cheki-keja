import 'dart:async';
import 'dart:convert';
import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/models/apartClass.dart';
import 'package:cheki_keja/models/userClass.dart' as myuser;
import 'package:cheki_keja/ui/apartdetails.dart';
import 'package:cheki_keja/ui/contact.dart';
import 'package:cheki_keja/ui/favorites.dart';
import 'package:cheki_keja/ui/myhouse.dart';
import 'package:cheki_keja/utility/connectioncallback.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:shared_preferences/shared_preferences.dart';

final List<String> imageList = [];
final List<String> tagList = [];

class home extends StatefulWidget {
  home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<home> with SingleTickerProviderStateMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  auth.User fireuser;
  myuser.User user;
  bool signed_in = false;
  SharedPreferences prefs;
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _dashscaleAnimation;
  Animation<Offset> _slideAnimation;
  ApartmentList apartmentList = ApartmentList();
  List<Apartment> homeList = List<Apartment>();
  final String path = 'http://www.thebuktu.com/chekiKeja/uploads/';
  //final String path = 'http://192.168.43.247/chekiKeja/uploads/';
  final String folder = '/images/';
  int _current = 0;
  List<int> likes_count = List();
  List<int> comments_count = List();
  StreamController<Apartment> _streamController = StreamController<Apartment>();
  bool _loadingMore = true;
  var _hasMoreItems = true;
  var paginationId = '0';
  var userId;
  bool iscollapsed = true;
  double screenwidth, screenheight;
  final Duration duration = const Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _dashscaleAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
    getPrefs();
    initPrefs();
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
        backgroundColor: Colors.red,
        body: Stack(
          children: <Widget>[
            dash(context),
            index(context),
          ],
        ));
  }

  void fetchApartments() async {
    var result = await NetworkApi().getApartments(paginationId, userId);
    print(result);
    var Map = json.decode(result);
    setState(() {
      _loadingMore = !_loadingMore;
      apartmentList = ApartmentList.fromJson(Map);
      if (apartmentList.apartments.isEmpty) {
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
    }
    fetchApartments();
  }

  Widget index(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: iscollapsed ? 0 : 0.6 * screenwidth,
      right: iscollapsed ? 0 : -0.2 * screenwidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          color: Colors.white,
          child: content(),
        ),
      ),
    );
  }

  Widget dash(BuildContext context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: 0,
      right: iscollapsed ? 0 : 0.3 * screenwidth,
      child: SlideTransition(
        position: _slideAnimation,
        child: ScaleTransition(
          scale: _dashscaleAnimation,
          child: Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                signed_in
                    ? Center(
                        child: UserAccountsDrawerHeader(
                          currentAccountPicture: prefs.getString('photo') !=
                                  null
                              ? CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.transparent,
                                  child:
                                      Image.network(prefs.getString('photo')))
                              : Icon(Icons.account_circle),
                          accountEmail: Text(prefs.getString('email')),
                          accountName: Text(prefs.getString('name')),
                        ),
                      )
                    : DrawerHeader(
                        child: FlatButton(
                          color: Colors.white,
                          autofocus: true,
                          splashColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                    image: AssetImage(
                                        'assets/images/google_logo.png'),
                                    height: 35.0),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Sign in',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          onPressed: () {
                            signInWithGoogle();
                          },
                        ),
                      ),
                Divider(
                  color: Colors.white,
                  height: 5,
                ),
                ListTile(
                    title: Text(
                      'Favorites',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => favorites()),
                      );
                    }),
                Divider(
                  color: Colors.white,
                  height: 5,
                ),
                ListTile(
                  title: Text('My apartment',
                      style: TextStyle(color: Colors.white)),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => myhouse())),
                ),
                Divider(
                  color: Colors.white,
                  height: 5,
                ),
                ListTile(
                  title:
                      Text('Contact us', style: TextStyle(color: Colors.white)),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Contact())),
                ),
                Divider(
                  color: Colors.white,
                  height: 5,
                ),
                ListTile(
                  title: Text('Log out', style: TextStyle(color: Colors.white)),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  onTap: () => signOutGoogle(),
                ),
                Divider(
                  color: Colors.white,
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
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
          color: Colors.red,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: () {
                  setState(() {
                    if (iscollapsed) {
                      _controller.forward();
                    } else {
                      _controller.reverse();
                    }
                    iscollapsed = !iscollapsed;
                  });
                },
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
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
        Container(
          child: Flexible(
            child: StreamBuilder(
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
                                  iscollapsed
                                      ? Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Apartdetails(
                                                      apartment: homeList
                                                          .elementAt(index))))
                                      : setState(() {
                                          if (iscollapsed) {
                                            _controller.forward();
                                          } else {
                                            _controller.reverse();
                                          }
                                          iscollapsed = !iscollapsed;
                                        });
                                  ;
                                },
                                child: Card(
                                  child: Column(
                                    children: <Widget>[
                                      ListTile(
                                        leading: Image.network(path +
                                            homeList.elementAt(index).owner_id +
                                            folder +
                                            homeList
                                                .elementAt(index)
                                                .owner_logo),
                                        title: Text(homeList
                                            .elementAt(index)
                                            .owner_name),
                                        subtitle: Text(
                                            homeList.elementAt(index).title),
                                        trailing: RatingBarIndicator(
                                          rating: double.parse(
                                              homeList.elementAt(index).rating),
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
                                              autoPlayInterval:
                                                  Duration(seconds: 3),
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
                                                      likes_count.elementAt(
                                                              index) +
                                                          1);
                                                  homeList
                                                      .elementAt(index)
                                                      .liked = '1';
                                                  likes(homeList
                                                      .elementAt(index)
                                                      .id);
                                                } else {
                                                  likes_count.insert(
                                                      index,
                                                      likes_count.elementAt(
                                                              index) -
                                                          1);
                                                  homeList
                                                      .elementAt(index)
                                                      .liked = '';
                                                  dislike(homeList
                                                      .elementAt(index)
                                                      .id);
                                                }
                                              });
                                            }),
                                        Text(likes_count
                                                .elementAt(index)
                                                .toString() +
                                            'likes'),
                                        IconButton(
                                            icon: Icon(Icons.comment),
                                            onPressed: () {
                                              setState(() {
                                                comments_count.insert(
                                                    index,
                                                    likes_count
                                                            .elementAt(index) +
                                                        1);
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
                            ],
                          ),
                        );
                      });
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
        ConnectionCallback(
          onlineCall: () {
            fetchApartments();
          },
        ),
      ],
    );
  }

  void signInWithGoogle() async {
   var googleSignInAccount = await googleSignIn.signIn();
   var googleSignInAuthentication =
        await googleSignInAccount.authentication;

    var credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    var authResult = await _auth.signInWithCredential(credential);
    fireuser = authResult.user;

    assert(!fireuser.isAnonymous);
    assert(await fireuser.getIdToken() != null);

    var currentUser = await  _auth.currentUser;
    assert(fireuser.uid == currentUser.uid);
    setState(() {
      fireuser = authResult.user;
      registerUser(fireuser);
    });
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();

    print("User Sign Out");
  }

  Future<void> registerUser(auth.User fireuser) async {
    var result = await NetworkApi().registerUser(fireuser);
    var Map = json.decode(result);

    setState(() {
      user = myuser.User.fromJson(Map);
    });
    await prefs.setString('userId', user.id);
    await prefs.setString('name', user.name);
    await prefs.setString('email', user.email);
    await prefs.setString('photo', user.photo);
    await prefs.setBool('issignedin', true);
    setState(() {
      signed_in = prefs.getBool('issignedin');
    });
  }

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      if (!prefs.containsKey('issignedin')) {
        prefs.setBool('issignedin', false);
        signed_in = false;
      } else {
        signed_in = prefs.getBool('issignedin');
      }
    });
  }
}
