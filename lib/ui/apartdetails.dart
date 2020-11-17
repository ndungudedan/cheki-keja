import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cheki_keja/addReview.dart';
import 'package:cheki_keja/apartClass.dart';
import 'package:cheki_keja/category.dart';
import 'package:cheki_keja/companyClass.dart';
import 'package:cheki_keja/featureClass.dart';
import 'package:cheki_keja/floatingButton.dart';
import 'package:cheki_keja/home.dart';
import 'package:cheki_keja/map.dart';
import 'package:cheki_keja/models/stkpush.dart';
import 'package:cheki_keja/myhouse.dart';
import 'package:cheki_keja/networkApi.dart';
import 'package:cheki_keja/photoViewer.dart';
import 'package:cheki_keja/reviewClass.dart';
import 'package:cheki_keja/reviews.dart';
import 'package:cheki_keja/utility/connectioncallback.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cheki_keja/locations.dart' as locations;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class Apartdetails extends StatefulWidget {
  Apartment apartment;
  Apartdetails({Key key, @required this.apartment}) : super(key: key);

  final String title = 'apartmentDetails';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Apartdetails> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  String userId;
  String apartmentId, ownerId;
  Apartment apartment;
  Company company;
  Stkpush stkpush;
  int _selectedIndex = 0;
  Images images = Images();
  ImageList imageList = ImageList();
  final String path = 'http://www.thebuktu.com/chekiKeja/uploads/';
  //final String path = 'http://192.168.43.247/chekiKeja/uploads/';
  final String folder = '/images/';
  String owner;
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  final List<String> picList = [];
  final List<String> imageTags = [];
  final List<String> featurelist = [];
  ReviewList reviewList = ReviewList();
  List<Review> reviews = List<Review>();
  final Map<String, Marker> _markers = {};
  SharedPreferences prefs;
  var features;
  var phone;
  var paginationId = '0';
  bool signed_in = false;

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
    apartment = widget.apartment;
    owner = widget.apartment.owner_name;
    userId = '1';
    apartmentId = widget.apartment.id;
    ownerId = widget.apartment.owner_id;
    picList.add(path + ownerId + folder + widget.apartment.image0);
    picList.add(path + ownerId + folder + widget.apartment.image1);
    picList.add(path + ownerId + folder + widget.apartment.image2);
    imageTags.add(widget.apartment.tag0);
    imageTags.add(widget.apartment.tag1);
    imageTags.add(widget.apartment.tag2);

    getPrefs();
    fetchImages();
    fetchFeatures();
    fetchReviews();
    fetchCompany();

    _controller = VideoPlayerController.network(
      path + ownerId + '/videos/vid1.mp4',
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
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
            builder: (context)=> IconButton(
                icon: Icon(
                  apartment.liked.isNotEmpty
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: apartment.liked.isNotEmpty ? Colors.amber : null,
                ),
                onPressed: () {
                  setState(() {
                    if(signed_in){
                    if (apartment.liked.isEmpty) {
                      apartment.liked = '1';
                      likes(apartment.id);
                    } else {
                      apartment.liked = '';
                      dislike(apartment.id);
                    }
                    }else{
                      Scaffold.of(context).showSnackBar(snack('Please Sign in first'));
                    }
                  });
                }),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
              child: apartment.video.isNotEmpty
                  ? Column(
                      children: <Widget>[
                        Container(
                          height: 150,
                          child: FutureBuilder(
                            future: _initializeVideoPlayerFuture,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return AspectRatio(
                                  aspectRatio: _controller.value.aspectRatio,
                                  child: VideoPlayer(_controller),
                                );
                              } else {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                          ),
                        ),
                        Center(
                          child: apartmentDetails(apartment),
                        )
                      ],
                    )
                  : Center(
                      child: apartmentDetails(apartment),
                    )),
          GFItemsCarousel(
            rowCount: 3,
            itemHeight: 150,
            children: picList.map(
              (url) {
                return Container(
                  margin: EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => photoViewer(
                                  picList: picList,
                                  tagList: imageTags,
                                  index: picList.indexOf(url),
                                )));
                      },
                      child: Stack(
                        children: <Widget>[
                          CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: url,
                            placeholder: (context, url) => Container(
                                alignment: Alignment(0.0, 2.0),
                                child:
                                    Center(child: CircularProgressIndicator())),
                            errorWidget: (context, url, error) => Container(
                                alignment: Alignment(0.0, 2.0),
                                child: Center(child: Icon(Icons.error))),
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
                                imageTags.elementAt(picList.indexOf(url)),
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
          ),
          Container(
            padding: EdgeInsets.all(5),
            height: 200,
            child: Column(
              children: <Widget>[
                Center(child: Text('Features')),
                featurelist.isNotEmpty
                    ? Center(
                        child: GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          childAspectRatio: 6.0,
                          scrollDirection: Axis.vertical,
                          children: List.generate(featurelist.length, (index) {
                            return featuresCard(featurelist.elementAt(index));
                          }),
                        ),
                      )
                    : Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
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
                      builder: (context)=> IconButton(
                        splashColor: Colors.lightGreen,
                        icon: Icon(
                          Icons.add_circle_outline,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          signed_in
                              ? Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AddReview(
                                        userId: userId,
                                        apartmentId: apartmentId,
                                      )))
                              : Scaffold.of(context).showSnackBar(snack('Please Sign in first'));;
                        },
                      ),
                    ),
                    Text('Add Review'),
                  ],
                ),
                reviews.isNotEmpty
                    ? Column(
                        children: <Widget>[
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(8),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Image.network(
                                      reviews.elementAt(index).user.photo),
                                ),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(reviews.elementAt(index).user.name),
                                    Text(reviews.elementAt(index).timeline.substring(0,10))
                                  ],
                                ),
                                subtitle: Text(
                                  reviews.elementAt(index).review,
                                  overflow: TextOverflow.visible,
                                  softWrap: true,
                                ),
                              );
                            },
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Reviews(
                                            apartmentId: apartmentId,
                                            reviewList: reviewList)));
                              },
                              child: Text(
                                'see all reviews',
                                style: TextStyle(color: Colors.blue),
                              ))
                        ],
                      )
                    : Center(
                        child: Text('No reviews yet'),
                      ),
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
                        builder: (context) => Gmap(
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
          company != null
              ? Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      Center(child: Text('Contact us')),
                      ListTile(
                        title: Text('Phone'),
                        leading: Icon(Icons.call),
                        subtitle: Text(company.phone),
                      ),
                      ListTile(
                        title: Text('Email'),
                        leading: Icon(Icons.email),
                        subtitle: Text(company.email),
                      ),
                      ListTile(
                        title: Text('Address'),
                        leading: Icon(Icons.account_box),
                        subtitle:
                            Text(company.address + '\n' + company.location),
                      ),
                    ],
                  ),
                )
              : Container(),
        ConnectionCallback(onlineCall: () {
          
        },),
        ],
      ),
      floatingActionButton: Builder(
              builder: (context)=> floatingButton(
          onPressed: () {
            if(signed_in){
              lipaNaMpesa();
            }
            else{
              Scaffold.of(context).showSnackBar(snack('Please Sign in first'));
            }
          },
        ),
      ),
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

  void fetchImages() async {
    var result = await NetworkApi().getImages();
    print(result);
    var Map = json.decode(result);
    setState(() {
      imageList = ImageList.fromJson(Map);
      images = imageList.images.elementAt(0);
      //i dont know why ...review later
      populateImageList();
    });
  }

  void fetchFeatures() async {
    var result = await NetworkApi().getFeatures(apartmentId);
    print(result);
    var Map = json.decode(result);
    setState(() {
      features = Features.fromJson(Map);
      populateFeaturesList();
    });
  }

  void fetchCompany() async {
    var result = await NetworkApi().getCompany(ownerId);
    print(result);
    var Map = json.decode(result);
    setState(() {
      company = Company.fromJson(Map);
    });
  }

  void fetchReviews() async {
    var result = await NetworkApi().getReviews(apartmentId, paginationId);
    print(result);
    var Map = json.decode(result);
    setState(() {
      reviewList = ReviewList.fromJson(Map);
      for (int i = 0; i < 3; i++) {
        reviews.add(reviewList.reviews.elementAt(i));
      }
    });
  }

  void populateImageList() {
    //           picList.add(path+ownerId+folder+images.image0+'.jpg');picList.add(path+ownerId+folder+images.image1+'.jpg');
    //           picList.add(path+ownerId+folder+images.image2+'.jpg');
    picList.add(path + ownerId + folder + images.image3);
    picList.add(path + ownerId + folder + images.image4);
    picList.add(path + ownerId + folder + images.image5);
    picList.add(path + ownerId + folder + images.image6);
    picList.add(path + ownerId + folder + images.image7);
    picList.add(path + ownerId + folder + images.image8);
    picList.add(path + ownerId + folder + images.image9);
    picList.add(path + ownerId + folder + images.image10);
    picList.add(path + ownerId + folder + images.image11);
    picList.add(path + ownerId + folder + images.image12);
    picList.add(path + ownerId + folder + images.image13);
    picList.add(path + ownerId + folder + images.image14);
    picList.add(path + ownerId + folder + images.image15);

//            imageTags.add(images.tag0);imageTags.add(images.tag1);
//            imageTags.add(images.tag2);
    imageTags.add(images.tag3);
    imageTags.add(images.tag4);
    imageTags.add(images.tag5);
    imageTags.add(images.tag6);
    imageTags.add(images.tag7);
    imageTags.add(images.tag8);
    imageTags.add(images.tag9);
    imageTags.add(images.tag10);
    imageTags.add(images.tag11);
    imageTags.add(images.tag12);
    imageTags.add(images.tag13);
    imageTags.add(images.tag14);
    imageTags.add(images.tag15);
  }

  void populateFeaturesList() {
    featurelist.add(features.feat1);
    featurelist.add(features.feat2);
    featurelist.add(features.feat3);
    featurelist.add(features.feat4);
    featurelist.add(features.feat5);
    featurelist.add(features.feat6);
    featurelist.add(features.feat7);
    featurelist.add(features.feat8);
    featurelist.add(features.feat9);
    featurelist.add(features.feat10);
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

  Container apartmentDetails(Apartment apartment) {
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

  Future<void> likes(var id) async {
    var result = await NetworkApi().addLike(id, userId);
    print(result);
  }

  Future<void> dislike(var id) async {
    var result = await NetworkApi().disLike(id, userId);
    print(result);
  }
}
