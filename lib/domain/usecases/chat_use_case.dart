import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../failures/failures.dart';
import '../models/chat_models.dart';
import '../repositories/chat_repository.dart';

@injectable
class ChatUseCase {
  final ChatRepository _chatRepository;

  ChatUseCase(this._chatRepository);

  Future<Either<Failures, ChatResponseModel>> call({
    required String query,
    String? conversationId,
    List<ConversationHistoryItem>? conversationHistory,
  }) async {
    return await _chatRepository.sendMessage(
      query: query,
      conversationId: conversationId,
      conversationHistory: conversationHistory,
    );
  }

  Future<Either<Failures, ConversationsListModel>> getConversations({
    int? limit,
  }) async {
    return await _chatRepository.getConversations(limit: limit);
  }

  Future<Either<Failures, ConversationHistoryModel>> getConversationHistory({
    required String conversationId,
    int? limit,
  }) async {
    return await _chatRepository.getConversationHistory(
      conversationId: conversationId,
      limit: limit,
    );
  }

  Future<Either<Failures, void>> deleteConversation({
    required String conversationId,
  }) async {
    return await _chatRepository.deleteConversation(
      conversationId: conversationId,
    );
  }
}
