import 'package:cheki_keja/addTag.dart';
import 'package:cheki_keja/networkApi.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class createApartment extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: apartmentHome(title:'Apartment'),
    );
  }
}
class apartmentHome extends StatefulWidget{
  apartmentHome({Key key, this.title}) :super(key: key);
  final String title;
  @override
  _apartmentHomeState createState() => _apartmentHomeState();
}
class _apartmentHomeState extends State<apartmentHome>{
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    image_uri.insert(0, null);
    location=false;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
  List<File> image_uri=[];
  List<String> imagepaths=[];
  File videofile;
  String _imagefilePath;
  String apartmentName='';
  String apartmentPrice='';
  String apartmentLocation='';
  //String downloadurl='';
  List<String> downloadurl=[];
  Map<String,String> details={};
  String error1='';
  String user='no username';
  List<String> tags=[];
  List<String> features=[];
  var latitude;
  var longitude;
  bool location;
  bool isloading=false;
  Geolocator geolocator = Geolocator();
  Position currentLocation;
  final _imagepicker = ImagePicker();

final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    setState(() {
      _markers.clear();
      final marker= Marker(
          markerId: MarkerId(apartmentName),
          position: LatLng(latitude, longitude),
          infoWindow: InfoWindow(
            title: apartmentName,
        //    snippet: office.address,
          ),
        );
        _markers[apartmentName] = marker;
    });
  }
   

  void pickMultipleImages() async {
    try{
    var templist = await FilePicker.getMultiFile(
      type: FileType.image,
    );
    for(int i=0;i<=templist.length;i++){
      image_uri.add(templist.elementAt(i));
      imagepaths.add(image_uri.elementAt(i).path);
    }
  }
  on TargetPlatform catch (e) {
      print('Error while picking the file: ' + e.toString());
    }
  }
  void getImageFilePath() async {
    /* try {
      var tempImage = await _imagepicker.getImage(source: ImageSource.gallery);
      setState((){
        image_uri.add(File(tempImage.path));
        imagepaths.add(File(tempImage.path).toString());
      });
    } on TargetPlatform catch (e) {
      print('Error while picking the file: ' + e.toString());
    } */
  }
  void getVideoFilePath() async {
    try {
      var file = await FilePicker.getFile(type: FileType.video);
      if (file == null) {
        return;
      }
      setState((){
        videofile=file;
    if(videofile!=null){
    _controller = VideoPlayerController.file(videofile);

    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    }
      });

    } on TargetPlatform catch (e) {
      print('Error while picking the file: ' + e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('createApartment'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Center(
            child: videofile==null ? 
            Container(
              height: 200,
              child: IconButton(icon: Icon(Icons.videocam), 
              onPressed: getVideoFilePath),
            ) 
            : 
             Container(
               height: 200,
               child: FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: <Widget>[
                 AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
              ),
              Positioned(
                bottom: 0.0,
                top: 0.0,
                left: 0.0,
                right: 0.0,         
                child: IconButton(icon: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow,),
                onPressed: () {
                  if (_controller.value.isPlaying) {
                    setState((){
                    _controller.pause();
                    features.add('value');
                         });
                  
                  } else {
                     setState((){
                    _controller.play();
                         });
                  
                  }              
                },),
              ),
              ],                         
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
      },
      ),
             ),),

              Container(
                child: image_uri.isNotEmpty ?
                GridView.count( 
                  shrinkWrap: true,
          primary: true,       
          crossAxisCount: 3,
          childAspectRatio: 1.5,
          scrollDirection: Axis.vertical,
          children: List.generate(
            
            image_uri.length, (index){
              return GestureDetector(
                      child: index==0 ?
                      Container(
                        color: Colors.amberAccent,
                        child: IconButton(icon: Icon(Icons.add_a_photo), 
              onPressed: () { 
                pickMultipleImages();
               },),) :
                      Container(
                        height: MediaQuery.of(context).size.width / 3,
                        width: MediaQuery.of(context).size.width / 3,
                        alignment: Alignment.center,
                        child: Stack(children: <Widget>[
                          Image.file(image_uri.elementAt(index)),
                          
                              Positioned(
      bottom: 0.0,
      left: 0.0,
      right: 0.0,
      child: Text(tags.isNotEmpty ? tags.elementAt(index) : index.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
        ),
                        ],),
                      ),
                      onTap: () {
                        addtag(context, image_uri.elementAt(index),index);
                             },
                    );
                    }),
              ) : Container(child: IconButton(icon: Icon(Icons.add_a_photo), 
              onPressed: () { 
                getImageFilePath();
               },),),
              ),
     
              Card(child: Column(
                children: <Widget>[
                  Text('features'),
                  Container(
            child: GridView.count(
              shrinkWrap: true,
            crossAxisCount: 2,
            primary: true,
              childAspectRatio: 6.0,
              scrollDirection: Axis.vertical,
              children: List.generate(
                features.length, (index){
                    return featuresCard(features.elementAt(index));
                            }),),
                  ),             
                Container(
                  child: 
                      TextField(
      onSubmitted: (text){
          features.add(text);
          
                    },
      decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Add feature'
            
      ),
              ),
                      
                )
                ],
              ),), 
     
      Container(
       child: location==false ?
       Column(children: <Widget>[
       Container(
         height: 200,
         child: Center(
           child: isloading ?
           CircularProgressIndicator() :
           IconButton(icon: Icon(Icons.location_on), onPressed: () {
               setState(() {
                  isloading=true;
               });
               getApartmentLocation();
              },),
         ),
       ),
        Text('Add location..You should be at location of site for correct coordinates')
     ],)
     : Column(children: <Widget>[
       Container(
               height: 200,
               child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(latitude, longitude),
                      zoom: 2,
                    ),
                    markers: _markers.values.toSet(),
                  ),
             ),
     ],)
     ), 

     Column(
      children: <Widget>[
      TextField(
        onChanged: (text){
          apartmentName=text;
        },
      decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Company name'
      ),
      ),
      TextField(
        onChanged: (text){
          apartmentLocation=text;
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Company location'
        ),
      ),
      TextField(
        onChanged: (text){
          apartmentPrice=text;
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Company price'
        ),
      ),
      ],
    ),

    RaisedButton(child: Text('SUBMIT'),
    onPressed: () {
      submit();
    },
    
    textColor:Colors.blue,)

        ],
      
      
      ),
    );
  }
  void addtag(BuildContext context,var image,var index) async {
     final result = await Navigator.push(context,
      MaterialPageRoute(builder: (context) => addTag(image: image,index: index,)),
    );
    tags.insert(1, result);
  }

   Row featuresCard(var feature) {
              return Row(              
                children: <Widget>[
                Icon(Icons.star),
                Container(
                  child: Text(feature,
                  style: TextStyle(
                  color: Colors.lightBlueAccent,

                ),)                
                  )
              ],
              );
            }

    Future<Position> locateApartment() async {
    return geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
    
    void getApartmentLocation() async {
    currentLocation = await locateApartment();
    setState(() {
      latitude=currentLocation.latitude;
      longitude=currentLocation.longitude;
      location=true;
    });
  }
  void submit() async {
    details['latitude']=latitude;
    details['longitude']=longitude;
    details['apartmentName']=apartmentName;
    details['apartmentPrice']=apartmentPrice;
    
    var result = await NetworkApi().upload(videofile,imagepaths,tags,features,details);
    print(result);

  }

}