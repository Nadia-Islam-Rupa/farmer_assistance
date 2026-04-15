import 'dart:io';

import 'package:farmer_assistance/domain/failures/failures.dart';
import 'package:farmer_assistance/domain/usecases/profile_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:farmer_assistance/domain/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUseCase _profileUseCase;
  ProfileBloc({required ProfileUseCase profileUseCase})
    : _profileUseCase = profileUseCase,
      super(const ProfileState.initial()) {
    on<_FetchProfileInfo>((event, emit) async {
      try {
        emit(const ProfileState.loading());
        final response = await _profileUseCase.getProfile();

        response.fold((l) {
          if (l is GeneralFailure) {
            emit(ProfileState.error(message: l.message));
          } else {
            emit(const ProfileState.error(message: 'Something went wrong'));
          }
        }, (user) => emit(ProfileState.loaded(userModel: user)));
      } catch (e) {
        emit(const ProfileState.error(message: 'Something went wrong'));
      }
    });

    on<_UpdateProfileInfo>((event, emit) async {
      emit(const ProfileState.loading());
      try {
        if (event.file == null && event.name.isEmpty) {
          print("object");
          emit(
            const ProfileState.error(message: 'Please fill at list one fields'),
          );
          return;
        }
        final response = await _profileUseCase.updateProfile(
          event.file,
          event.name,
        );

        response.fold(
          (l) {
            if (l is GeneralFailure) {
              emit(ProfileState.error(message: l.message));
            } else {
              emit(const ProfileState.error(message: 'Something went wrong'));
            }
          },
          (r) {
            emit(const ProfileState.updatedProfileInfo());
          },
        );
      } catch (e) {
        emit(const ProfileState.error(message: 'Something went wrong'));
      }
    });
  }
}
