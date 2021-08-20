import 'package:json_annotation/json_annotation.dart';
part 'contact.g.dart';

@JsonSerializable()
class Contacts {
  String? id;
  String? facebook;
  String? instagram;
  String? twitter;
  String? phone;
  String? address;
  String? location;
  String? email;

  Contacts({
    this.id,
    this.facebook,
    this.phone,
    this.email,
    this.instagram,
    this.address,
    this.location,
    this.twitter,
  });

  factory Contacts.fromJson(Map<String, dynamic> json) =>
      _$ContactsFromJson(json);

  Map<String, dynamic> toJson() => _$ContactsToJson(this);
}
