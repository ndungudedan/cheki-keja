import 'package:cheki_keja/database/databasehelper.dart';
import 'package:cheki_keja/models/status.dart';
import 'package:json_annotation/json_annotation.dart';
part 'apartment.g.dart';

@JsonSerializable()
class Banner {
  String banner;
  String tag;

  Banner({
    this.banner,
    this.tag,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);

  Map<String, dynamic> toJson() => _$BannerToJson(this);
}

@JsonSerializable()
class MyApartment {
  String id;
  String ownerid;
  String ownername;
  String ownerlogo;
  String description;
  String category;
  String location;
  String email;
  String title;
  String price;
  String address;
  String deposit;
  String space;
  String phone;
  String latitude;
  String longitude;
  String likes;
  String comments;
  String banner;
  String bannertag;
  String video;
  String rating;
  String liked;

  MyApartment({
    this.id,
    this.ownerid,
    this.ownername,
    this.ownerlogo,
    this.category,
    this.email,
    this.address,
    this.title,
    this.phone,
    this.price,
    this.deposit,
    this.description,
    this.space,
    this.latitude,
    this.longitude,
    this.likes,
    this.comments,
    this.video,
    this.rating,
    this.liked,
    this.location,
    this.banner,
    this.bannertag,
  });

  factory MyApartment.fromJson(Map<String, dynamic> json) =>
      _$MyApartmentFromJson(json);

  Map<String, dynamic> toJson() => _$MyApartmentToJson(this);

  static final columns = [
    "id",
    "online_id",
    "owner_id",
    "banner",
    "category",
    "title",
    "description",
    "location",
    "emailaddress",
    "address",
    "phone",
    "video",
    "price",
    "deposit",
    "space",
    "latitude",
    "longitude",
    'likes',
    'comments',
    'rating'
  ];

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "online_id": id,
      "owner_id": ownerid,
      "banner": banner,
      "category": category,
      "title": title,
      "description": description,
      "location": location,
      "emailaddress": email,
      "phone": phone,
      "address": address,
      "video": video,
      "price": price,
      "deposit": deposit,
      "space": space,
      "latitude": latitude,
      "longitude": longitude,
      "likes": likes,
      "comments": comments,
      "rating": rating,
    };

    if (id != null) {
      map["id"] = id;
    }

    return map;
  }

  static fromMap(Map map) {
    MyApartment myApartment = MyApartment();
    //myApartment.id = map["id"].toString();
    myApartment.id = map["online_id"];
    myApartment.ownerid = map["owner_id"];
    myApartment.banner = map["banner"];
    myApartment.category = map["category"];
    myApartment.title = map["title"];
    myApartment.description = map["description"];
    myApartment.location = map["location"];
    myApartment.email = map["emailaddress"];
    myApartment.video = map["video"];
    myApartment.price = map["price"];
    myApartment.phone = map["phone"];
    myApartment.address = map["address"];
    myApartment.deposit = map["deposit"];
    myApartment.space = map["space"];
    myApartment.latitude = map["latitude"];
    myApartment.longitude = map["longitude"];
    myApartment.likes = map["likes"];
    myApartment.comments = map["comments"];
    myApartment.rating = map["rating"];
    return myApartment;
  }
}

@JsonSerializable()
class ApartmentList {
  List<MyApartment> apartments;

  ApartmentList({this.apartments});

  factory ApartmentList.fromJson(List<dynamic> json) {
    return ApartmentList(
        apartments: json
            .map((e) => MyApartment.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}

@JsonSerializable()
class MyApartmentResponse {
  ApartmentList data;
  Status status;

  MyApartmentResponse({
    this.data,
    this.status,
  });

  factory MyApartmentResponse.fromJson(Map<String, dynamic> json) =>
      _$MyApartmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MyApartmentResponseToJson(this);
}

@JsonSerializable()
class Images {
  String tag;
  String image;

  Images({
    this.image,
    this.tag,
  });

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);

  static final columns = ["tag", "image"];

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "online_id": tag,
      "image": image,
    };

    return map;
  }

  static fromMap(Map map) {
    Images images = Images();
    //images.id = map["id"].toString();
    images.tag = map["tag"];
    images.image = map["image"];
    return images;
  }
}

@JsonSerializable()
class ImageList {
  List<Images> data;
  ImageList({this.data});

  factory ImageList.fromJson(List<dynamic> json) {
    return ImageList(
        data: json
            .map((e) => Images.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}

@JsonSerializable()
class ImagesResponse {
  ImageList data;
  Status status;

  ImagesResponse({
    this.status,
    this.data,
  });

  factory ImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$ImagesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesResponseToJson(this);
}
