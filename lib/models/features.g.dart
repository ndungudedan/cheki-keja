// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'features.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Features _$FeaturesFromJson(Map<String, dynamic> json) {
  return Features(
    feat: json['feat'] as String?,
  );
}

Map<String, dynamic> _$FeaturesToJson(Features instance) => <String, dynamic>{
      'feat': instance.feat,
    };

FeaturesList _$FeaturesListFromJson(Map<String, dynamic> json) {
  return FeaturesList(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => Features.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$FeaturesListToJson(FeaturesList instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

FeaturesResponse _$FeaturesResponseFromJson(Map<String, dynamic> json) {
  return FeaturesResponse(
    status: json['status'] == null
        ? null
        : Status.fromJson(json['status'] as Map<String, dynamic>),
    data: json['data'] == null
        ? null
        : FeaturesList.fromJson(json['data'] as List<dynamic>),
  );
}

Map<String, dynamic> _$FeaturesResponseToJson(FeaturesResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
    };
