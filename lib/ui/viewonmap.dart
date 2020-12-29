import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ViewOnMap extends StatefulWidget {
  ViewOnMap({Key key, this.latitude, this.longitude, this.address, this.title})
      : super(key: key);
  String latitude;
  String longitude;
  String title;
  String address;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ViewOnMap> {
  String latitude;
  String longitude;
  String address;
  String title;
  final Map<String, Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    latitude = widget.latitude;
    longitude = widget.longitude;
    title = widget.title;
    address = widget.address;
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    setState(() {
      _markers.clear();
      final marker = Marker(
        markerId: MarkerId(title),
        position: LatLng(double.parse(latitude), double.parse(longitude)),
        infoWindow: InfoWindow(
          title: title,
          snippet: address,
        ),
      );
      _markers[title] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Apartment Location'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(double.parse(latitude), double.parse(longitude)),
          zoom: 8,
        ),
        markers: _markers.values.toSet(),
      ),
    );
  }
}