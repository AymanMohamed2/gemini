import 'package:chat_gpt/core/entities/message_entity.dart';
import 'package:chat_gpt/core/errors/faliure.dart';
import 'package:chat_gpt/core/errors/server_failure.dart';
import 'package:chat_gpt/core/models/send_message_request_model/send_message_request_model.dart';
import 'package:chat_gpt/features/recorder/data/datasources/base_recorder_data_source.dart';
import 'package:chat_gpt/features/recorder/domain/repository/recorder_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RecorderRepositoryImpl extends RecoderRepository {
  final BaseRecorderDataSource baseRecorderDataSource;

  RecorderRepositoryImpl(this.baseRecorderDataSource);
  @override
  Future<Either<Failure, MessageEntity>> askYourQuestion(
      SendMessageRequestModel sendMessageRequestModel) async {
    try {
      final result =
          await baseRecorderDataSource.askYourQuestion(sendMessageRequestModel);
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
