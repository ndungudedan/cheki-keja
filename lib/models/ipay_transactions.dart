import 'package:json_annotation/json_annotation.dart';
part 'ipay_transactions.g.dart';

@JsonSerializable()
class TransactionList {
  List<Transaction>? data;
  TransactionList({this.data});

  factory TransactionList.fromJson(List<dynamic> json) {
    return TransactionList(
        data: json
            .map((e) => Transaction.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}

@JsonSerializable()
class Transaction {
  String? amount;
  int? id;
  String? status;
  String? token;
  String? units;
  String? account;
  String? transaction_id;
  String? biller_code;
  String? date;
  String? time;

  Transaction({
    this.account,
    this.amount,
    this.id,
    this.date,
    this.time,
    this.units,
    this.transaction_id,
    this.token,
    this.biller_code,
    this.status,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
