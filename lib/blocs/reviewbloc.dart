import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/models/company.dart';
import 'package:cheki_keja/models/reviewClass.dart';
import 'package:rxdart/rxdart.dart';

class ReviewBloc {
  final repo = NetworkApi();
  ReviewBloc();
  final _fetcher = BehaviorSubject<List<Review>>();
  Stream<List<Review>> get reviews => _fetcher.stream;

  fetchReviews(var apartmentId,var paginationId) async {
    var res = await repo.getReviews(apartmentId,paginationId);
    _fetcher.sink.add(res);
  }

  dispose() {
    _fetcher.close();
  }
}

//final review_bloc = ReviewBloc();
