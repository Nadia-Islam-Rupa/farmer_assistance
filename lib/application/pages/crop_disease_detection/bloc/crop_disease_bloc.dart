import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/failures/failures.dart';
import '../../../../domain/models/Crop_disease_model.dart';
import '../../../../domain/usecases/crop_disease_use_case.dart';
import '../../../../domain/failures/dio_error.dart';

part 'crop_disease_event.dart';
part 'crop_disease_state.dart';
part 'crop_disease_bloc.freezed.dart';

@injectable
class CropDiseaseBloc extends Bloc<CropDiseaseEvent, CropDiseaseState> {
  final CropDiseaseUseCase _cropDiseaseUseCase;
  CropDiseaseBloc(this._cropDiseaseUseCase)
    : super(const CropDiseaseState.initial()) {
    on<CropDiseaseEvent>((event, emit) async {
      try {
        emit(const CropDiseaseState.loading());
        final result = await _cropDiseaseUseCase(event.imageFile);
        result.fold(
          (failure) {
            if (failure is GeneralFailure) {
              emit(CropDiseaseState.error(failure.message));
              print(failure.message);
            } else {
              emit(
                const CropDiseaseState.error('An unexpected error occurred.'),
              );
            }
          },
          (cropDiseaseModel) => emit(CropDiseaseState.loaded(cropDiseaseModel)),
        );
      } catch (e) {
        if (e is DioException) {
          emit(CropDiseaseState.error(handleDioError(e)));
        } else {
          emit(CropDiseaseState.error('Unexpected error occurred'));
        }
      }
    });
  }
}


