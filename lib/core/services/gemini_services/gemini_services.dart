import 'package:chat_gpt/core/network/api_service.dart';
import 'package:chat_gpt/core/network/end_points.dart';
import 'package:chat_gpt/core/models/message_model/message_model.dart';
import 'package:chat_gpt/core/models/send_message_request_model/send_message_request_model.dart';
import 'package:chat_gpt/core/entities/message_entity.dart';

class GeminiServices {
  final ApiService apiService;

  GeminiServices(this.apiService);
  Future<MessageEntity> sendMessage(
      SendMessageRequestModel sendMessageRequestModel) async {
    var result = await apiService.post(
        endPoint: EndPoints.generateContent,
        body: sendMessageRequestModel.toJson());

    return MessageModel.fromJson(result);
  }
}
