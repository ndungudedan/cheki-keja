// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apartment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banner _$BannerFromJson(Map<String, dynamic> json) {
  return Banner(
    banner: json['banner'] as String?,
    tag: json['tag'] as String?,
  );
}

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
      'banner': instance.banner,
      'tag': instance.tag,
    };

MyApartment _$MyApartmentFromJson(Map<String, dynamic> json) {
  return MyApartment(
    id: json['id'] as int?,
    vacant: json['vacant'] as bool,
    ownerid: json['ownerid'] as int?,
    ownername: json['ownername'] as String?,
    ownerlogo: json['ownerlogo'] as String?,
    email: json['email'] as String?,
    address: json['address'] as String?,
    title: json['title'] as String?,
    phone: json['phone'] as String?,
    description: json['description'] as String?,
    space: json['space'] as String?,
    latitude: (json['latitude'] as num?)?.toDouble(),
    longitude: (json['longitude'] as num?)?.toDouble(),
    likes: json['likes'] as int?,
    comments: json['comments'] as int?,
    video: json['video'] as String?,
    rating: json['rating'] as String?,
    liked: json['liked'] as String?,
    location: json['location'] as String?,
    units: (json['units'] as List<dynamic>?)
        ?.map((e) => BuildingUnit.fromJson(e as Map<String, dynamic>))
        .toList(),
    banner: json['banner'] as String?,
    bannertag: json['bannertag'] as String?,
  );
}

Map<String, dynamic> _$MyApartmentToJson(MyApartment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerid': instance.ownerid,
      'ownername': instance.ownername,
      'ownerlogo': instance.ownerlogo,
      'description': instance.description,
      'location': instance.location,
      'email': instance.email,
      'title': instance.title,
      'address': instance.address,
      'space': instance.space,
      'phone': instance.phone,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'likes': instance.likes,
      'comments': instance.comments,
      'banner': instance.banner,
      'bannertag': instance.bannertag,
      'video': instance.video,
      'rating': instance.rating,
      'liked': instance.liked,
      'vacant': instance.vacant,
      'units': instance.units,
    };

ApartmentList _$ApartmentListFromJson(Map<String, dynamic> json) {
  return ApartmentList(
    apartments: (json['apartments'] as List<dynamic>?)
        ?.map((e) => MyApartment.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ApartmentListToJson(ApartmentList instance) =>
    <String, dynamic>{
      'apartments': instance.apartments,
    };

MyApartmentResponse _$MyApartmentResponseFromJson(Map<String, dynamic> json) {
  return MyApartmentResponse(
    data: json['data'] == null
        ? null
        : ApartmentList.fromJson(json['data'] as List<dynamic>),
    status: json['status'] == null
        ? null
        : Status.fromJson(json['status'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MyApartmentResponseToJson(
        MyApartmentResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) {
  return Images(
    image: json['image'] as String?,
    tag: json['tag'] as String?,
  );
}

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'tag': instance.tag,
      'image': instance.image,
    };

BuildingUnit _$BuildingUnitFromJson(Map<String, dynamic> json) {
  return BuildingUnit(
    category: json['category'] as String?,
    rent: json['rent'] as String?,
    deposit: json['deposit'] as String?,
  );
}

Map<String, dynamic> _$BuildingUnitToJson(BuildingUnit instance) =>
    <String, dynamic>{
      'category': instance.category,
      'rent': instance.rent,
      'deposit': instance.deposit,
    };

ImageList _$ImageListFromJson(Map<String, dynamic> json) {
  return ImageList(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ImageListToJson(ImageList instance) => <String, dynamic>{
      'data': instance.data,
    };

ImagesResponse _$ImagesResponseFromJson(Map<String, dynamic> json) {
  return ImagesResponse(
    status: json['status'] == null
        ? null
        : Status.fromJson(json['status'] as Map<String, dynamic>),
    data: json['data'] == null
        ? null
        : ImageList.fromJson(json['data'] as List<dynamic>),
  );
}

Map<String, dynamic> _$ImagesResponseToJson(ImagesResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
    };
