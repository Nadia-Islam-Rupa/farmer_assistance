import 'package:dartz/dartz.dart';
import '../failures/failures.dart';
import '../models/chat_models.dart';

abstract class ChatRepository {
  Future<Either<Failures, ChatResponseModel>> sendMessage({
    required String query,
    String? conversationId,
    List<ConversationHistoryItem>? conversationHistory,
  });
}
