import 'package:cached_network_image/cached_network_image.dart';
import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PostWIdgetTopBar extends StatelessWidget {
  PostWIdgetTopBar({@required this.ownerid,@required this.ownerlogo,
  @required this.ownername,@required this.title,@required this.rating,});
  String ownerid;
  String ownerlogo;
  String rating;
  String title;
  String ownername;

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Container(
        child:Row(children: [
          ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                          imageUrl: constants.path +
                              ownerid +
                              constants.folder +
                              ownerlogo,
                          placeholder: (context, url) => Container(
                              color: greyPlaceHolder,
                              alignment: Alignment(0.0, 2.0),
                              child: Center(child: CircularProgressIndicator())),
                          errorWidget: (context, url, error) => Container(
                              color: lightgreyPlaceHolder,
                              alignment: Alignment(0.0, 2.0),
                              child: Center(
                                  child: Icon(
                                Icons.error,
                                size: 50,
                              ))),
                        ),
                      ),
                      Expanded(child: Column(children: [
                        Text(
                        ownername,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                      ],)),
                      RatingBarIndicator(
                        rating: double.parse(rating),
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),
        ],)
      ),
    );
  }
}
