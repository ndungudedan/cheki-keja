import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cheki_keja/blocs/companybloc.dart';
import 'package:cheki_keja/blocs/featurebloc.dart';
import 'package:cheki_keja/blocs/imagebloc.dart';
import 'package:cheki_keja/blocs/reviewbloc.dart';
import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/constants/constants.dart';
import 'package:cheki_keja/management/management.dart';
import 'package:cheki_keja/models/apartment.dart';
import 'package:cheki_keja/models/company.dart';
import 'package:cheki_keja/models/features.dart';
import 'package:cheki_keja/models/reviewClass.dart';
import 'package:cheki_keja/models/status.dart';
import 'package:cheki_keja/models/stkpush.dart';
import 'package:cheki_keja/ui/viewonmap.dart';
import 'package:cheki_keja/ui/addReview.dart';
import 'package:cheki_keja/ui/photoViewer.dart';
import 'package:cheki_keja/ui/reviews.dart';
import 'package:cheki_keja/utility/connectioncallback.dart';
import 'package:cheki_keja/views/floatingButton.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Apartdetails extends StatefulWidget {
  MyApartment apartment;
  Apartdetails({Key key, @required this.apartment}) : super(key: key);

  final String title = 'apartmentDetails';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Apartdetails> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  String userId;
  String apartmentId, ownerId;
  MyApartment apartment;
  MyCompany company;
  Stkpush stkpush;
  final Map<String, Marker> _markers = {};
  SharedPreferences prefs;
  var features;
  var phone;
  var paginationId = '0';
  bool signed_in = false;
  FeatureBloc feature_bloc;
  CompanyBloc company_bloc;
  ImagesBloc images_bloc;
  ReviewBloc review_bloc;

  Future<void> _onMapCreated(GoogleMapController controller) async {
    setState(() {
      _markers.clear();
      final marker = Marker(
        markerId: MarkerId('home'),
        position: LatLng(double.parse(widget.apartment.latitude),
            double.parse(widget.apartment.longitude)),
        infoWindow: InfoWindow(
          title: apartment.title,
          snippet: '',
        ),
      );
      _markers['home'] = marker;
    });
  }

  @override
  void initState() {
    super.initState();
    feature_bloc = FeatureBloc();
    company_bloc = CompanyBloc();
    images_bloc = ImagesBloc();
    review_bloc = ReviewBloc();
    apartment = widget.apartment;
    userId = '1';
    apartmentId = widget.apartment.id;
    ownerId = widget.apartment.owner_id;
    feature_bloc.fetchFeatures(apartmentId);
    images_bloc.fetchImages(apartmentId);
    company_bloc.fetchCompany(ownerId);
    review_bloc.fetchReviews(apartmentId, paginationId);
    getPrefs();
  }

  @override
  void dispose() {
    super.dispose();
    feature_bloc.dispose();
    images_bloc.dispose();
    company_bloc.dispose();
    review_bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(apartment.title + ' Apartments'),
        actions: <Widget>[
          Builder(
            builder: (BuildContext context) {
              return LikeButton(
                isLiked: apartment.liked.isNotEmpty,
                size: 30,
                circleColor:
                    CircleColor(start: Colors.white, end: Colors.white),
                bubblesColor: BubblesColor(
                  dotPrimaryColor: Colors.white,
                  dotSecondaryColor: Colors.white70,
                ),
                likeBuilder: (bool isLiked) {
                  return Icon(
                    Icons.favorite,
                    color: isLiked ? Colors.white : Colors.grey,
                    size: 30,
                  );
                },
                //likeCount: int.tryParse(apartment.likes),
                countBuilder: (int count, bool isLiked, String text) {
                  var color = isLiked ? Colors.red : Colors.white;
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
                    return likes(apartment.id);
                  } else {
                    return dislike(apartment.id);
                  }
                },
              );
            },
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          ConnectionCallback(
          onlineCall: () {},
        ),
          Center(
            child: apartmentDetails(apartment),
          ),
          StreamBuilder(
            stream: images_bloc.allImages,
            builder:
                (BuildContext context, AsyncSnapshot<List<Images>> snapshot) {
              if (snapshot.hasData) {
                return GFItemsCarousel(
                  rowCount: 3,
                  itemHeight: 150,
                  children: snapshot.data.map(
                    (url) {
                      return Container(
                        margin: EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PhotoViewer(
                                        picList: snapshot.data,
                                        apartment: apartment,
                                        backgroundDecoration:
                                            const BoxDecoration(
                                          color: Colors.black,
                                        ),
                                        initialIndex:
                                            snapshot.data.indexOf(url),
                                        scrollDirection: Axis.horizontal,
                                      )));
                            },
                            child: Stack(
                              children: <Widget>[
                                CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: constants.path +
                                      apartment.owner_id +
                                      constants.folder +
                                      url.image,
                                  placeholder: (context, url) => Container(
                                      alignment: Alignment(0.0, 2.0),
                                      child: Center(
                                          child: CircularProgressIndicator())),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                          alignment: Alignment(0.0, 2.0),
                                          child:
                                              Center(child: Icon(Icons.error))),
                                ),
                                // Image.network(url,fit: BoxFit.contain, width: 2000.0),
                                Positioned(
                                  bottom: 1.0,
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
                                      url.tag,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                );
              } else if (snapshot.hasError) {}
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                Center(child: Text('Features')),
                Center(
                  child: StreamBuilder(
                    stream: feature_bloc.allFeatures,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Features>> snapshot) {
                      if (snapshot.hasData) {
                        return GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          childAspectRatio: 6.0,
                          scrollDirection: Axis.vertical,
                          children:
                              List.generate(snapshot.data.length, (index) {
                            return featuresCard(
                                snapshot.data.elementAt(index).feat);
                          }),
                        );
                      } else if (snapshot.hasError) {}
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                Center(child: Text('Reviews')),
                Row(
                  children: <Widget>[
                    Builder(
                      builder: (context) => IconButton(
                        splashColor: Colors.lightGreen,
                        icon: Icon(
                          Icons.add_circle_outline,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          sharedPreferences.getSignedIn()
                              ? Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AddReview(
                                        userId: userId,
                                        apartmentId: apartmentId,
                                      )))
                              : Scaffold.of(context)
                                  .showSnackBar(snack('Please Sign in first'));
                          ;
                        },
                      ),
                    ),
                    Text('Add Review'),
                  ],
                ),
                StreamBuilder(
                  stream: review_bloc.reviews,
                  builder: (context, AsyncSnapshot<List<Review>> snapshot) {
                    if (snapshot.hasData && snapshot.data.isNotEmpty) {
                      return Column(
                        children: [
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(8),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Image.network(snapshot.data
                                      .elementAt(index)
                                      .user
                                      .photo),
                                ),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(snapshot.data
                                        .elementAt(index)
                                        .user
                                        .name),
                                    Text(snapshot.data
                                        .elementAt(index)
                                        .timeline
                                        .substring(0, 10))
                                  ],
                                ),
                                subtitle: Text(
                                  snapshot.data.elementAt(index).review,
                                  overflow: TextOverflow.visible,
                                  softWrap: true,
                                ),
                              );
                            },
                          ),
                          snapshot.data!=null &&snapshot.data.isNotEmpty ?
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Reviews(
                                            apartmentId: apartmentId,
                                            reviews: snapshot.data,
                                          )));
                            },
                            child: Text(
                              'see all reviews',
                              style: TextStyle(color: Colors.blue),
                            ))
                        : SizedBox()
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('No reviews yet'),
                      );
                    } else if (snapshot.data != null &&
                        snapshot.data.isEmpty) {
                      return Center(
                        child: Text('No reviews yet'),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            height: 200,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewOnMap(
                              latitude: apartment.latitude,
                              longitude: apartment.longitude,
                            )));
              },
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                scrollGesturesEnabled: true,
                zoomGesturesEnabled: true,
                myLocationEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: LatLng(double.parse(apartment.latitude),
                      double.parse(apartment.longitude)),
                  zoom: 12,
                ),
                markers: _markers.values.toSet(),
              ),
            ),
          ),
          StreamBuilder(
            stream: company_bloc.company,
            builder: (BuildContext context, AsyncSnapshot<MyCompany> snapshot) {
              if (snapshot.hasData) {
                return Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      Center(child: Text('Contact us')),
                      ListTile(
                        title: Text('Phone'),
                        leading: Icon(Icons.call),
                        subtitle: Text(snapshot.data.phone),
                      ),
                      ListTile(
                        title: Text('Email'),
                        leading: Icon(Icons.email),
                        subtitle: Text(snapshot.data.email),
                      ),
                      ListTile(
                        title: Text('Address'),
                        leading: Icon(Icons.account_box),
                        subtitle: Text(snapshot.data.address),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {}
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          ConnectionCallback(
            onlineCall: () {},
          ),
        ],
      ),
      /*  floatingActionButton: Builder(
        builder: (context) => floatingButton(
          onPressed: () {
            if (signed_in) {
              lipaNaMpesa();
            } else {
              Scaffold.of(context).showSnackBar(snack('Please Sign in first'));
            }
          },
        ),
      ), */
    );
  }

  void lipaNaMpesa() async {
    var result = await NetworkApi().lipaNaMpesa(
        phone, apartment.deposit, userId, apartmentId, ownerId, 'deposit');
    print(result);
    var Map = json.decode(result);
    setState(() {
      stkpush = Stkpush.fromJson(Map);
      Scaffold.of(context).showSnackBar(snack(stkpush.message));
    });
  }

  SnackBar snack(String message) {
    return SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 500),
    );
  }

  Row featuresCard(var feature) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.star,
          size: 13,
          color: Colors.lightBlueAccent,
        ),
        Flexible(
          child: Text(
            feature,
            overflow: TextOverflow.visible,
            softWrap: true,
            style: TextStyle(
              color: Colors.lightBlueAccent,
            ),
          ),
        )
      ],
    );
  }

  Container apartmentDetails(MyApartment apartment) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      padding: EdgeInsets.all(10),
      color: Colors.orangeAccent,
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Category: ' + apartment.category,
                  style: TextStyle(color: Colors.white)),
              Text(
                'Managed by: ' + apartment.owner_name,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Rent: ' + apartment.price,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Deposit fee: ' + apartment.deposit,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> getPrefs() async {
    prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('issignedin')) {
      await prefs.setBool('issignedin', false);
      signed_in = false;
    } else {
      signed_in = prefs.getBool('issignedin');
    }
  }

  Future<bool> likes(var id) async {
    if (sharedPreferences.getSignedIn()) {
      var result = await NetworkApi().addLike(id, userId);
      print(result);
      var res = json.decode(result);
      var status = Status.fromJson(res);
      if (status.code == Constants.success) {
        setState(() {
          apartment.liked = '1';
        });
        return true;
      } else {
        return false;
      }
    } else {
      scaffoldKey.currentState.showSnackBar(snack('Please sign in first'));
      return false;
    }
  }

  Future<bool> dislike(var id) async {
    if (sharedPreferences.getSignedIn()) {
      var result = await NetworkApi().disLike(id, userId);
      print(result);
      var res = json.decode(result);
      var status = Status.fromJson(res);
      if (status.code == Constants.success) {
        setState(() {
          apartment.liked = '';
        });
        return false;
      } else {
        return true;
      }
    } else {
      scaffoldKey.currentState.showSnackBar(snack('Please sign in first'));
      return false;
    }
  }
}
