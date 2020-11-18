import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class photoViewer extends StatefulWidget {
  List<String> picList = [];
  List<String> tagList = [];
  var index;
  photoViewer(
      {Key key,
      @required this.picList,
      @required this.tagList,
      @required this.index})
      : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<photoViewer> {
  List<String> picList = [];
  List<String> tagList = [];
  var index;
  
  @override
  void initState() {
    picList = widget.picList;
    tagList = widget.tagList;
    index = widget.index;
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Photoview'),),
      body: Container(
          color: Colors.black,
          child: Stack(
            children: <Widget>[
              CarouselSlider(
      items: populateImageList(index),
      options: CarouselOptions(
          viewportFraction: 0.99,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 1000),
          autoPlayCurve: Curves.slowMiddle,
          enlargeCenterPage: true,
          aspectRatio: 0.7,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index, reason) {
            setState(() {
              
            });
          }),
              ),
            ],
          ),
        ),
    );
  }

  List<Widget> populateImageList(int index) {
    return picList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        
                        Image(fit: BoxFit.fill,
                            image: CachedNetworkImageProvider(item)),
                        Positioned(
                          bottom: 0.0,
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
                              tagList.elementAt(picList.indexOf(item)),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
  }
}
