import 'package:cached_network_image/cached_network_image.dart';
import 'package:cheki_keja/connection/networkApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PostWIdgetTopBar extends StatelessWidget {
  PostWIdgetTopBar({required this.ownerid,required this.ownerlogo,
  required this.ownername,required this.title,required this.rating,});
  String? ownerid;
  String? ownerlogo;
  String? rating;
  String? title;
  String? ownername;

  @override
  Widget build(BuildContext context) {
    return Container(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(60),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 25,
                                        backgroundImage: CachedNetworkImageProvider(ownerlogo!),
                    ),
                  ),
    ),
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(
                    ownername!,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                  Text(
                    title!,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                  ],),
                )),
                RatingBarIndicator(
                  rating: double.parse(rating!),
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 20.0,
                  direction: Axis.horizontal,
                ),
        ],)
      );
  }
}
