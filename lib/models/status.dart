import 'package:json_annotation/json_annotation.dart';
part 'status.g.dart';

@JsonSerializable()
class Status {
  String code;
  String message;

  Status({
    this.code,
    this.message,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}

@JsonSerializable()
class MpesaResponse {
  String ResponseCode;
  String ResponseDescription;
  String errorMessage;

  MpesaResponse({
    this.ResponseCode,
    this.ResponseDescription,
    this.errorMessage,
  });

  factory MpesaResponse.fromJson(Map<String, dynamic> json) => _$MpesaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MpesaResponseToJson(this);
}
