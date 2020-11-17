// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companyClass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return Company(
    id: json['id'] as String,
    admin_id: json['admin_id'] as String,
    logo: json['logo'] as String,
    phone: json['phone'] as String,
    address: json['address'] as String,
    location: json['location'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'id': instance.id,
      'admin_id': instance.admin_id,
      'logo': instance.logo,
      'phone': instance.phone,
      'address': instance.address,
      'location': instance.location,
      'email': instance.email,
    };
