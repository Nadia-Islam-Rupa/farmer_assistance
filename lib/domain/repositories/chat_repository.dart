import 'package:dartz/dartz.dart';
import '../failures/failures.dart';
import '../models/chat_models.dart';

abstract class ChatRepository {
  Future<Either<Failures, ChatResponseModel>> sendMessage({
    required String query,
    String? conversationId,
    List<ConversationHistoryItem>? conversationHistory,
  });

  Future<Either<Failures, ConversationsListModel>> getConversations({
    int? limit,
  });

  Future<Either<Failures, ConversationHistoryModel>> getConversationHistory({
    required String conversationId,
    int? limit,
  });

  Future<Either<Failures, void>> deleteConversation({
    required String conversationId,
  });
}
