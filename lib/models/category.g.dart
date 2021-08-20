// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) {
  return CategoryResponse(
    status: json['status'] == null
        ? null
        : Status.fromJson(json['status'] as Map<String, dynamic>),
    data: json['data'] == null
        ? null
        : MyCategoryList.fromJson(json['data'] as List<dynamic>),
  );
}

Map<String, dynamic> _$CategoryResponseToJson(CategoryResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
    };

MyCategoryList _$MyCategoryListFromJson(Map<String, dynamic> json) {
  return MyCategoryList(
    categorys: (json['categorys'] as List<dynamic>?)
        ?.map((e) => MyCategory.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MyCategoryListToJson(MyCategoryList instance) =>
    <String, dynamic>{
      'categorys': instance.categorys,
    };

MyCategory _$MyCategoryFromJson(Map<String, dynamic> json) {
  return MyCategory(
    id: json['id'] as String?,
    title: json['title'] as String?,
  );
}

Map<String, dynamic> _$MyCategoryToJson(MyCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

SectionCatList _$SectionCatListFromJson(Map<String, dynamic> json) {
  return SectionCatList(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => MyApartment.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SectionCatListToJson(SectionCatList instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

SectionCatResponse _$SectionCatResponseFromJson(Map<String, dynamic> json) {
  return SectionCatResponse(
    doubles: json['doubles'] == null
        ? null
        : SectionCatList.fromJson(json['doubles'] as List<dynamic>),
    singles: json['singles'] == null
        ? null
        : SectionCatList.fromJson(json['singles'] as List<dynamic>),
    bedsitters: json['bedsitters'] == null
        ? null
        : SectionCatList.fromJson(json['bedsitters'] as List<dynamic>),
    onebeds: json['onebeds'] == null
        ? null
        : SectionCatList.fromJson(json['onebeds'] as List<dynamic>),
    twobeds: json['twobeds'] == null
        ? null
        : SectionCatList.fromJson(json['twobeds'] as List<dynamic>),
    threebeds: json['threebeds'] == null
        ? null
        : SectionCatList.fromJson(json['threebeds'] as List<dynamic>),
    status: json['status'] == null
        ? null
        : Status.fromJson(json['status'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SectionCatResponseToJson(SectionCatResponse instance) =>
    <String, dynamic>{
      'singles': instance.singles,
      'doubles': instance.doubles,
      'bedsitters': instance.bedsitters,
      'onebeds': instance.onebeds,
      'twobeds': instance.twobeds,
      'threebeds': instance.threebeds,
      'status': instance.status,
    };
