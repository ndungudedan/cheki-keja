import 'package:json_annotation/json_annotation.dart';
part 'reviewClass.g.dart';

@JsonSerializable()
class Review {
  String id;
  String review;
  String rating;
  String timeline;
  ReviewUser user;

  Review(
      {this.id,
      this.review,
      this.rating,
      this.timeline,
      this.user,
      });

  factory Review.fromJson(Map<String, dynamic> json) =>
      _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}

@JsonSerializable()
class ReviewList {
  List<Review> reviews;

  ReviewList({this.reviews});

  factory ReviewList.fromJson(List<dynamic> json) {
    return ReviewList(
        reviews: json
            .map((e) => Review.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}

@JsonSerializable()
class ReviewUser {
  String id;
  String name;
  String email;
  String photo;

  ReviewUser(
      {this.id,
      this.name,
      this.email,
      this.photo,
      });

  factory ReviewUser.fromJson(Map<String, dynamic> json) => _$ReviewUserFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewUserToJson(this);
}
