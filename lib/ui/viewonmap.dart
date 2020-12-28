import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ViewOnMap extends StatefulWidget {
  ViewOnMap({Key key, this.latitude, this.longitude}) : super(key: key);
  String latitude;
  String longitude;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ViewOnMap> {
  String latitude;
  String longitude;
  final Map<String, Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    latitude = widget.latitude;
    longitude = widget.longitude;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Apartment Location'),
        ),
        body: GoogleMap(
          // onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(double.parse(latitude), double.parse(longitude)),
            zoom: 2,
          ),
          markers: _markers.values.toSet(),
        ),
      ),
    );
  }
}