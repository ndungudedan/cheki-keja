import 'package:cheki_keja/models/apartment.dart';

abstract class FavoriteState {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteFailure extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  final List<MyApartment> posts;
  final bool hasReachedMax;

  const FavoriteSuccess({
    this.posts,
    this.hasReachedMax,
  });

  FavoriteSuccess copyWith({
    List<MyApartment> posts,
    bool hasReachedMax,
  }) {
    return FavoriteSuccess(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [posts, hasReachedMax];

  @override
  String toString() =>
      'PostSuccess { posts: ${posts.length}, hasReachedMax: $hasReachedMax }';
}
