// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviewClass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return Review(
    id: json['id'] as String,
    review: json['review'] as String,
    rating: json['rating'] as String,
    timeline: json['timeline'] as String,
    user: json['user'] == null
        ? null
        : ReviewUser.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'id': instance.id,
      'review': instance.review,
      'rating': instance.rating,
      'timeline': instance.timeline,
      'user': instance.user,
    };

ReviewList _$ReviewListFromJson(Map<String, dynamic> json) {
  return ReviewList(
    reviews: (json['reviews'] as List)
        ?.map((e) =>
            e == null ? null : Review.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ReviewListToJson(ReviewList instance) =>
    <String, dynamic>{
      'reviews': instance.reviews,
    };

ReviewUser _$ReviewUserFromJson(Map<String, dynamic> json) {
  return ReviewUser(
    id: json['id'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    photo: json['photo'] as String,
  );
}

Map<String, dynamic> _$ReviewUserToJson(ReviewUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'photo': instance.photo,
    };
