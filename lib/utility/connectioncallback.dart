import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/database/dao.dart';
import 'package:cheki_keja/database/databasehelper.dart';
import 'package:cheki_keja/management/management.dart';
import 'package:flutter/material.dart';

class ConnectionCallback extends StatefulWidget {
  ConnectionCallback({
    Key? key,
    this.onlineCall,
  }) : super(key: key);

  final VoidCallback? onlineCall;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ConnectionCallback> {
  var dao = DatabaseDao(databasehelper);
  void onlineCall() {
    widget.onlineCall!();
    sharedPreferences.setOnline(true);
    updateOnlinedb();
  }

  void offlineCall() {
    sharedPreferences.setOnline(false);
  }

  @override
  Widget build(BuildContext context) {
    return Center();
    /* ConnectivityWidget(
      offlineCallback: offlineCall,
      onlineCallback: onlineCall,
      showOfflineBanner: true,
      builder: (context, isOnline) => Center(),
      offlineBanner: Card(
        color: Colors.black,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            'no internet connection',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ); */
  }

  Future<void> updateOnlinedb() async {
    var result = await dao.watchOfflineActivity();
    if (result.isNotEmpty) {
      result.forEach((val) async {
        if (val.like!) {
          var res = await NetworkApi()
              .addLike(val.apartmentId, sharedPreferences.getUserId());
          print(res);
        } else if (val.dislike!) {
          var res = await NetworkApi()
              .disLike(val.apartmentId, sharedPreferences.getUserId());
          print(res);
        }
      });
      dao.deleteOfflineActivity();
    }
  }
}
