import 'dart:convert';
import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/models/locations.dart';
import 'package:cheki_keja/ui/apartdetails.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Gmap extends StatefulWidget {
  Gmap();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Gmap> {
  final Map<String, Marker> _markers = {};
  List<Point> points = List<Point>();
  var tar_lat = "-1.362863";
  var tar_long = "36.834583";

  Future<void> _onMapCreated(GoogleMapController controller) async {
    var result = await NetworkApi().getApartmentLocations();
    print(result);
    var Map = json.decode(result);
    var locations = Locations.fromJson(Map);
    points = locations.data;

    setState(() {
      _markers.clear();
      points.forEach((point) {
        final marker = Marker(
          consumeTapEvents: true,
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(point.title),
                    content: Text('phone: ' +
                        point.phone +
                        '\naddress: ' +
                        point.address),
                    actions: [
                      TextButton(
                          onPressed: () {
                            fetchApartment(point.id);
                          },
                          child: Text('see'))
                    ],
                  );
                });
          },
          markerId: MarkerId(point.title),
          position: LatLng(
              double.parse(point.latitude), double.parse(point.longitude)),
          infoWindow: InfoWindow(
            title: point.title,
            snippet: point.address,
          ),
        );
        _markers[point.id] = marker;
        tar_lat = point.latitude;
        tar_long = point.longitude;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    //fetchLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apartment Locations'),
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(double.parse(tar_lat), double.parse(tar_long)),
            zoom: 8,
          ),
          markers: _markers.values.toSet(),
        ),
      ),
    );
  }

  void fetchLocations() async {
    var result = await NetworkApi().getApartmentLocations();
    print(result);
    var Map = json.decode(result);
    var locations = Locations.fromJson(Map);
    setState(() {
      points = locations.data;
    });
  }

  Future<void> fetchApartment(var id) async {
    var result = await NetworkApi().getSingleApartment(id);
    print(result);
    Navigator.pop(context);
    if (result != null) {
      await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              Apartdetails(online: true, apartment: result.first)));
    }
  }
}
