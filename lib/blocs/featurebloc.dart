import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/models/features.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class FeatureBloc {
  final repo = NetworkApi();
  FeatureBloc();
  final _featFetcher = BehaviorSubject<List<Features>?>();
  Stream<List<Features>?> get allFeatures => _featFetcher.stream;

  fetchFeatures(var apartmentId) async {
    var res = await repo.getFeatures(apartmentId);
    _featFetcher.sink.add(res);
  }

  dispose() {
    _featFetcher.close();
  }
}

//final feature_bloc = FeatureBloc();
