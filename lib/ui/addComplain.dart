import 'dart:async';
import 'package:cheki_keja/complainsClass.dart';
import 'package:cheki_keja/networkApi.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddComplains extends StatefulWidget {
  AddComplains({
    Key key,
  }) : super(key: key);

  final String title = 'Complains';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AddComplains> {
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
        title: Text('Raise Complain'),
        actions: <Widget>[],
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              maxLength: 100,
              maxLines: 2,
              maxLengthEnforced: true,
              controller: titleController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Write a relevant heading'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              maxLengthEnforced: true,
              maxLength: 500,
              maxLines: 15,
             // minLines: 2,
              controller: descriptionController,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'describe the issue'),
            ),
          ),
          Center(
            child: FlatButton(
              color: Colors.lightBlueAccent,
              child: Text('Submit'),
              onPressed: () {
                submit();
              },
            ),
          )
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

  void submit() async {
    var result = await NetworkApi().addComplain(
        apartmentId, userId, titleController.text, descriptionController.text);
    
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
