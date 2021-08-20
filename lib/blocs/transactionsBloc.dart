import 'dart:convert';
import 'package:cheki_keja/connection/networkApi.dart';
import 'package:cheki_keja/database/dao.dart';
import 'package:cheki_keja/database/databasehelper.dart';
import 'package:cheki_keja/models/ipay_transactions.dart';
import 'package:moor/moor.dart';

class TransactionsBloc {
  final repo = NetworkApi();
  var dao = DatabaseDao(databasehelper);
  TransactionsBloc();

  fetchTransactions() async {
    var res = await repo.fetchTransactions();
    var map = json.decode(res);
    print(map);
    if (TransactionList.fromJson(map).data!.isNotEmpty) {
      await insertTransactions(TransactionList.fromJson(map).data!);
    }
  }

  Future<void> insertTransactions(List<Transaction> result) async {
    final _items = <TransactionsTableCompanion>[];
    result.forEach((value) {
      var companion = TransactionsTableCompanion(
        onlineid: Value(value.id!.toString()),
        amount: Value(value.amount!),
        biller_code: Value(value.biller_code!),
        token: Value(value.token ?? ''),
        units: Value(value.units ?? ''),
        account: Value(value.account!),
        transaction_id: Value(value.transaction_id ?? ''),
        status: Value(value.status ?? ''),
        date: Value(value.date!),
        time: Value(value.time!),
      );
      _items.add(companion);
    });
    dao.insertTransactions(_items);
  }
}
