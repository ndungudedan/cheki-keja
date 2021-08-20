import 'package:cheki_keja/models/status.dart';
import 'package:json_annotation/json_annotation.dart';
part 'apartment.g.dart';

@JsonSerializable()
class Banner {
  String? banner;
  String? tag;

  Banner({
    this.banner,
    this.tag,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);

  Map<String, dynamic> toJson() => _$BannerToJson(this);
}

@JsonSerializable()
class MyApartment {
  int? id;
  int? ownerid;
  String? ownername;
  String? ownerlogo;
  String? description;
  String? location;
  String? email;
  String? title;
  String? address;
  String? space;
  String? phone;
  double? latitude;
  double? longitude;
  int? likes;
  int? comments;
  String? banner;
  String? bannertag;
  String? video;
  String? rating;
  String? liked;
  bool vacant;
  List<BuildingUnit>? units;

  MyApartment({
    this.id,
    this.vacant=false,
    this.ownerid,
    this.ownername,
    this.ownerlogo,
    this.email = '',
    this.address = '',
    this.title,
    this.phone = '',
    this.description,
    this.space,
    this.latitude,
    this.longitude,
    this.likes,
    this.comments,
    this.video = '',
    this.rating,
    this.liked,
    this.location = '',
    this.units,
    this.banner,
    this.bannertag,
  });

  factory MyApartment.fromJson(Map<String, dynamic> json) =>
      _$MyApartmentFromJson(json);

  Map<String, dynamic> toJson() => _$MyApartmentToJson(this);
}

@JsonSerializable()
class ApartmentList {
  List<MyApartment>? apartments;

  ApartmentList({this.apartments});

  factory ApartmentList.fromJson(List<dynamic> json) {
    return ApartmentList(
        apartments: json
            .map((e) => MyApartment.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}

@JsonSerializable()
class MyApartmentResponse {
  ApartmentList? data;
  Status? status;

  MyApartmentResponse({
    this.data,
    this.status,
  });

  factory MyApartmentResponse.fromJson(Map<String, dynamic> json) =>
      _$MyApartmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MyApartmentResponseToJson(this);
}

@JsonSerializable()
class Images {
  String? tag;
  String? image;

  Images({
    this.image,
    this.tag,
  });

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}

@JsonSerializable()
class BuildingUnit {
  String? category;
  String? rent;
  String? deposit;

  BuildingUnit({
    this.category,
    this.rent,
    this.deposit,
  });

  factory BuildingUnit.fromJson(Map<String, dynamic> json) => _$BuildingUnitFromJson(json);

  Map<String, dynamic> toJson() => _$BuildingUnitToJson(this);
}

@JsonSerializable()
class ImageList {
  List<Images>? data;
  ImageList({this.data});

  factory ImageList.fromJson(List<dynamic> json) {
    return ImageList(
        data: json
            .map((e) => Images.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}

@JsonSerializable()
class ImagesResponse {
  ImageList? data;
  Status? status;

  ImagesResponse({
    this.status,
    this.data,
  });

  factory ImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$ImagesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesResponseToJson(this);
}
