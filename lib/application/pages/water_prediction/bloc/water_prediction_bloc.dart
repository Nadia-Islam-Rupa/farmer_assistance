import 'package:farmer_assistance/domain/failures/failures.dart';
import 'package:farmer_assistance/domain/usecases/smart_irrigation_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:farmer_assistance/domain/models/smart_irrigation_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/models/smart_irrigation_response_model.dart';

part 'water_prediction_event.dart';
part 'water_prediction_state.dart';
part 'water_prediction_bloc.freezed.dart';

@injectable
class WaterPredictionBloc
    extends Bloc<WaterPredictionEvent, WaterPredictionState> {
  final SmartIrrigationUseCase _smartIrrigationUseCase;

  WaterPredictionBloc({required SmartIrrigationUseCase smartIrrigationUseCase})
    : _smartIrrigationUseCase = smartIrrigationUseCase,
      super(const WaterPredictionState.initial()) {
    on<WaterPredictionEvent>((event, emit) async {
      emit(const WaterPredictionState.loading());
      try {
        final response = await _smartIrrigationUseCase(event.data);

        response.fold((l) {
          if (l is GeneralFailure) {
            emit(WaterPredictionState.error(message: l.message));
          }
          emit(WaterPredictionState.error(message: "Something went wrong"));
        }, (r) => emit(WaterPredictionState.loaded(data: r)));
      } catch (e) {
        emit(WaterPredictionState.error(message: "Something went wrong"));
      }
    });
  }
}
