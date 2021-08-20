import 'package:json_annotation/json_annotation.dart';
part 'locations.g.dart';

@JsonSerializable()
class Point {
  Point({
    this.location,
    this.building_id,
    this.latitude,
    this.longitude,
    this.building_name,
    this.phone_number,
  });

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);
  Map<String, dynamic> toJson() => _$PointToJson(this);
  final String? location;
  final int? building_id;
  final double? latitude;
  final double? longitude;
  final String? building_name;
  final String? phone_number;
}

@JsonSerializable()
class Locations {
  Locations({
    this.houses,
  });

  factory Locations.fromJson(Map<String, dynamic> json) =>
      _$LocationsFromJson(json);
  Map<String, dynamic> toJson() => _$LocationsToJson(this);

  final List<Point>? houses;
}
