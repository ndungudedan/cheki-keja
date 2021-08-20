// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FixedBill _$FixedBillFromJson(Map<String, dynamic> json) {
  return FixedBill(
    id: json['id'] as int?,
    amount: json['amount'] as String?,
    deposit: json['deposit'] as String?,
    name: json['name'] as String?,
    payment_frequency: json['payment_frequency'] as String?,
    unit: json['unit'] as String?,
  );
}

Map<String, dynamic> _$FixedBillToJson(FixedBill instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amount': instance.amount,
      'deposit': instance.deposit,
      'payment_frequency': instance.payment_frequency,
      'unit': instance.unit,
    };

VariableBill _$VariableBillFromJson(Map<String, dynamic> json) {
  return VariableBill(
    id: json['id'] as int?,
    bill_name: json['bill_name'] as String?,
    number_of_units: json['number_of_units'] as String?,
    amount_per_unit: json['amount_per_unit'] as String?,
    payment_status: json['payment_status'] as String?,
    read_on: json['read_on'] as String?,
  );
}

Map<String, dynamic> _$VariableBillToJson(VariableBill instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bill_name': instance.bill_name,
      'amount_per_unit': instance.amount_per_unit,
      'number_of_units': instance.number_of_units,
      'payment_status': instance.payment_status,
      'read_on': instance.read_on,
    };

TenantUnit _$TenantUnitFromJson(Map<String, dynamic> json) {
  return TenantUnit(
    houseid: json['houseid'] as int?,
    building_name: json['building_name'] as String?,
    unit_deposit: json['unit_deposit'] as String?,
    unit_price: json['unit_price'] as String?,
    entry_date: json['entry_date'] as String?,
    unit_type_name: json['unit_type_name'] as String?,
    label: json['label'] as String?,
  );
}

Map<String, dynamic> _$TenantUnitToJson(TenantUnit instance) =>
    <String, dynamic>{
      'houseid': instance.houseid,
      'unit_price': instance.unit_price,
      'label': instance.label,
      'building_name': instance.building_name,
      'unit_deposit': instance.unit_deposit,
      'entry_date': instance.entry_date,
      'unit_type_name': instance.unit_type_name,
    };

Payment _$PaymentFromJson(Map<String, dynamic> json) {
  return Payment(
    id: json['id'] as int?,
    amount: json['amount'] as int?,
    first_name: json['first_name'] as String?,
    id_number: json['id_number'] as String?,
    last_name: json['last_name'] as String?,
    payment_description: json['payment_description'] as String?,
    payment_method: json['payment_method'] as String?,
    payment_reason: json['payment_reason'] as String?,
    phone_number: json['phone_number'] as String?,
    transaction_date: json['transaction_date'] as String?,
  );
}

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'phone_number': instance.phone_number,
      'id_number': instance.id_number,
      'payment_reason': instance.payment_reason,
      'payment_method': instance.payment_method,
      'amount': instance.amount,
      'payment_description': instance.payment_description,
      'transaction_date': instance.transaction_date,
    };

MyTenantResponse _$MyTenantResponseFromJson(Map<String, dynamic> json) {
  return MyTenantResponse(
    payments: (json['payments'] as List<dynamic>?)
        ?.map((e) => Payment.fromJson(e as Map<String, dynamic>))
        .toList(),
    fixedbills: (json['fixedbills'] as List<dynamic>?)
        ?.map((e) => FixedBill.fromJson(e as Map<String, dynamic>))
        .toList(),
    houseunits: (json['houseunits'] as List<dynamic>?)
        ?.map((e) => TenantUnit.fromJson(e as Map<String, dynamic>))
        .toList(),
    variablebills: (json['variablebills'] as List<dynamic>?)
        ?.map((e) => VariableBill.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MyTenantResponseToJson(MyTenantResponse instance) =>
    <String, dynamic>{
      'payments': instance.payments,
      'houseunits': instance.houseunits,
      'variablebills': instance.variablebills,
      'fixedbills': instance.fixedbills,
    };
