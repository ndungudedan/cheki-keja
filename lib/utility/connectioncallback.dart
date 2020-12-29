import 'package:flutter/material.dart';
import 'package:connectivity_widget/connectivity_widget.dart';

class ConnectionCallback extends StatefulWidget {
  ConnectionCallback({
    Key key,
    this.onlineCall,
  }) : super(key: key);

  final VoidCallback onlineCall;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ConnectionCallback> {
  void onlineCall() {
    widget.onlineCall();
  }

  @override
  Widget build(BuildContext context) {
    return ConnectivityWidget(
      onlineCallback: onlineCall,
      //offlineCallback: offlineCall,
      showOfflineBanner: true,
      builder: (context, isOnline) => Center(),
      offlineBanner: Card(
        color: Colors.black,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text('no internet connection',style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
