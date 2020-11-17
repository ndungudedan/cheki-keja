import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:cheki_keja/models/locations.dart' as locations;


class category extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CATEGORY',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'CATEGORY',),
    );
  }

}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

    }
  
  class _MyHomePageState extends State<MyHomePage>{
  int _selectedIndex = 0;
  VideoPlayerController _controller;
    final List<String> picList = [
         'assets/images/red0.jpg',
        'assets/images/red1.jpg',
        'assets/images/red2.jpg',
        'assets/images/red3.jpg',
        'assets/images/red4.jpg' 
];
  Future<void> _initializeVideoPlayerFuture;
  final List<String> imageList = [
  'https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg',
  'https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg',
  'https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg',
  'https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg',
  'https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg',
  'https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg'
];
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }
   
   @override
  void initState() { 

    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);

    super.initState();
  }
 
   @override
  void dispose() {

    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:GridView.count( 
          primary: true,
          crossAxisCount: 2,
          childAspectRatio: 6.0,
          children: List.generate(
            picList.length, (index){
              return featuresCard(picList.elementAt(index));
                      }),
              ),
      
    );
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
  }