import 'dart:async';
import 'package:cheki_keja/blocs/favorites/favoriteevent.dart';
import 'package:cheki_keja/blocs/favorites/favoritestate.dart';
import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/models/apartment.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final repo = NetworkApi();
  final id;
  final userid;
  FavoriteBloc({required this.id, required this.userid})
      : super(FavoriteInitial());

  @override
  Stream<Transition<FavoriteEvent, FavoriteState>> transformEvents(
    Stream<FavoriteEvent> events,
    TransitionFunction<FavoriteEvent, FavoriteState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<FavoriteState> mapEventToState(FavoriteEvent event) async* {
    final FavoriteState currentState = state;
    if (event is FavoriteFetched && !_hasReachedMax(currentState)) {
      try {
        if (currentState is FavoriteInitial) {
          final posts = await repo.getFavorites(id, userid);
          print(posts);
          yield FavoriteSuccess(posts: posts, hasReachedMax: false);
          return;
        }
        if (currentState is FavoriteSuccess) {
          final posts =
              await (repo.getFavorites(currentState.posts!.last.id, userid) as FutureOr<List<MyApartment>>);
          yield posts.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : FavoriteSuccess(
                  posts: currentState.posts! + posts,
                  hasReachedMax: false,
                );
        }
      } catch (_) {
        yield FavoriteFailure();
      }
    }
  }

  bool _hasReachedMax(FavoriteState state) =>
      state is FavoriteSuccess && state.hasReachedMax!;
}
