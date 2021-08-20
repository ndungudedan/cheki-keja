import 'dart:convert';
import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/database/dao.dart';
import 'package:cheki_keja/database/databasehelper.dart';
import 'package:cheki_keja/models/billers.dart';
import 'package:moor/moor.dart';

class BillersBloc {
  final repo = NetworkApi();
  var dao = DatabaseDao(databasehelper);
  BillersBloc();

  fetchBillers() async {
    var res = await repo.fetchBillers();
    var map = json.decode(res);
    print(map);
    if (BillerList.fromJson(map).data!.isNotEmpty) {
      insertBillers(BillerList.fromJson(map).data!);
    }
  }

  Future<void> insertBillers(List<Biller> result) async {
    final _items = <BillerTableCompanion>[];
    result.forEach((value) {
      var companion = BillerTableCompanion(
        onlineid: Value(value.id!.toString()),
        biller_category: Value(value.biller_category!),
        biller_code: Value(value.biller_code!),
        biller_name: Value(value.biller_name!),
        enabled: Value(value.enabled!),
        secondary_account: Value(value.secondary_account!),
        minimum_balance: Value(value.minimum_balance!),
      );
      _items.add(companion);
    });
    dao.insertBillers(_items);
  }
}
