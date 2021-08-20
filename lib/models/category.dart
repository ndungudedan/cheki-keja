import 'package:cheki_keja/models/apartment.dart';
import 'package:cheki_keja/models/status.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category.g.dart';

@JsonSerializable()
class CategoryResponse {
  MyCategoryList? data;
  Status? status;

  CategoryResponse({
    this.status,
    this.data,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}
@JsonSerializable()
class MyCategoryList {
  List<MyCategory>? categorys;

  MyCategoryList({
    this.categorys,
  });

  factory MyCategoryList.fromJson(List<dynamic> json) {
    return MyCategoryList(
        categorys: json
            .map((e) => MyCategory.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}

@JsonSerializable()
class MyCategory {
  String? id;
  String? title;
  MyCategory({
    this.id,
    this.title,
  });

  factory MyCategory.fromJson(Map<String, dynamic> json) =>
      _$MyCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$MyCategoryToJson(this);
}

@JsonSerializable()
class SectionCatList {
  List<MyApartment>? data;

  SectionCatList({
    this.data,
  });

  factory SectionCatList.fromJson(List<dynamic> json) {
    return SectionCatList(
        data: json
            .map((e) => MyApartment.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}

@JsonSerializable()
class SectionCatResponse {
  SectionCatList? singles;
  SectionCatList? doubles;
  SectionCatList? bedsitters;
  SectionCatList? onebeds;
  SectionCatList? twobeds;
  SectionCatList? threebeds;
  Status? status;

  SectionCatResponse({
    this.doubles,
    this.singles,
    this.bedsitters,
    this.onebeds,
    this.twobeds,
    this.threebeds,
    this.status,
  });

  factory SectionCatResponse.fromJson(Map<String, dynamic> json) =>
      _$SectionCatResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SectionCatResponseToJson(this);
}
