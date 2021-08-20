import 'package:json_annotation/json_annotation.dart';
part 'complainsClass.g.dart';

@JsonSerializable()
class Complain {
  String? id;
  String? title;
  String? description;
  String? timeline;
  ComplainUser? user;

  Complain({
    this.id,
    this.title,
    this.timeline,
    this.description,
    this.user,
  });

  factory Complain.fromJson(Map<String, dynamic> json) =>
      _$ComplainFromJson(json);

  Map<String, dynamic> toJson() => _$ComplainToJson(this);
}

@JsonSerializable()
class ComplainList {
  List<Complain>? complains;

  ComplainList({this.complains});

  factory ComplainList.fromJson(List<dynamic> json) {
    return ComplainList(
        complains: json
            .map((e) => Complain.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}

@JsonSerializable()
class ComplainUser {
  String? id;
  String? name;
  String? email;
  String? photo;

  ComplainUser({
    this.id,
    this.name,
    this.email,
    this.photo,
  });

  factory ComplainUser.fromJson(Map<String, dynamic> json) =>
      _$ComplainUserFromJson(json);

  Map<String, dynamic> toJson() => _$ComplainUserToJson(this);
}

@JsonSerializable()
class ComplainChat {
  String? id;
  String? chat;
  String? timeline;
  ComplainUser? user;

  ComplainChat({
    this.id,
    this.chat,
    this.timeline,
    this.user,
  });

  factory ComplainChat.fromJson(Map<String, dynamic> json) =>
      _$ComplainChatFromJson(json);

  Map<String, dynamic> toJson() => _$ComplainChatToJson(this);
}

@JsonSerializable()
class ComplainChatList {
  List<ComplainChat>? chats;

  ComplainChatList({this.chats});

  factory ComplainChatList.fromJson(List<dynamic> json) {
    return ComplainChatList(
        chats: json
            .map((e) => ComplainChat.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}

@JsonSerializable()
class ComplainResponse {
  String? id;
  String? snippet;
  String? timeline;
  String? response;

  ComplainResponse({
    this.id,
    this.snippet,
    this.timeline,
    this.response,
  });

  factory ComplainResponse.fromJson(Map<String, dynamic> json) =>
      _$ComplainResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComplainResponseToJson(this);
}

@JsonSerializable()
class ComplainResponseList {
  List<ComplainResponse>? responses;

  ComplainResponseList({this.responses});

  factory ComplainResponseList.fromJson(List<dynamic> json) {
    return ComplainResponseList(
        responses: json
            .map((e) => ComplainResponse.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}

@JsonSerializable()
class ChatsResponses {
  ComplainChatList? chatList;
  ComplainResponseList? responseList;

  ChatsResponses({
    this.chatList,
    this.responseList,
  });

  factory ChatsResponses.fromJson(Map<String, dynamic> json) =>
      _$ChatsResponsesFromJson(json);

  Map<String, dynamic> toJson() => _$ChatsResponsesToJson(this);
}