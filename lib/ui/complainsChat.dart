/* import 'dart:async';
import 'dart:convert';
import 'package:cheki_keja/addReview.dart';
import 'package:cheki_keja/complainsClass.dart';
import 'package:cheki_keja/networkApi.dart';
import 'package:cheki_keja/reviewClass.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ComplainsChats extends StatefulWidget {
  Complain complain;
  ComplainsChats({Key key, @required var this.complain}) : super(key: key);

  final String title = 'apartmentDetails';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ComplainsChats> {
  ChatsResponses chatsResponses = ChatsResponses();
  List<ComplainChat> chatList = List<ComplainChat>();
  List<ComplainResponse> responseList = List<ComplainResponse>();
  SharedPreferences prefs;
  ComplainChat chat;
  Complain complain;
  ComplainResponse response;
  var _hasMoreItems = true;
  bool _loadingMore;
  bool signedIn;
  //for testing purposes
  var apartmentId = '13', userId;
  StreamController<ChatsResponses> _streamController =
      StreamController<ChatsResponses>();
  var paginationId = '0';

  @override
  void initState() {
    super.initState();
    complain = widget.complain;
    fetchChats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(title: Text(complain.title),
      ),
      body: Column(
        children: <Widget>[
      Center(child:Container(
        child:ExpansionTile(
          title: Text('more details'),
          trailing: Text(complain.timeline),
          children: <Widget>[
          Text(complain.description)
        ],),
        )),   
          StreamBuilder(
              stream: _streamController.stream,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: reviews.length,
                    itemBuilder: (BuildContext context, int index) {
                      if ((_hasMoreItems ?? false) &&
                          index == reviewList.reviews.length - 1) {
                        if (!(_loadingMore ?? false)) {
                          _loadMoreItems();
                        }
                      }
                      return ListTile(
                        leading: CircleAvatar(
                          child: Image.network(reviews.elementAt(index).user.photo),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(reviews.elementAt(index).user.name),
                            Text(reviews.elementAt(index).timeline)
                          ],
                        ),
                        subtitle: Text(reviews.elementAt(index).review),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ],
      ),
    );
  }

  void fetchChats() async {
    var result = await NetworkApi()
        .getComplainChats(apartmentId, complain.id, paginationId);
    print(result);
    var Map = json.decode(result);
    setState(() {
      _loadingMore = false;
      chatsResponses = ChatsResponses.fromJson(Map);
      if (chatsResponses.chatList.chats.isEmpty &&
          chatsResponses.responseList.responses.isEmpty) {
        _hasMoreItems = false;
      } else {
        for (int i = 0; i < chatsResponses.chatList.chats.length; i++) {
          _streamController.add(chatsResponses);
          chatList.add(chatsResponses.chatList.chats.elementAt(i));
          if (int.parse(chatsResponses.chatList.chats.elementAt(i).id) >
              int.parse(paginationId)) {
            paginationId = chatsResponses.chatList.chats.elementAt(i).id;
          }
        }
        for (int i = 0; i < chatsResponses.responseList.responses.length; i++) {
          _streamController.add(chatsResponses);
          chatList.add(chatsResponses.chatList.chats.elementAt(i));
        }
      }
    });
  }

  Future<void> getPrefs() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('issignedin')) {
      setState(() {
        fetchChats();
        userId = prefs.getString('userId');
        //apartmentId = prefs.getString('apartmentId');
      });
    }
  }

  void _loadMoreItems() {
    fetchChats();
    setState(() {
      _loadingMore = true;
    });
  }
} */