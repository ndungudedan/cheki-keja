import 'package:cheki_keja/models/status.dart';
import 'package:json_annotation/json_annotation.dart';
part 'features.g.dart';

@JsonSerializable()
class Features {
  String feat;

  Features({
    this.feat,
  });

  factory Features.fromJson(Map<String, dynamic> json) =>
      _$FeaturesFromJson(json);

  Map<String, dynamic> toJson() => _$FeaturesToJson(this);

  static final columns = [
    "apartment_id",
    "feat"
  ];

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "feat": feat,
    };

    return map;
  }

  static fromMap(Map map) {
    Features features = Features();
    features.feat = map["feat"];

    return features;
  }
}
@JsonSerializable()
class FeaturesList {
  List<Features> data;
  FeaturesList({this.data});

  factory FeaturesList.fromJson(List<dynamic> json) {
    return FeaturesList(
        data: json
            .map((e) => Features.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}
@JsonSerializable()
class FeaturesResponse {
  FeaturesList data;
  Status status;

  FeaturesResponse({
    this.status,
    this.data,
  });

  factory FeaturesResponse.fromJson(Map<String, dynamic> json) =>
      _$FeaturesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FeaturesResponseToJson(this);
}