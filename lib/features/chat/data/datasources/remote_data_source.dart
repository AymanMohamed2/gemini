import 'package:chat_gpt/core/network/api_service.dart';
import 'package:chat_gpt/core/network/end_points.dart';
import 'package:chat_gpt/features/chat/data/datasources/base_home_data_source.dart';
import 'package:chat_gpt/features/chat/data/models/message_model/message_model.dart';
import 'package:chat_gpt/features/chat/data/models/send_message_request_model/send_message_request_model.dart';
import 'package:chat_gpt/features/chat/domain/entities/message_entity.dart';

class RemoteDataSource extends BaseHomeDataSource {
  final ApiService apiService;

  RemoteDataSource(this.apiService);
  @override
  Future<MessageEntity> sendMessage(
      SendMessageRequestModel sendMessageRequestModel) async {
    var result = await apiService.post(
        endPoint: EndPoints.generateContent,
        body: sendMessageRequestModel.toJson());

    return MessageModel.fromJson(result);
  }
}
