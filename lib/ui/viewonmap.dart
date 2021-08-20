import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ViewOnMap extends StatefulWidget {
  ViewOnMap({Key? key, this.apartment, this.online}) : super(key: key);
  var apartment;
  var online;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ViewOnMap> {
  var apartment;
  final Map<String?, Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    apartment = widget.apartment;
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    setState(() {
      _markers.clear();
      final marker = Marker(
        consumeTapEvents: true,
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(apartment.title),
                  content: Text('Managed by: ' +
                      apartment.ownername +'\nphone: ' +
                      apartment.phone +
                      '\naddress: ' +
                      apartment.location),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('ok'))
                  ],
                );
              });
        },
        markerId: MarkerId(apartment.title),
        position: LatLng(apartment.latitude, apartment.longitude),
        infoWindow: InfoWindow(
          title: apartment.title,
          snippet: apartment.location,
        ),
      );
      _markers[apartment.title] = marker;
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
          target: LatLng(apartment.latitude, apartment.longitude),
          zoom: 12,
        ),
        markers: _markers.values.toSet(),
      ),
    );
  }
}
