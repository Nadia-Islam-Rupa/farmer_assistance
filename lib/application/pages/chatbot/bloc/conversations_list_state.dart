part of 'conversations_list_bloc.dart';

@freezed
class ConversationsListState with _$ConversationsListState {
  const factory ConversationsListState.initial() = _Initial;
  const factory ConversationsListState.loading() = _Loading;
  const factory ConversationsListState.loaded({
    required List<ConversationItem> conversations,
  }) = _Loaded;
  const factory ConversationsListState.error({required String message}) =
      _Error;
}
