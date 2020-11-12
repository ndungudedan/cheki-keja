import 'package:json_annotation/json_annotation.dart';
part 'apartClass.g.dart';

@JsonSerializable()
class Apartment {
  String id;
  String owner_id;
  String owner_name;
  String owner_logo;
  String category;
  String title;
  String price;
  String deposit;
  String space;
  String latitude;
  String longitude;
  String likes;
  String comments;
  String image0;
  String image1;
  String image2;
  String tag0;
  String tag1;
  String tag2;
  String video;
  String rating;
  String liked;

  Apartment(
      {this.id,
      this.owner_id,
      this.owner_name,
      this.owner_logo,
      this.category,
      this.title,
      this.price,
      this.deposit,
      this.space,
      this.latitude,
      this.longitude,
      this.likes,
      this.comments,
      this.video,
      this.rating,
      this.liked,
      this.image0,
      this.image1,
      this.image2,
      this.tag0,
      this.tag1,
      this.tag2});

  factory Apartment.fromJson(Map<String, dynamic> json) =>
      _$ApartmentFromJson(json);

  Map<String, dynamic> toJson() => _$ApartmentToJson(this);
}

@JsonSerializable()
class ApartmentList {
  List<Apartment> apartments;

  ApartmentList({this.apartments});

  factory ApartmentList.fromJson(List<dynamic> json) {
    return ApartmentList(
        apartments: json
            .map((e) => Apartment.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}

@JsonSerializable()
class Images {
  String image0;
  String image1;
  String image2;
  String image3;
  String image4;
  String image5;
  String image6;
  String image7;
  String image8;
  String image9;
  String image10;
  String image11;
  String image12;
  String image13;
  String image14;
  String image15;
  String tag0;
  String tag1;
  String tag2;
  String tag3;
  String tag4;
  String tag5;
  String tag6;
  String tag7;
  String tag8;
  String tag9;
  String tag10;
  String tag11;
  String tag12;
  String tag13;
  String tag14;
  String tag15;

  Images(
      {this.image0,
      this.image1,
      this.image2,
      this.image3,
      this.image4,
      this.image5,
      this.image6,
      this.image7,
      this.image8,
      this.image9,
      this.image10,
      this.image11,
      this.image12,
      this.image13,
      this.image14,
      this.image15,
      this.tag0,
      this.tag1,
      this.tag2,
      this.tag3,
      this.tag4,
      this.tag5,
      this.tag6,
      this.tag7,
      this.tag8,
      this.tag9,
      this.tag10,
      this.tag11,
      this.tag12,
      this.tag13,
      this.tag14,
      this.tag15});

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}

@JsonSerializable()
class ImageList {
  List<Images> images;

  ImageList({this.images});

  factory ImageList.fromJson(List<dynamic> json) {
    return ImageList(
        images: json
            .map((e) => Images.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}
