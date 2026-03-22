import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../domain/failures/dio_error.dart';
import '../../domain/failures/failures.dart';
import '../../domain/models/chat_models.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/remote_datasource/api_service.dart.dart';

@Injectable(as: ChatRepository)
class ChatRepositoryImpl extends ChatRepository {
  final ApiService _apiService;

  ChatRepositoryImpl(this._apiService);

  @override
  Future<Either<Failures, ChatResponseModel>> sendMessage({
    required String query,
    String? conversationId,
    List<ConversationHistoryItem>? conversationHistory,
  }) async {
    try {
      final response = await _apiService.sendChatMessage(
        query: query,
        conversationId: conversationId,
        conversationHistory: conversationHistory,
      );

      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(GeneralFailure(handleDioError(e)));
      }
      return left(GeneralFailure("Unexpected error occurred."));
    }
  }
}
