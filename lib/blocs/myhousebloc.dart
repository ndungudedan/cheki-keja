import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/database/dao.dart';
import 'package:cheki_keja/database/databasehelper.dart';
import 'package:cheki_keja/models/paymentsClass.dart';
import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';

class MyhouseBloc {
  final repo = NetworkApi();
  var dao = DatabaseDao(databasehelper);
  MyhouseBloc();
  final fetcher = BehaviorSubject<Myhouse>();
  Stream<Myhouse> get result => fetcher.stream;

  fetchMyhouse(var userId) async {
    var res = await repo.getMyhouse(userId);
    fetcher.sink.add(res);
    await insertMyHouse(res);
  }

  dispose() {
    fetcher.close();
  }

  Future<void> insertMyHouse(Myhouse myhouse) async {
    dao.deleteMyHouse();
    final arrears = <MyHouseArrearsCompanion>[];
    final payments = <MyHousePaymentsCompanion>[];
    await myhouse.arrearsList.arrears.forEach((value) {
      var companion = MyHouseArrearsCompanion(
        onlineid: Value(value.id),
        amount: Value(value.amount),
        year: Value(value.year),
        month: Value(value.month),
      );
      arrears.add(companion);
    });
    await myhouse.paymentsList.payments.forEach((value) {
      var companion = MyHousePaymentsCompanion(
        onlineid: Value(value.id),
        amount: Value(value.amount),
        year: Value(value.year),
        month: Value(value.month),
        transactionid: Value(value.transactionid),
        status: Value(value.status),
        time: Value(value.time),
        type: Value(value.type),
      );
      payments.add(companion);
    });
    final details = MyHouseDetailsCompanion(
      onlineid: Value(myhouse.details.id),
      ownerid: Value(myhouse.details.ownerid),
      ownername: Value(myhouse.details.ownername),
      ownerlogo: Value(myhouse.details.ownerlogo),
      owneraddress: Value(myhouse.details.owneraddress),
      category: Value(myhouse.details.category),
      title: Value(myhouse.details.title),
      owneremail: Value(myhouse.details.owneremail),
      ownerlocation: Value(myhouse.details.ownerlocation),
      ownerphone: Value(myhouse.details.ownerphone),
      unit: Value(myhouse.details.unit ??= ''),
      deposit: Value(myhouse.details.deposit),
      price: Value(myhouse.details.price),
      payed: Value(myhouse.details.payed),
      rating: Value(myhouse.details.rating),
    );
    dao.insertMyHouse(details, arrears, payments);
  }
}
