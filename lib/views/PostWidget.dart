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
import 'package:cheki_keja/utility/utils.dart';
import 'package:cheki_keja/views/postWidgetTopBar.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:moor/moor.dart ' as value;
import 'package:share/share.dart';

class PostWidget extends StatefulWidget {
  var myApartment;
  var index;
  bool online;
  PostWidget(
      {Key? key,
      required this.myApartment,
      required this.index,
      required this.online})
      : super(key: key);

  @override
  _DrawState createState() => _DrawState();
}

class _DrawState extends State<PostWidget> {
  var myApartment;
  var index;
  bool? online;
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
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
                    ownerid: myApartment.ownerid.toString(),
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
                            imageUrl: myApartment.banner,
                            fit: BoxFit.fill,
                            placeholder: (context, url) => Container(
                                height: 300,
                                color: greyPlaceHolder,
                                alignment: Alignment(0.0, 2.0),
                                child: Center(
                                    child: SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: CircularProgressIndicator()))),
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
                          right: 10.0,
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
                              myApartment.bannertag,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        myApartment.vacant
                            ? Positioned(
                                top: 0.0,
                                left: 40.0,
                                child: ClipRRect(
                                    //borderRadius: BorderRadius.circular(25),
                                    child: Image.asset(
                                  'assets/images/vacant.png',
                                  height: 30,
                                  width: 30,
                                )),
                              )
                            : SizedBox()
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /* Builder(
                builder: (context) => LikeButton(
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
                  countBuilder: (int? count, bool isLiked, String text) {
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
                    if (sharedPreferences.getSignedIn()) {
                      if (!isLiked) {
                        return likes(myApartment.id);
                      } else {
                        return dislike(myApartment.id);
                      }
                    } else {
                      Scaffold.of(context)
                          .showSnackBar(snack('Please Sign in first'));
                          
                     return Future<bool>.value(false);
                    }
                  },
                ),
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
              Text(myApartment.comments), */
              SizedBox(),
              IconButton(
                  icon: Icon(
                    Icons.location_on_outlined,
                    color: Colors.amber,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ViewOnMap(online: online, apartment: myApartment)));
                  }),
              SizedBox(),
              FutureBuilder<String>(
                  future: dynamicLink(myApartment.id),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return IconButton(
                          icon: Icon(
                            Icons.share,
                            color: Colors.amber,
                          ),
                          onPressed: () {
                            Share.share(snapshot.data!);
                          });
                    } else {
                      return SizedBox();
                    }
                  }),
            ],
          ),
          Divider()
        ],
      ),
    );
  }

  Future<bool> likes(var id) async {
    myApartment.liked = '1';
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
      return true;
    }
  }

  Future<bool> dislike(var id) async {
    myApartment.liked = '';
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
      return false;
    }
  }

  SnackBar snack(String message) {
    return SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 500),
    );
  }
}
