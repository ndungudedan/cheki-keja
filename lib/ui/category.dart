import 'package:cached_network_image/cached_network_image.dart';
import 'package:cheki_keja/blocs/category/bedsittercatbloc.dart';
import 'package:cheki_keja/blocs/category/doublecatbloc.dart';
import 'package:cheki_keja/blocs/category/onebedcatbloc.dart';
import 'package:cheki_keja/blocs/category/singlecatbloc.dart';
import 'package:cheki_keja/blocs/category/threebedcatbloc.dart';
import 'package:cheki_keja/blocs/category/twobedcatbloc.dart';
import 'package:cheki_keja/models/apartment.dart';
import 'package:cheki_keja/ui/apartdetails.dart';
import 'package:flutter/material.dart';
import 'package:cheki_keja/constants/constants.dart';
import 'package:cheki_keja/connection/networkApi.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class Category extends StatefulWidget {
  Category({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
  
  class _MyHomePageState extends State<Category>{
    SingleCatBloc singleCatBloc;
  DoubleCatBloc doubleCatBloc;
  BedSitterCatBloc bedSitterCatBloc;
  OneBedCatBloc oneBedCatBloc;
  TwoBedCatBloc twoBedCatBloc;
  ThreeBedCatBloc threeBedCatBloc;
   
   @override
  void initState() {
    super.initState();
    singleCatBloc = SingleCatBloc();
    doubleCatBloc = DoubleCatBloc();
    bedSitterCatBloc = BedSitterCatBloc();
    oneBedCatBloc = OneBedCatBloc();
    twoBedCatBloc = TwoBedCatBloc();
    threeBedCatBloc = ThreeBedCatBloc();
    singleCatBloc.fetchData(ApartmentCategory.single_id);
    doubleCatBloc.fetchData(ApartmentCategory.double_id);
    bedSitterCatBloc.fetchData(ApartmentCategory.bedsitter_id);
    oneBedCatBloc.fetchData(ApartmentCategory.one_bed_id);
    twoBedCatBloc.fetchData(ApartmentCategory.two_bed_id);
    threeBedCatBloc.fetchData(ApartmentCategory.three_bed_id);
  }
 
   @override
  void dispose() {
    super.dispose();
    singleCatBloc.dispose();
    doubleCatBloc.dispose();
    bedSitterCatBloc.dispose();
    oneBedCatBloc.dispose();
    twoBedCatBloc.dispose();
    threeBedCatBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Category'),
            elevation: 0,
            bottom: TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.white,
              labelColor: Color.fromARGB(255, 255, 101, 6),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                  color: Colors.white),
            tabs: [
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("SINGLES"),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("DOUBLES"),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("BEDSITTER"),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("ONE BED"),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("TWO BED"),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("THREE BED"),
                ),
              ),
            ]),
          ),
      body:TabBarView(     children: [
                            StreamBuilder(
                              stream: singleCatBloc.result,
                              builder: (context,
                                  AsyncSnapshot<List<MyApartment>> snapshot) {
                                if (snapshot.hasData &&
                                    snapshot.data.isNotEmpty) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(8),
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      return PostWidget(
                                          snapshot.data.elementAt(index),
                                          index);
                                    },
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text('No data'),
                                  );
                                } else if (snapshot.data != null &&
                                    snapshot.data.isEmpty) {
                                  return Center(
                                    child: Text('No data'),
                                  );
                                }
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                            StreamBuilder(
                              stream: doubleCatBloc.result,
                              builder: (context,
                                  AsyncSnapshot<List<MyApartment>> snapshot) {
                                if (snapshot.hasData &&
                                    snapshot.data.isNotEmpty) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(8),
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      return PostWidget(snapshot.data.elementAt(index),
                                          index);
                                    },
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text('No data'),
                                  );
                                } else if (snapshot.data != null &&
                                    snapshot.data.isEmpty) {
                                  return Center(
                                    child: Text('No data'),
                                  );
                                }
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                            StreamBuilder(
                              stream: bedSitterCatBloc.result,
                              builder: (context,
                                  AsyncSnapshot<List<MyApartment>> snapshot) {
                                if (snapshot.hasData &&
                                    snapshot.data.isNotEmpty) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(8),
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      return PostWidget(snapshot.data.elementAt(index),
                                          index);
                                    },
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text('No data'),
                                  );
                                } else if (snapshot.data != null &&
                                    snapshot.data.isEmpty) {
                                  return Center(
                                    child: Text('No data'),
                                  );
                                }
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                            StreamBuilder(
                              stream: oneBedCatBloc.result,
                              builder: (context,
                                  AsyncSnapshot<List<MyApartment>> snapshot) {
                                if (snapshot.hasData &&
                                    snapshot.data.isNotEmpty) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(8),
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      return PostWidget(
                                          snapshot.data.elementAt(index),
                                          index);
                                    },
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text('No data'),
                                  );
                                } else if (snapshot.data != null &&
                                    snapshot.data.isEmpty) {
                                  return Center(
                                    child: Text('No data'),
                                  );
                                }
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                            StreamBuilder(
                              stream: twoBedCatBloc.result,
                              builder: (context,
                                  AsyncSnapshot<List<MyApartment>> snapshot) {
                                if (snapshot.hasData &&
                                    snapshot.data.isNotEmpty) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(8),
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      return PostWidget(
                                          snapshot.data.elementAt(index),
                                          index);
                                    },
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text('No data'),
                                  );
                                } else if (snapshot.data != null &&
                                    snapshot.data.isEmpty) {
                                  return Center(
                                    child: Text('No data'),
                                  );
                                }
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                            StreamBuilder(
                              stream: threeBedCatBloc.result,
                              builder: (context,
                                  AsyncSnapshot<List<MyApartment>> snapshot) {
                                if (snapshot.hasData &&
                                    snapshot.data.isNotEmpty) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(8),
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      return PostWidget(
                                          snapshot.data.elementAt(index),
                                          index);
                                    },
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text('No data'),
                                  );
                                } else if (snapshot.data != null &&
                                    snapshot.data.isEmpty) {
                                  return Center(
                                    child: Text('No data'),
                                  );
                                }
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                          ]),
      
    )
    );
  }
    Container PostWidget(MyApartment myApartment, var index) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Apartdetails(apartment: myApartment)));
            },
            child: Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl: constants.path +
                            myApartment.ownerid +
                            constants.folder +
                            myApartment.ownerlogo,
                        placeholder: (context, url) => Container(
                            alignment: Alignment(0.0, 2.0),
                            child:
                                Center(child: CircularProgressIndicator())),
                        errorWidget: (context, url, error) => Container(
                            alignment: Alignment(0.0, 2.0),
                            child: Center(child: Icon(Icons.error))),
                      ),
                    ),
                    title: Text(
                      myApartment.ownername,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                    subtitle: Text(
                      myApartment.title,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                    trailing: RatingBarIndicator(
                      rating: double.parse(myApartment.rating),
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
                    child: Stack(
                      children: [
                        Container(
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                          child: CachedNetworkImage(
                            imageUrl: constants.path +
                                myApartment.ownerid +
                                constants.folder +
                                myApartment.banner.first.banner,
                            fit: BoxFit.fill,
                            placeholder: (context, url) => Container(
                                alignment: Alignment(0.0, 2.0),
                                child: Center(child: CircularProgressIndicator())),
                            errorWidget: (context, url, error) => Container(
                                alignment: Alignment(0.0, 2.0),
                                child: Center(child: Icon(Icons.error))),
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
                                    child: Text(
                                      myApartment.banner.last.tag,
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
        ],
      ),
    );
  } }