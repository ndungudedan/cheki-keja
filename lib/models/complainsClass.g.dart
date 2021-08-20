// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complainsClass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Complain _$ComplainFromJson(Map<String, dynamic> json) {
  return Complain(
    id: json['id'] as String?,
    title: json['title'] as String?,
    timeline: json['timeline'] as String?,
    description: json['description'] as String?,
    user: json['user'] == null
        ? null
        : ComplainUser.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ComplainToJson(Complain instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'timeline': instance.timeline,
      'user': instance.user,
    };

ComplainList _$ComplainListFromJson(Map<String, dynamic> json) {
  return ComplainList(
    complains: (json['complains'] as List<dynamic>?)
        ?.map((e) => Complain.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ComplainListToJson(ComplainList instance) =>
    <String, dynamic>{
      'complains': instance.complains,
    };

ComplainUser _$ComplainUserFromJson(Map<String, dynamic> json) {
  return ComplainUser(
    id: json['id'] as String?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    photo: json['photo'] as String?,
  );
}

Map<String, dynamic> _$ComplainUserToJson(ComplainUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'photo': instance.photo,
    };

ComplainChat _$ComplainChatFromJson(Map<String, dynamic> json) {
  return ComplainChat(
    id: json['id'] as String?,
    chat: json['chat'] as String?,
    timeline: json['timeline'] as String?,
    user: json['user'] == null
        ? null
        : ComplainUser.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ComplainChatToJson(ComplainChat instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chat': instance.chat,
      'timeline': instance.timeline,
      'user': instance.user,
    };

ComplainChatList _$ComplainChatListFromJson(Map<String, dynamic> json) {
  return ComplainChatList(
    chats: (json['chats'] as List<dynamic>?)
        ?.map((e) => ComplainChat.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ComplainChatListToJson(ComplainChatList instance) =>
    <String, dynamic>{
      'chats': instance.chats,
    };

ComplainResponse _$ComplainResponseFromJson(Map<String, dynamic> json) {
  return ComplainResponse(
    id: json['id'] as String?,
    snippet: json['snippet'] as String?,
    timeline: json['timeline'] as String?,
    response: json['response'] as String?,
  );
}

Map<String, dynamic> _$ComplainResponseToJson(ComplainResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'snippet': instance.snippet,
      'timeline': instance.timeline,
      'response': instance.response,
    };

ComplainResponseList _$ComplainResponseListFromJson(Map<String, dynamic> json) {
  return ComplainResponseList(
    responses: (json['responses'] as List<dynamic>?)
        ?.map((e) => ComplainResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ComplainResponseListToJson(
        ComplainResponseList instance) =>
    <String, dynamic>{
      'responses': instance.responses,
    };

ChatsResponses _$ChatsResponsesFromJson(Map<String, dynamic> json) {
  return ChatsResponses(
    chatList: json['chatList'] == null
        ? null
        : ComplainChatList.fromJson(json['chatList'] as List<dynamic>),
    responseList: json['responseList'] == null
        ? null
        : ComplainResponseList.fromJson(json['responseList'] as List<dynamic>),
  );
}

Map<String, dynamic> _$ChatsResponsesToJson(ChatsResponses instance) =>
    <String, dynamic>{
      'chatList': instance.chatList,
      'responseList': instance.responseList,
    };
