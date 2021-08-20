// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Point _$PointFromJson(Map<String, dynamic> json) {
  return Point(
    location: json['location'] as String?,
    building_id: json['building_id'] as int?,
    latitude: (json['latitude'] as num?)?.toDouble(),
    longitude: (json['longitude'] as num?)?.toDouble(),
    building_name: json['building_name'] as String?,
    phone_number: json['phone_number'] as String?,
  );
}

Map<String, dynamic> _$PointToJson(Point instance) => <String, dynamic>{
      'location': instance.location,
      'building_id': instance.building_id,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'building_name': instance.building_name,
      'phone_number': instance.phone_number,
    };

Locations _$LocationsFromJson(Map<String, dynamic> json) {
  return Locations(
    houses: (json['houses'] as List<dynamic>?)
        ?.map((e) => Point.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$LocationsToJson(Locations instance) => <String, dynamic>{
      'houses': instance.houses,
    };
