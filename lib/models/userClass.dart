import 'package:json_annotation/json_annotation.dart';
part 'userClass.g.dart';

@JsonSerializable()
class User {
  String id;
  String name;
  String email;
  String photo;

  User({
    this.id,
    this.name,
    this.email,
    this.photo
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
