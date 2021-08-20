import 'package:cheki_keja/blocs/home/homebloc.dart';
import 'package:cheki_keja/blocs/home/homeevent.dart';
import 'package:cheki_keja/blocs/home/homestate.dart';
import 'package:cheki_keja/constants/constants.dart';
import 'package:cheki_keja/database/dao.dart';
import 'package:cheki_keja/database/databasehelper.dart';
import 'package:cheki_keja/management/management.dart';
import 'package:cheki_keja/views/PostWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeView> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  late PostBloc _postBloc;
  bool signed_in = false;
  int _current = 0;
  Constants constants = Constants();
  List<int> likes_count = [];
  List<int> comments_count = [];
  VoidCallback? press;
  var dao = DatabaseDao(databasehelper);
  bool _loadingMore = true;
  var _hasMoreItems = true;
  var userId;
  var paginationId = '0';
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _postBloc = BlocProvider.of<PostBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostInitial) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PostFailure) {
          sharedPreferences.setOnline(false);
          return StreamBuilder<List<MyApartmentTableData>>(
            stream: dao.watchPosts(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return ListView.builder(
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return PostWidget(
                        online: false,
                        myApartment: snapshot.data!.elementAt(index),
                        index: index);
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Image.asset('assets/images/no_data.png'),
                );
              } else if (snapshot.data != null && snapshot.data!.isEmpty) {
                return Center(
                  child: Image.asset('assets/images/no_data.png'),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        }
        if (state is PostSuccess) {
          sharedPreferences.setOnline(true);
          if (state.posts!.isEmpty) {
            return Center(
              child: Image.asset('assets/images/no_data.png'),
            );
          }
          return Container(
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemBuilder: (BuildContext context, int index) {
                print(state.posts!);
                return index >= state.posts!.length
                    ? BottomLoader()
                    : PostWidget(
                        online: true,
                        myApartment: state.posts![index],
                        index: index);
              },
              itemCount: state.hasReachedMax!
                  ? state.posts!.length
                  : state.posts!.length + 1,
              controller: _scrollController,
            ),
          );
        }
        return Container();
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _postBloc.add(PostFetched());
    }
  }

  Container BottomLoader() {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}
