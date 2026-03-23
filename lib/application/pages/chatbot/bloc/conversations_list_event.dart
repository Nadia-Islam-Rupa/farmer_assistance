part of 'conversations_list_bloc.dart';

@freezed
abstract class ConversationsListEvent with _$ConversationsListEvent {
  const factory ConversationsListEvent.loadConversations({
    @Default(20) int limit,
  }) = _LoadConversations;
  const factory ConversationsListEvent.refreshConversations({
    @Default(20) int limit,
  }) = _RefreshConversations;
  const factory ConversationsListEvent.deleteConversation({
    required String conversationId,
  }) = _DeleteConversation;
}
