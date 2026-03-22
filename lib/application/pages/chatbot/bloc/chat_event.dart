part of 'chat_bloc.dart';

@freezed
abstract class ChatEvent with _$ChatEvent {
  const factory ChatEvent.sendMessage({
    required String query,
    String? conversationId,
    List<ConversationHistoryItem>? conversationHistory,
  }) = _SendMessage;

  const factory ChatEvent.reset() = _Reset;
}
