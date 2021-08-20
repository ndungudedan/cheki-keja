import 'package:json_annotation/json_annotation.dart';
part 'billers.g.dart';

@JsonSerializable()
class BillerList {
  List<Biller>? data;
  BillerList({this.data});

  factory BillerList.fromJson(List<dynamic> json) {
    return BillerList(
        data: json
            .map((e) => Biller.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}

@JsonSerializable()
class Biller {
  String? biller_name;
  int? id;
  String? biller_category;
  String? minimum_balance;
  String? secondary_account;
  String? biller_code;
  bool? enabled;

  Biller({
    this.biller_category,
    this.biller_name,
    this.id,
    this.biller_code,
    this.enabled,
    this.minimum_balance,
    this.secondary_account,
  });

  factory Biller.fromJson(Map<String, dynamic> json) => _$BillerFromJson(json);

  Map<String, dynamic> toJson() => _$BillerToJson(this);
}

@JsonSerializable()
class ValidateAccountResponse {
  String? code;
  int? id;
  String? account;
  String? name;
  String? balance;
  String? message;
  bool? enabled;

  ValidateAccountResponse({
    this.account,
    this.code,
    this.id,
    this.message,
    this.enabled,
    this.balance,
    this.name,
  });

  factory ValidateAccountResponse.fromJson(Map<String, dynamic> json) => _$ValidateAccountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ValidateAccountResponseToJson(this);
}
