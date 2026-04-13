import 'package:farmer_assistance/domain/failures/failures.dart';
import 'package:farmer_assistance/domain/models/price_prediction_request_model.dart';
import 'package:farmer_assistance/domain/models/price_prediction_response_model.dart';
import 'package:farmer_assistance/domain/usecases/price_prediction_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'price_prediction_bloc.freezed.dart';
part 'price_prediction_event.dart';
part 'price_prediction_state.dart';

@injectable
class PricePredictionBloc
    extends Bloc<PricePredictionEvent, PricePredictionState> {
  final PricePredictionUseCase _pricePredictionUseCase;

  PricePredictionBloc({required PricePredictionUseCase pricePredictionUseCase})
    : _pricePredictionUseCase = pricePredictionUseCase,
      super(const PricePredictionState.initial()) {
    on<PricePredictionEvent>((event, emit) async {
      emit(const PricePredictionState.loading());
      try {
        final response = await _pricePredictionUseCase.call(event.data);

        response.fold((l) {
          if (l is GeneralFailure) {
            emit(PricePredictionState.error(message: l.message));
          } else {
            emit(
              const PricePredictionState.error(
                message: "Something went wrong",
              ),
            );
          }
        }, (r) => emit(PricePredictionState.loaded(data: r)));
      } catch (e) {
        emit(
          const PricePredictionState.error(message: "Something went wrong"),
        );
      }
    });
  }
}
