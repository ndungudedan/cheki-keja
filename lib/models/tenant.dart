import 'package:json_annotation/json_annotation.dart';
part 'tenant.g.dart';

@JsonSerializable()
class FixedBill {
  int? id;
  String? name;
  String? amount;
  String? deposit;
  String? payment_frequency;
  String? unit;

  FixedBill({
    this.id,
    this.amount,
    this.deposit,
    this.name,
    this.payment_frequency,
    this.unit,
  });

  factory FixedBill.fromJson(Map<String, dynamic> json) =>
      _$FixedBillFromJson(json);

  Map<String, 
  dynamic> toJson() => _$FixedBillToJson(this);
}

@JsonSerializable()
class VariableBill {
  int? id;
  String? bill_name;
  String? amount_per_unit;
  String? number_of_units;
  String? payment_status;
  String? read_on;

  VariableBill({
    this.id,
    this.bill_name,
    this.number_of_units,
    this.amount_per_unit,
    this.payment_status,
    this.read_on,
  });

  factory VariableBill.fromJson(Map<String, dynamic> json) =>
      _$VariableBillFromJson(json);

  Map<String, dynamic> toJson() => _$VariableBillToJson(this);
}

@JsonSerializable()
class TenantUnit {
  int? houseid;
  String? unit_price;
  String? label;
  String? building_name;
  String? unit_deposit;
  String? entry_date;
  String? unit_type_name;

  TenantUnit({
    this.houseid,
    this.building_name,
    this.unit_deposit,
    this.unit_price,
    this.entry_date,
    this.unit_type_name,
    this.label,
  });

  factory TenantUnit.fromJson(Map<String, dynamic> json) =>
      _$TenantUnitFromJson(json);

  Map<String, dynamic> toJson() => _$TenantUnitToJson(this);
}

@JsonSerializable()
class Payment {
  int? id;
  String? first_name;
  String? last_name;
  String? phone_number;
  String? id_number;
  String? payment_reason;
  String? payment_method;
  int? amount;
  String? payment_description;
  String? transaction_date;

  Payment({
    this.id,
    this.amount,
    this.first_name,
    this.id_number,
    this.last_name,
    this.payment_description='',
    this.payment_method,
    this.payment_reason,
    this.phone_number,
    this.transaction_date,
  });

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}

@JsonSerializable()
class MyTenantResponse {
  List<Payment>? payments;
  List<TenantUnit>? houseunits;
  List<VariableBill>? variablebills;
  List<FixedBill>? fixedbills;

  MyTenantResponse({
    this.payments,
    this.fixedbills,
    this.houseunits,
    this.variablebills,
  });

  factory MyTenantResponse.fromJson(Map<String, dynamic> json) =>
      _$MyTenantResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MyTenantResponseToJson(this);
}