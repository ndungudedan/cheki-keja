import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/models/apartment.dart';
import 'package:rxdart/rxdart.dart';

class BedSitterCatBloc {
  final repo = NetworkApi();
  BedSitterCatBloc();
  final _fetcher = BehaviorSubject<List<MyApartment>>();
  Stream<List<MyApartment>> get result => _fetcher.stream;

  fetchData(var categoryId) async {
    var res = await repo.getSectionCategorys(categoryId);
    _fetcher.sink.add(res);
  }

  dispose() {
    _fetcher.close();
  }
}

//final company_bloc = CompanyBloc();
