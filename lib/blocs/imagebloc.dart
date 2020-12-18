import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/models/apartment.dart';
import 'package:cheki_keja/models/features.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ImagesBloc {
  final repo = NetworkApi();
  ImagesBloc();
  final _fetcher = BehaviorSubject<List<Images>>();
  Stream<List<Images>> get allImages => _fetcher.stream;

  fetchImages(var apartmentId) async {
    var res = await repo.getImages(apartmentId);
    _fetcher.sink.add(res);
  }

  dispose() {
    _fetcher.close();
  }
}

//final images_bloc = ImagesBloc();
