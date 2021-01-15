// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contacts _$ContactsFromJson(Map<String, dynamic> json) {
  return Contacts(
    id: json['id'] as String,
    facebook: json['facebook'] as String,
    phone: json['phone'] as String,
    email: json['email'] as String,
    instagram: json['instagram'] as String,
    address: json['address'] as String,
    location: json['location'] as String,
    twitter: json['twitter'] as String,
  );
}

Map<String, dynamic> _$ContactsToJson(Contacts instance) => <String, dynamic>{
      'id': instance.id,
      'facebook': instance.facebook,
      'instagram': instance.instagram,
      'twitter': instance.twitter,
      'phone': instance.phone,
      'address': instance.address,
      'location': instance.location,
      'email': instance.email,
    };
