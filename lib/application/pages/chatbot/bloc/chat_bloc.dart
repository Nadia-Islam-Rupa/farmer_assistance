import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/failures/dio_error.dart';
import '../../../../domain/failures/failures.dart';
import '../../../../domain/models/chat_models.dart';
import '../../../../domain/usecases/chat_use_case.dart';

part 'chat_bloc.freezed.dart';
part 'chat_event.dart';
part 'chat_state.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatUseCase _chatUseCase;

  ChatBloc(this._chatUseCase) : super(const ChatState.initial()) {
    on<_SendMessage>(_onSendMessage);
    on<_Reset>(_onReset);
  }

  Future<void> _onSendMessage(
    _SendMessage event,
    Emitter<ChatState> emit,
  ) async {
    try {
      emit(const ChatState.loading());
      final result = await _chatUseCase(
        query: event.query,
        conversationId: event.conversationId,
        conversationHistory: event.conversationHistory,
      );

      result.fold((failure) {
        if (failure is GeneralFailure) {
          emit(ChatState.error(message: failure.message));
        } else {
          emit(const ChatState.error(message: 'An unexpected error occurred.'));
        }
      }, (response) => emit(ChatState.loaded(response: response)));
    } catch (e) {
      if (e is DioException) {
        emit(ChatState.error(message: handleDioError(e)));
      } else {
        emit(
          ChatState.error(
            message: 'Unexpected error occurred: ${e.toString()}',
          ),
        );
      }
    }
  }

  void _onReset(_Reset event, Emitter<ChatState> emit) {
    emit(const ChatState.initial());
  }
}
