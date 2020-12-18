import 'package:cached_network_image/cached_network_image.dart';
import 'package:cheki_keja/models/reviewClass.dart';
import 'package:cheki_keja/ui/addReview.dart';
import 'package:flutter/material.dart';

class Reviews extends StatefulWidget {
  var apartmentId;
  List<Review> reviews;
  Reviews({Key key, @required this.apartmentId,@required this.reviews}) : super(key: key);

  final String title = 'apartmentDetails';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Reviews> {
  List<Review> reviews;
    bool _loadingMore;
  bool signedIn;
  var apartmentId;
  var paginationId = '0';

  @override
  void initState() {
    super.initState();
    reviews=widget.reviews;
    apartmentId = widget.apartmentId;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),
      ),
      body:ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: reviews.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: CachedNetworkImageProvider(reviews.elementAt(index).user.photo),),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(reviews.elementAt(index).user.name),
                        Text(reviews.elementAt(index).timeline.substring(0,10))
                      ],
                    ),
                    subtitle: Text(reviews.elementAt(index).review),
                  );
                },
              ),
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(50)),
              child: Container(
          color: Color.fromARGB(255, 238, 133, 57),
          child: IconButton(
            color: Colors.white,
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddReview()));
            },
          ),
        ),
      ),
    );
  }
}
