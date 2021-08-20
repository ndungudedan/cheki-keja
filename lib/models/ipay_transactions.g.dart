// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ipay_transactions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionList _$TransactionListFromJson(Map<String, dynamic> json) {
  return TransactionList(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TransactionListToJson(TransactionList instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return Transaction(
    account: json['account'] as String?,
    amount: json['amount'] as String?,
    id: json['id'] as int?,
    date: json['date'] as String?,
    time: json['time'] as String?,
    units: json['units'] as String?,
    transaction_id: json['transaction_id'] as String?,
    token: json['token'] as String?,
    biller_code: json['biller_code'] as String?,
    status: json['status'] as String?,
  );
}

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'id': instance.id,
      'status': instance.status,
      'token': instance.token,
      'units': instance.units,
      'account': instance.account,
      'transaction_id': instance.transaction_id,
      'biller_code': instance.biller_code,
      'date': instance.date,
      'time': instance.time,
    };
