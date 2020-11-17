import 'dart:async';
import 'dart:convert';
import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/models/reviewClass.dart';
import 'package:cheki_keja/ui/addReview.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/* class Reviews extends StatelessWidget {
  var apartmentId;
  ReviewList reviewList;
  Reviews({this.apartmentId, this.reviewList});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
        apartmentId: apartmentId,
        reviewList: reviewList,
      ),
    );
  }
} */

class Reviews extends StatefulWidget {
  var apartmentId;
  ReviewList reviewList;
  Reviews(
      {Key key, @required var this.apartmentId, @required var this.reviewList})
      : super(key: key);

  final String title = 'apartmentDetails';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Reviews> {
  ReviewList reviewList = ReviewList();
  SharedPreferences prefs;
  var _hasMoreItems = true;
  bool _loadingMore;
  bool signedIn;
  var apartmentId;
  List<Review> reviews = List<Review>();
  StreamController<Review> _streamController = StreamController<Review>();
  var paginationId = '0';

  @override
  void initState() {
    super.initState();
    apartmentId = widget.apartmentId;
    reviewList = widget.reviewList;
    for (int i = 0; i < reviewList.reviews.length; i++) {
      _streamController.add(reviewList.reviews.elementAt(i));
      reviews.add(reviewList.reviews.elementAt(i));
    }
    fetchReviews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: _streamController.stream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: reviews.length,
                itemBuilder: (BuildContext context, int index) {
                  if ((_hasMoreItems ?? false) &&
                      index == reviewList.reviews.length - 1) {
                    if (!(_loadingMore ?? false)) {
                      _loadMoreItems();
                    }
                  }
                  return ListTile(
                    leading: CircleAvatar(
                      child: Image.network(reviews.elementAt(index).user.photo),),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(reviews.elementAt(index).user.name),
                        Text(reviews.elementAt(index).timeline)
                      ],
                    ),
                    subtitle: Text(reviews.elementAt(index).review),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: Container(
        color: Colors.blue,
        child: IconButton(
          color: Colors.deepOrange,
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddReview()));
          },
        ),
      ),
    );
  }

  void fetchReviews() async {
    var result = await NetworkApi().getReviews(apartmentId, paginationId);
    print(result);
    var Map = json.decode(result);
    setState(() {
      _loadingMore = false;
      reviewList = ReviewList.fromJson(Map);
      if (reviewList.reviews.isEmpty) {
        _hasMoreItems = false;
      } else {
        for (int i = 0; i < reviewList.reviews.length; i++) {
          _streamController.add(reviewList.reviews.elementAt(i));
          reviews.add(reviewList.reviews.elementAt(i));
          if (int.parse(reviewList.reviews.elementAt(i).id) >
              int.parse(paginationId)) {
            paginationId = reviewList.reviews.elementAt(i).id;
          }
        }
      }
    });
  }

  void _loadMoreItems() {
    fetchReviews();
    setState(() {
      _loadingMore = true;
    });
  }
}
