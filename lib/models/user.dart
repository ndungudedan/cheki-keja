import 'package:cheki_keja/models/status.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class UserResponse {
  User? data;
  Status? status;

  UserResponse({
    this.status,
    this.data,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class User {
  int? id;
  String? first_name;
  String? last_name;
  String? id_number;
  String? phone_number;
  String? citizenship;
  String? email;

  User({
    this.id,
    this.citizenship,
    this.first_name,
    this.id_number,
    this.email,
    this.last_name,
    this.phone_number,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
