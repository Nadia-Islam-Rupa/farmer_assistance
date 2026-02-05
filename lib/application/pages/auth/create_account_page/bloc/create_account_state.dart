part of 'create_account_bloc.dart';

@freezed
class CreateAccountState with _$CreateAccountState {
  const factory CreateAccountState.initial() = _Initial;
  const factory CreateAccountState.loading() = LoadingCreateAccountState;
  const factory CreateAccountState.success() = SuccessCreateAccountState;
  const factory CreateAccountState.error(String message) =
      ErrorAccountCreateState;
}
