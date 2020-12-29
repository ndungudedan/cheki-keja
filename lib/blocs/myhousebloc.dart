import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/models/features.dart';
import 'package:cheki_keja/models/paymentsClass.dart';
import 'package:rxdart/rxdart.dart';

class MyhouseBloc {
  final repo = NetworkApi();
  MyhouseBloc();
  final fetcher = BehaviorSubject<Myhouse>();
  Stream<Myhouse> get result => fetcher.stream;

  fetchMyhouse(var userId) async {
    var res = await repo.getMyhouse(userId);
    fetcher.sink.add(res);
  }

  dispose() {
    fetcher.close();
  }
}

//final feature_bloc = FeatureBloc();
