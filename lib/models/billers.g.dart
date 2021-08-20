// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillerList _$BillerListFromJson(Map<String, dynamic> json) {
  return BillerList(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => Biller.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BillerListToJson(BillerList instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Biller _$BillerFromJson(Map<String, dynamic> json) {
  return Biller(
    biller_category: json['biller_category'] as String?,
    biller_name: json['biller_name'] as String?,
    id: json['id'] as int?,
    biller_code: json['biller_code'] as String?,
    enabled: json['enabled'] as bool?,
    minimum_balance: json['minimum_balance'] as String?,
    secondary_account: json['secondary_account'] as String?,
  );
}

Map<String, dynamic> _$BillerToJson(Biller instance) => <String, dynamic>{
      'biller_name': instance.biller_name,
      'id': instance.id,
      'biller_category': instance.biller_category,
      'minimum_balance': instance.minimum_balance,
      'secondary_account': instance.secondary_account,
      'biller_code': instance.biller_code,
      'enabled': instance.enabled,
    };

ValidateAccountResponse _$ValidateAccountResponseFromJson(
    Map<String, dynamic> json) {
  return ValidateAccountResponse(
    account: json['account'] as String?,
    code: json['code'] as String?,
    id: json['id'] as int?,
    message: json['message'] as String?,
    enabled: json['enabled'] as bool?,
    balance: json['balance'] as String?,
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$ValidateAccountResponseToJson(
        ValidateAccountResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'id': instance.id,
      'account': instance.account,
      'name': instance.name,
      'balance': instance.balance,
      'message': instance.message,
      'enabled': instance.enabled,
    };
