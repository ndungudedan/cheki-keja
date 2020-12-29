import 'dart:async';
import 'package:cheki_keja/models/complainsClass.dart';
import 'package:cheki_keja/utility/connectioncallback.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Contact extends StatefulWidget {
  Contact({
    Key key,
  }) : super(key: key);

  final String title = 'Complains';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Contact> {
  ComplainList complainList = ComplainList();
  SharedPreferences prefs;
  bool signedIn;
  bool empty = false;
  //for testing purposes
  var apartmentId = '13', userId;
  StreamController<Complain> _streamController = StreamController<Complain>();
  var paginationId = '0';
  List<Complain> complains = List<Complain>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Contact us'),
        actions: <Widget>[],
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ConnectionCallback(
          onlineCall: () {},
        ),
          Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              IconButton(icon: Icon(Icons.call,color: Colors.red,),
              onPressed: () {
                
              },
              ),Text('Call us'),
              IconButton(icon: Icon(Icons.email,color: Colors.red),
              onPressed: () {
                
              },
              ),Text('Email us'),
              IconButton(icon: Icon(Icons.message,color: Colors.red),
              onPressed: () {
                
              },
              ),Text('Message us'),
            ],),
          ),

         ListTile(
           title: Text('Phone'),
           leading: Icon(Icons.call),
           subtitle: Text('owner_phone'),
         ),
         ListTile(
           title: Text('Email'),
           leading: Icon(Icons.email),
           subtitle: Text('owner_email'),
         ),
         ListTile(
           title: Text('Address'),
           leading: Icon(Icons.account_box),
           subtitle: Text('owner_address' +
               '\n' +
               'owner_location'),
         ),
         ],
      
      ),
       
    );
  }

  SnackBar snack(String message) {
    return SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 300),
    );
  }

  Future<void> getPrefs() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('issignedin')) {
      setState(() {
        signedIn = prefs.getBool('issignedin');
        userId = prefs.getString('userId');
        //apartmentId = prefs.getString('apartmentId');
      });
    }
  }
}