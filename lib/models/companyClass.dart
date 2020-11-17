import 'package:json_annotation/json_annotation.dart';
part 'companyClass.g.dart';

@JsonSerializable()
class Company {
  String id;
  String admin_id;
  String logo;
  String phone;
  String address;
  String location;
  String email;

  Company({
    this.id,
    this.admin_id,
    this.logo,
    this.phone,
    this.address,
    this.location,
    this.email,
  });

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
