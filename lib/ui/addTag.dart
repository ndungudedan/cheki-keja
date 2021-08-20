import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class addTag extends StatelessWidget{
  var image;
  var index;
  addTag({this.image,this.index});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'photoViewer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(image:image,index: index,),
    );
  }

}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key,required this.image,this.index}) : super(key: key);
  var image;
  var index;
  @override
  _MyHomePageState createState() => _MyHomePageState();

    }
  
  class _MyHomePageState extends State<MyHomePage>{
    String? tag;
    var image;
    var index;

   @override
  void initState() { 
    image=widget.image;
    index=widget.index;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        IconButton(icon: Icon(Icons.done), 
        onPressed: () { 
           Navigator.pop(context, tag);
         },),
      ],),
      body:Container(child: Stack(children: <Widget>[
         Image.file(image, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: TextField(
        onChanged: (text){
          tag=text;
        },
      decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Add tag'
      ),
      ),
          ),
      ],),)
    );
  }
  } 