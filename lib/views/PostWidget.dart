import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/constants/constants.dart';
import 'package:cheki_keja/database/dao.dart';
import 'package:cheki_keja/database/databasehelper.dart';
import 'package:cheki_keja/management/management.dart';
import 'package:cheki_keja/models/status.dart';
import 'package:cheki_keja/ui/apartdetails.dart';
import 'package:cheki_keja/ui/reviews.dart';
import 'package:cheki_keja/ui/viewonmap.dart';
import 'package:cheki_keja/views/postWidgetTopBar.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:moor/moor.dart ' as value;

class PostWidget extends StatefulWidget {
  var myApartment;
  var index;
  bool online;
  PostWidget(
      {Key key,
      @required this.myApartment,
      @required this.index,
      @required this.online})
      : super(key: key);

  @override
  _DrawState createState() => _DrawState();
}

class _DrawState extends State<PostWidget> {
  var myApartment;
  var index;
  bool online;
  var dao = DatabaseDao(databasehelper);
  @override
  void initState() {
    super.initState();
    online = widget.online;
    index = widget.index;
    myApartment = widget.myApartment;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      Apartdetails(online: online, apartment: myApartment)));
            },
            child: Card(
              child: Column(
                children: <Widget>[
                  PostWIdgetTopBar(
                    title: myApartment.title,
                    ownerid: myApartment.ownerid,
                    ownerlogo: myApartment.ownerlogo,
                    ownername: myApartment.ownername,
                    rating: myApartment.rating,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                         // height: 300,
                          width: MediaQuery.of(context).size.width,
                          child: CachedNetworkImage(
                            imageUrl: constants.path +
                                    myApartment.ownerid +
                                    constants.folder +
                                    myApartment.banner,
                            fit: BoxFit.fill,
                            placeholder: (context, url) => Container(
                                color: greyPlaceHolder,
                                alignment: Alignment(0.0, 2.0),
                                child: Center(
                                  
                                    child: Container(
                                      height: 300,
                                      child: SizedBox(
                                        
                                          height: 30,
                                          width: 30,
                                          child: CircularProgressIndicator()),
                                    ))),
                            errorWidget: (context, url, error) => Container(
                              height: 300,
                                color: lightgreyPlaceHolder,
                                alignment: Alignment(0.0, 2.0),
                                child: Center(
                                    child: Icon(
                                  Icons.error,
                                  size: 50,
                                ))),
                          ),
                        ),
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
                            child: Text(myApartment.bannertag,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              LikeButton(
                isLiked: myApartment.liked.isNotEmpty,
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
                  icon: Icon(
                    Icons.comment,
                    color: Colors.amber,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Reviews(
                              apartmentId: myApartment.id,
                            )));
                  }),
              Text(myApartment.comments),
              IconButton(
                  icon: Icon(
                    Icons.location_on_outlined,
                    color: Colors.amber,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ViewOnMap(
                              title: myApartment.title,
                              address: myApartment.address,
                              latitude: myApartment.latitude,
                              longitude: myApartment.longitude,
                            )));
                  }),
              myApartment.vacant ? Image.asset('name')
              :SizedBox()
            ],
          ),
        ],
      ),
    );
  }

  Future<bool> likes(var id) async {
    if (sharedPreferences.getOnline()) {
      var result =
          await NetworkApi().addLike(id, sharedPreferences.getUserId());
      print(result);
      var res = json.decode(result);
      var status = Status.fromJson(res);
      if (status.code == Constants.success) {
        return true;
      } else {
        return false;
      }
    } else {
      var companion = OfflineActivityCompanion(
        userId: value.Value(sharedPreferences.getUserId()),
        apartmentId: value.Value(id),
        like: value.Value(true),
      );
      dao.insertOfflineActivity(companion);
    }
  }

  Future<bool> dislike(var id) async {
    if (sharedPreferences.getOnline()) {
      var result =
          await NetworkApi().disLike(id, sharedPreferences.getUserId());
      print(result);
      var res = json.decode(result);
      var status = Status.fromJson(res);
      if (status.code == Constants.success) {
        return false;
      } else {
        return true;
      }
    } else {
      var companion = OfflineActivityCompanion(
        userId: value.Value(sharedPreferences.getUserId()),
        apartmentId: value.Value(id),
        like: value.Value(false),
      );
      dao.insertOfflineActivity(companion);
    }
  }
}
