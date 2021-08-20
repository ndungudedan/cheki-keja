// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Status _$StatusFromJson(Map<String, dynamic> json) {
  return Status(
    code: json['code'] as String?,
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };

MpesaResponse _$MpesaResponseFromJson(Map<String, dynamic> json) {
  return MpesaResponse(
    ResponseCode: json['ResponseCode'] as String?,
    ResponseDescription: json['ResponseDescription'] as String?,
    errorMessage: json['errorMessage'] as String?,
  );
}

Map<String, dynamic> _$MpesaResponseToJson(MpesaResponse instance) =>
    <String, dynamic>{
      'ResponseCode': instance.ResponseCode,
      'ResponseDescription': instance.ResponseDescription,
      'errorMessage': instance.errorMessage,
    };
