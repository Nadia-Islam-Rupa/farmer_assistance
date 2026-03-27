import 'package:farmer_assistance/domain/failures/failures.dart';
import 'package:farmer_assistance/domain/usecases/fertilizer_tips_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:farmer_assistance/domain/models/fertilizer_tips_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/models/fertilizer_tips_response_model.dart';

part 'fertilizer_event.dart';
part 'fertilizer_state.dart';
part 'fertilizer_bloc.freezed.dart';

@injectable
class FertilizerBloc extends Bloc<FertilizerEvent, FertilizerState> {
  final FertilizerTipsUseCase _fertilizerTipsUseCase;

  FertilizerBloc({required FertilizerTipsUseCase fertilizerTipsUseCase})
    : _fertilizerTipsUseCase = fertilizerTipsUseCase,
      super(const FertilizerState.initial()) {
    on<FertilizerEvent>((event, emit) async {
      emit(const FertilizerState.loading());
      try {
        final response = await _fertilizerTipsUseCase(event.data);

        response.fold((l) {
          if (l is GeneralFailure) {
            emit(FertilizerState.error(message: l.message));
          }
          emit(const FertilizerState.error(message: "Something went wrong"));
        }, (r) => emit(FertilizerState.loaded(data: r)));
      } catch (e) {
        emit(const FertilizerState.error(message: "Something went wrong"));
      }
    });
  }
}
