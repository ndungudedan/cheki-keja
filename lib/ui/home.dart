import 'package:cheki_keja/blocs/home/homebloc.dart';
import 'package:cheki_keja/blocs/home/homeevent.dart';
import 'package:cheki_keja/ui/homeview.dart';
import 'package:cheki_keja/utility/connectioncallback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cheki_keja/management/management.dart';

class Home extends StatefulWidget {
  Home(
      {Key key,
      @required this.controller,
      @required this.iscollapsed,
      @required this.press})
      : super(key: key);
  bool iscollapsed;
  AnimationController controller;
  final VoidCallback press;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool iscollapsed;
  AnimationController _controller;
  final _scrollController = ScrollController();
  PostBloc _postBloc;
  VoidCallback press;
  var paginationId = '0';

  @override
  void initState() {
    super.initState();
    press = widget.press;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    iscollapsed = widget.iscollapsed;
    _controller = widget.controller;
    press = widget.press;
    return Container(
      color: Colors.white,
      child: content(),
    );
  }

  Column content() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 50),
          color: Color.fromARGB(255, 255, 101, 6),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: () {
                  press();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                'Home',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Icon(
                Icons.search,
                color: Colors.transparent,
              ),
            ],
          ),
        ),
        ConnectionCallback(
          onlineCall: () {},
        ),
        Flexible(
          child: BlocProvider(
              create: (context) => PostBloc(
                  id: paginationId, userid: sharedPreferences.getUserId())
                ..add(PostFetched()),
              child: HomeView()),
        ),
      ],
    );
  }
}
