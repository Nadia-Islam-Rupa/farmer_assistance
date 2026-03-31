import 'package:farmer_assistance/domain/failures/failures.dart';
import 'package:farmer_assistance/domain/models/yield_estimation_response_model.dart';
import 'package:farmer_assistance/domain/usecases/yield_estimation_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/models/yield_estimation_request_model.dart';

part 'yield_prediction_event.dart';
part 'yield_prediction_state.dart';
part 'yield_prediction_bloc.freezed.dart';

@injectable
class YieldPredictionBloc
    extends Bloc<YieldPredictionEvent, YieldPredictionState> {
  final YieldEstimationUseCase _yieldEstimationUseCase;

  YieldPredictionBloc({required YieldEstimationUseCase yieldEstimationUseCase})
    : _yieldEstimationUseCase = yieldEstimationUseCase,

      super(const YieldPredictionState.initial()) {
    on<YieldPredictionEvent>((event, emit) async {
      emit(const YieldPredictionState.loading());
      try {
        final response = await _yieldEstimationUseCase.call(event.data);

        response.fold((l) {
          if (l is GeneralFailure) {
            emit(YieldPredictionState.error(message: l.message));
          } else {
            emit(
              const YieldPredictionState.error(message: "Something went wrong"),
            );
          }
        }, (r) => emit(YieldPredictionState.loaded(data: r)));
      } catch (e) {
        emit(const YieldPredictionState.error(message: "Something went wrong"));
      }
    });
  }
}
