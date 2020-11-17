import 'package:json_annotation/json_annotation.dart';
part 'featureClass.g.dart';

@JsonSerializable()
class Features {
  String id;
  String feat1;
  String feat2;
  String feat3;
  String feat4;
  String feat5;
  String feat6;
  String feat7;
  String feat8;
  String feat9;
  String feat10;

  Features({
    this.id,
    this.feat1,
    this.feat2,
    this.feat3,
    this.feat4,
    this.feat5,
    this.feat6,
    this.feat7,
    this.feat8,
    this.feat9,
    this.feat10,
  });

  factory Features.fromJson(Map<String, dynamic> json) => _$FeaturesFromJson(json);

  Map<String, dynamic> toJson() => _$FeaturesToJson(this);
}
