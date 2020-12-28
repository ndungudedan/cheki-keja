import 'package:cached_network_image/cached_network_image.dart';
import 'package:cheki_keja/blocs/reviewbloc.dart';
import 'package:cheki_keja/models/reviewClass.dart';
import 'package:cheki_keja/ui/addReview.dart';
import 'package:flutter/material.dart';

class Reviews extends StatefulWidget {
  var apartmentId;
  List<Review> reviews;
  Reviews({Key key, this.apartmentId, this.reviews})
      : super(key: key);

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
  ReviewBloc review_bloc;

  @override
  void initState() {
    super.initState();
    reviews = widget.reviews;
    apartmentId = widget.apartmentId;
    if (reviews == null) {
      review_bloc = ReviewBloc();
      review_bloc.fetchReviews(apartmentId, paginationId);
    }
  }

  @override
  void dispose() {
    super.dispose();
    review_bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),
      ),
      body: review_bloc != null
          ? StreamBuilder(
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
                              child: Image.network(
                                  snapshot.data.elementAt(index).user.photo),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(snapshot.data.elementAt(index).user.name),
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
                      snapshot.data != null && snapshot.data.isNotEmpty
                          ? GestureDetector(
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
                } else if (snapshot.data != null && snapshot.data.isEmpty) {
                  return Center(
                    child: Text('No reviews yet'),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: reviews.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: CachedNetworkImageProvider(
                        reviews.elementAt(index).user.photo),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(reviews.elementAt(index).user.name),
                      Text(reviews.elementAt(index).timeline.substring(0, 10))
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddReview()));
            },
          ),
        ),
      ),
    );
  }
}
