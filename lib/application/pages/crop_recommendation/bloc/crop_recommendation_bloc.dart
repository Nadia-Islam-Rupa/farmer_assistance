import 'package:bloc/bloc.dart';
import 'package:farmer_assistance/domain/models/Crop_recommendation_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/failures/failures.dart';
import '../../../../domain/models/Crop_recommendation_response_model.dart';
import '../../../../domain/usecases/crop_recommendation_use_case.dart';

part 'crop_recommendation_bloc.freezed.dart';
part 'crop_recommendation_event.dart';
part 'crop_recommendation_state.dart';

@injectable
class CropRecommendationBloc
    extends Bloc<CropRecommendationEvent, CropRecommendationState> {
  final CropRecommendationUseCase cropRecommendationUseCase;
  CropRecommendationBloc({required this.cropRecommendationUseCase})
    : super(const CropRecommendationState.initial()) {
    on<CropRecommendationEvent>((event, emit) async {
      emit(const CropRecommendationState.loading());
      try {
        final response = await cropRecommendationUseCase(
          event.cropRecommendationRequestModel,
        );

        response.fold((l) {
          if (l is GeneralFailure) {
            emit(CropRecommendationState.error(message: l.message));
          }
          emit(
            const CropRecommendationState.error(
              message: "Something went wrong",
            ),
          );
        }, (r) => emit(CropRecommendationState.loaded(data: r)));
      } catch (e) {
        emit(
          const CropRecommendationState.error(message: "Something went wrong"),
        );
      }
    });
  }
}
