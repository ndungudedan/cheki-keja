import 'dart:async';
import 'dart:convert';
import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/models/complainsClass.dart';
import 'package:cheki_keja/ui/addComplain.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Complains extends StatefulWidget {
  Complains({
    Key? key,
  }) : super(key: key);

  final String title = 'Complains';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Complains> {
  ComplainList complainList = ComplainList();
  late SharedPreferences prefs;
  var _hasMoreItems = true;
  bool? _loadingMore;
  bool? signedIn;
  bool empty = false;
  //for testing purposes
  String? apartmentId = '13', userId;
  StreamController<Complain> _streamController = StreamController<Complain>();
  String? paginationId = '0';
  List<Complain> complains = [];
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
        title: Text('Complains'),
        actions: <Widget>[],
      ),
      body: StreamBuilder(
          stream: _streamController.stream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: complains.length,
                itemBuilder: (BuildContext context, int index) {
                  if ((_hasMoreItems) &&
                      index == complainList.complains!.length - 1) {
                    if (!(_loadingMore ?? false)) {
                      _loadMoreItems();
                    }
                  }
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child:
                          Image.network(complains.elementAt(index).user!.photo!),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(complains.elementAt(index).user!.name!),
                        Text(complains
                            .elementAt(index)
                            .timeline!
                            .substring(0, 10))
                      ],
                    ),
                    subtitle: Text(complains.elementAt(index).title!),
                  );
                },
              );
            } else if (empty) {
              return Center(
                child: Text('No results'),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: Container(
        color: Colors.blue,
        child: Builder(
          builder: (context) => IconButton(
            color: Colors.deepOrange,
            icon: Icon(Icons.add),
            onPressed: () {
              if (!signedIn!) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddComplains()));
                //showDialog(context: context, builder: (_) => complain());
              } else {
                Scaffold.of(context)
                    .showSnackBar(snack('Please Sign in first'));
              }
            },
          ),
        ),
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
        fetchComplains();
        signedIn = prefs.getBool('issignedin');
        userId = prefs.getString('userId');
        //apartmentId = prefs.getString('apartmentId');
      });
    }
  }

  void fetchComplains() async {
    var result = await NetworkApi().getComplains(apartmentId, paginationId);
    print(result);
    var Map = json.decode(result);
    setState(() {
      _loadingMore = false;

      complainList = ComplainList.fromJson(Map);
      if (complainList.complains!.isEmpty) {
        _hasMoreItems = false;
        if (paginationId!.contains('0')) {
          empty = true;
        }
      } else {
        for (int i = 0; i < complainList.complains!.length; i++) {
          _streamController.add(complainList.complains!.elementAt(i));
          complains.add(complainList.complains!.elementAt(i));
          if (int.parse(complainList.complains!.elementAt(i).id!) >
              int.parse(paginationId!)) {
            paginationId = complainList.complains!.elementAt(i).id;
          }
        }
      }
    });
  }

  void _loadMoreItems() {
    fetchComplains();
    setState(() {
      _loadingMore = true;
    });
  }
}
