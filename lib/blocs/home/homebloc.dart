import 'dart:async';
import 'package:cheki_keja/blocs/home/homeevent.dart';
import 'package:cheki_keja/blocs/home/homestate.dart';
import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/database/dao.dart';
import 'package:cheki_keja/database/databasehelper.dart';
import 'package:cheki_keja/models/apartment.dart';
import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final repo = NetworkApi();
  var dao = DatabaseDao(databasehelper);
  final id;
  final userid;
  PostBloc({required this.id, required this.userid}) : super(PostInitial());

  @override
  Stream<Transition<PostEvent, PostState>> transformEvents(
    Stream<PostEvent> events,
    TransitionFunction<PostEvent, PostState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    final PostState currentState = state;
    if (event is PostFetched && !_hasReachedMax(currentState)) {
      try {
        if (currentState is PostInitial) {
          final posts = await repo.getApartments(id, userid);
          await insertPosts(posts!);
          yield PostSuccess(posts: posts, hasReachedMax: false);
          return;
        }
        if (currentState is PostSuccess) {
          final posts =
              await repo.getApartments(currentState.posts!.last.id, userid);
          if (posts!.isNotEmpty) {
            yield PostSuccess(
              posts: currentState.posts! + posts,
              hasReachedMax: false,
            );
            await insertPosts(posts);
          } else {
            yield currentState.copyWith(hasReachedMax: true);
          }
        }
      } catch (_) {
        yield PostFailure();
      }
    }
  }

  bool _hasReachedMax(PostState state) =>
      state is PostSuccess && state.hasReachedMax!;

  Future<void> insertPosts(List<MyApartment> myApartments) async {
    dao.deleteAllPosts();
    final _items = <MyApartmentTableCompanion>[];
    final _units = <BuildingUnitTableCompanion>[];
    myApartments.forEach((myApartment) {
      var companion = MyApartmentTableCompanion(
        onlineid: Value(myApartment.id!.toString()),
        banner: Value(myApartment.banner ?? ''),
        bannertag: Value(myApartment.bannertag ?? ''),
        ownerid: Value(myApartment.ownerid!.toString()),
        ownername: Value(myApartment.ownername!),
        ownerlogo: Value(myApartment.ownerlogo!),
        description: Value(myApartment.description),
        title: Value(myApartment.title!),
        emailaddress: Value(myApartment.email),
        location: Value(myApartment.location),
        address: Value(myApartment.address),
        phone: Value(myApartment.phone),
        video: Value(myApartment.video),
        space: Value(myApartment.space ?? ''),
        latitude: Value(myApartment.latitude!.toString()),
        longitude: Value(myApartment.longitude!.toString()),
        rating: Value(myApartment.rating ?? ''),
        likes: Value(myApartment.likes!.toString()),
        comments: Value(myApartment.comments!.toString()),
        vacant: Value(myApartment.vacant),
        liked: Value(myApartment.liked ?? ''),
      );
      myApartment.units!.forEach((unit) {
        _units.add(BuildingUnitTableCompanion(
          buildingid: Value(myApartment.id!.toString()),
          category: Value(unit.category!),
          deposit: Value(unit.deposit!),
          rent: Value(unit.rent!),
        ));
      });
      _items.add(companion);
    });
    dao.insertPosts(_items);
    dao.insertUnits(_units);
  }
}