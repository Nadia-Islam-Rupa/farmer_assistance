import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/failures/dio_error.dart';
import '../../../../domain/failures/failures.dart';
import '../../../../domain/models/chat_models.dart';
import '../../../../domain/usecases/chat_use_case.dart';

part 'conversations_list_bloc.freezed.dart';
part 'conversations_list_event.dart';
part 'conversations_list_state.dart';

@injectable
class ConversationsListBloc
    extends Bloc<ConversationsListEvent, ConversationsListState> {
  final ChatUseCase _chatUseCase;

  ConversationsListBloc(this._chatUseCase)
    : super(const ConversationsListState.initial()) {
    on<_LoadConversations>(_onLoadConversations);
    on<_RefreshConversations>(_onRefreshConversations);
    on<_DeleteConversation>(_onDeleteConversation);
  }

  Future<void> _onLoadConversations(
    _LoadConversations event,
    Emitter<ConversationsListState> emit,
  ) async {
    try {
      emit(const ConversationsListState.loading());
      final result = await _chatUseCase.getConversations(limit: event.limit);

      result.fold(
        (failure) {
          if (failure is GeneralFailure) {
            emit(ConversationsListState.error(message: failure.message));
          } else {
            emit(
              const ConversationsListState.error(
                message: 'An unexpected error occurred.',
              ),
            );
          }
        },
        (conversationsList) => emit(
          ConversationsListState.loaded(
            conversations: conversationsList.conversations,
          ),
        ),
      );
    } catch (e) {
      if (e is DioException) {
        emit(ConversationsListState.error(message: handleDioError(e)));
      } else {
        emit(
          ConversationsListState.error(
            message: 'Unexpected error occurred: ${e.toString()}',
          ),
        );
      }
    }
  }

  Future<void> _onRefreshConversations(
    _RefreshConversations event,
    Emitter<ConversationsListState> emit,
  ) async {
    // Keep the current state if loaded, show loading otherwise
    try {
      final result = await _chatUseCase.getConversations(limit: event.limit);

      result.fold(
        (failure) {
          if (failure is GeneralFailure) {
            emit(ConversationsListState.error(message: failure.message));
          } else {
            emit(
              const ConversationsListState.error(
                message: 'An unexpected error occurred.',
              ),
            );
          }
        },
        (conversationsList) => emit(
          ConversationsListState.loaded(
            conversations: conversationsList.conversations,
          ),
        ),
      );
    } catch (e) {
      if (e is DioException) {
        emit(ConversationsListState.error(message: handleDioError(e)));
      } else {
        emit(
          ConversationsListState.error(
            message: 'Unexpected error occurred: ${e.toString()}',
          ),
        );
      }
    }
  }

  Future<void> _onDeleteConversation(
    _DeleteConversation event,
    Emitter<ConversationsListState> emit,
  ) async {
    try {
      final result = await _chatUseCase.deleteConversation(
        conversationId: event.conversationId,
      );

      result.fold(
        (failure) {
          if (failure is GeneralFailure) {
            emit(ConversationsListState.error(message: failure.message));
          } else {
            emit(
              const ConversationsListState.error(
                message: 'Failed to delete conversation.',
              ),
            );
          }
        },
        (_) {
          // After successful deletion, refresh the conversations list
          add(const ConversationsListEvent.refreshConversations());
        },
      );
    } catch (e) {
      if (e is DioException) {
        emit(ConversationsListState.error(message: handleDioError(e)));
      } else {
        emit(
          ConversationsListState.error(
            message: 'Unexpected error occurred: ${e.toString()}',
          ),
        );
      }
    }
  }
}
