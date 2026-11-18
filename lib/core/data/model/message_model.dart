import 'package:llm_chat_app/domain/entities/message_entity.dart';

class MessageModel extends MessageEntity{
  MessageModel({required super.role, required super.text, required super.time});
  Map<String, String> toApiMap() => {//api te message ta pathabo post tai toApi use hoise
    'role': role,
    'content': text,
  };

}