// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apartClass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Apartment _$ApartmentFromJson(Map<String, dynamic> json) {
  return Apartment(
    id: json['id'] as String,
    owner_id: json['owner_id'] as String,
    owner_name: json['owner_name'] as String,
    owner_logo: json['owner_logo'] as String,
    category: json['category'] as String,
    title: json['title'] as String,
    price: json['price'] as String,
    deposit: json['deposit'] as String,
    space: json['space'] as String,
    latitude: json['latitude'] as String,
    longitude: json['longitude'] as String,
    likes: json['likes'] as String,
    comments: json['comments'] as String,
    video: json['video'] as String,
    rating: json['rating'] as String,
    liked: json['liked'] as String,
    image0: json['image0'] as String,
    image1: json['image1'] as String,
    image2: json['image2'] as String,
    tag0: json['tag0'] as String,
    tag1: json['tag1'] as String,
    tag2: json['tag2'] as String,
  );
}

Map<String, dynamic> _$ApartmentToJson(Apartment instance) => <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.owner_id,
      'owner_name': instance.owner_name,
      'owner_logo': instance.owner_logo,
      'category': instance.category,
      'title': instance.title,
      'price': instance.price,
      'deposit': instance.deposit,
      'space': instance.space,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'likes': instance.likes,
      'comments': instance.comments,
      'image0': instance.image0,
      'image1': instance.image1,
      'image2': instance.image2,
      'tag0': instance.tag0,
      'tag1': instance.tag1,
      'tag2': instance.tag2,
      'video': instance.video,
      'rating': instance.rating,
      'liked': instance.liked,
    };

ApartmentList _$ApartmentListFromJson(Map<String, dynamic> json) {
  return ApartmentList(
    apartments: (json['apartments'] as List)
        ?.map((e) =>
            e == null ? null : Apartment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ApartmentListToJson(ApartmentList instance) =>
    <String, dynamic>{
      'apartments': instance.apartments,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) {
  return Images(
    image0: json['image0'] as String,
    image1: json['image1'] as String,
    image2: json['image2'] as String,
    image3: json['image3'] as String,
    image4: json['image4'] as String,
    image5: json['image5'] as String,
    image6: json['image6'] as String,
    image7: json['image7'] as String,
    image8: json['image8'] as String,
    image9: json['image9'] as String,
    image10: json['image10'] as String,
    image11: json['image11'] as String,
    image12: json['image12'] as String,
    image13: json['image13'] as String,
    image14: json['image14'] as String,
    image15: json['image15'] as String,
    tag0: json['tag0'] as String,
    tag1: json['tag1'] as String,
    tag2: json['tag2'] as String,
    tag3: json['tag3'] as String,
    tag4: json['tag4'] as String,
    tag5: json['tag5'] as String,
    tag6: json['tag6'] as String,
    tag7: json['tag7'] as String,
    tag8: json['tag8'] as String,
    tag9: json['tag9'] as String,
    tag10: json['tag10'] as String,
    tag11: json['tag11'] as String,
    tag12: json['tag12'] as String,
    tag13: json['tag13'] as String,
    tag14: json['tag14'] as String,
    tag15: json['tag15'] as String,
  );
}

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'image0': instance.image0,
      'image1': instance.image1,
      'image2': instance.image2,
      'image3': instance.image3,
      'image4': instance.image4,
      'image5': instance.image5,
      'image6': instance.image6,
      'image7': instance.image7,
      'image8': instance.image8,
      'image9': instance.image9,
      'image10': instance.image10,
      'image11': instance.image11,
      'image12': instance.image12,
      'image13': instance.image13,
      'image14': instance.image14,
      'image15': instance.image15,
      'tag0': instance.tag0,
      'tag1': instance.tag1,
      'tag2': instance.tag2,
      'tag3': instance.tag3,
      'tag4': instance.tag4,
      'tag5': instance.tag5,
      'tag6': instance.tag6,
      'tag7': instance.tag7,
      'tag8': instance.tag8,
      'tag9': instance.tag9,
      'tag10': instance.tag10,
      'tag11': instance.tag11,
      'tag12': instance.tag12,
      'tag13': instance.tag13,
      'tag14': instance.tag14,
      'tag15': instance.tag15,
    };

ImageList _$ImageListFromJson(Map<String, dynamic> json) {
  return ImageList(
    images: (json['images'] as List)
        ?.map((e) =>
            e == null ? null : Images.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ImageListToJson(ImageList instance) => <String, dynamic>{
      'images': instance.images,
    };
