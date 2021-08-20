import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/models/company.dart';
import 'package:rxdart/rxdart.dart';

class CompanyBloc {
  final repo = NetworkApi();
  CompanyBloc();
  final _fetcher = BehaviorSubject<MyCompany?>();
  Stream<MyCompany?> get company => _fetcher.stream;

  fetchCompany(var ownerId) async {
    var res = await repo.getCompany(ownerId);
    _fetcher.sink.add(res);
  }

  dispose() {
    _fetcher.close();
  }
}

//final company_bloc = CompanyBloc();
