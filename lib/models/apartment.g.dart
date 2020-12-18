// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apartment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banner _$BannerFromJson(Map<String, dynamic> json) {
  return Banner(
    banner: json['banner'] as String,
    tag: json['tag'] as String,
  );
}

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
      'banner': instance.banner,
      'tag': instance.tag,
    };

MyApartment _$MyApartmentFromJson(Map<String, dynamic> json) {
  return MyApartment(
    id: json['id'] as String,
    owner_id: json['owner_id'] as String,
    owner_name: json['owner_name'] as String,
    owner_logo: json['owner_logo'] as String,
    category: json['category'] as String,
    email: json['email'] as String,
    address: json['address'] as String,
    title: json['title'] as String,
    phone: json['phone'] as String,
    price: json['price'] as String,
    deposit: json['deposit'] as String,
    description: json['description'] as String,
    space: json['space'] as String,
    latitude: json['latitude'] as String,
    longitude: json['longitude'] as String,
    likes: json['likes'] as String,
    comments: json['comments'] as String,
    video: json['video'] as String,
    rating: json['rating'] as String,
    liked: json['liked'] as String,
    location: json['location'] as String,
    banner: (json['banner'] as List)
        ?.map((e) =>
            e == null ? null : Banner.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MyApartmentToJson(MyApartment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.owner_id,
      'owner_name': instance.owner_name,
      'owner_logo': instance.owner_logo,
      'description': instance.description,
      'category': instance.category,
      'location': instance.location,
      'email': instance.email,
      'title': instance.title,
      'price': instance.price,
      'address': instance.address,
      'deposit': instance.deposit,
      'space': instance.space,
      'phone': instance.phone,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'likes': instance.likes,
      'comments': instance.comments,
      'banner': instance.banner,
      'video': instance.video,
      'rating': instance.rating,
      'liked': instance.liked,
    };

ApartmentList _$ApartmentListFromJson(Map<String, dynamic> json) {
  return ApartmentList(
    apartments: (json['apartments'] as List)
        ?.map((e) =>
            e == null ? null : MyApartment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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
        : ApartmentList.fromJson(json['data'] as List),
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
    image: json['image'] as String,
    tag: json['tag'] as String,
  );
}

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'tag': instance.tag,
      'image': instance.image,
    };

ImageList _$ImageListFromJson(Map<String, dynamic> json) {
  return ImageList(
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Images.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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
    data:
        json['data'] == null ? null : ImageList.fromJson(json['data'] as List),
  );
}

Map<String, dynamic> _$ImagesResponseToJson(ImagesResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
    };
