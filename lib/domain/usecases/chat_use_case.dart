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
}
