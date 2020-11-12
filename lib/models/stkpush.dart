import 'package:json_annotation/json_annotation.dart';
part 'stkpush.g.dart';

@JsonSerializable()
class Stkpush {
  String code;
  String message;

  Stkpush({
    this.code,
    this.message,
  });

  factory Stkpush.fromJson(Map<String, dynamic> json) => _$StkpushFromJson(json);

  Map<String, dynamic> toJson() => _$StkpushToJson(this);
}