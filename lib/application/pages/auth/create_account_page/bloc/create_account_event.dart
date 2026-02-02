part of 'create_account_bloc.dart';

@freezed
abstract class CreateAccountEvent with _$CreateAccountEvent {
  const factory CreateAccountEvent.started({
    required String email,
    required String password,
    required String name,
    required String confirmPassword,
  }) = _Started;

  // @override
  // // TODO: implement confirmPassword
  // String get confirmPassword => throw UnimplementedError();
  //
  // @override
  // // TODO: implement email
  // String get email => throw UnimplementedError();
  //
  // @override
  // // TODO: implement name
  // String get name => throw UnimplementedError();
  //
  // @override
  // // TODO: implement password
  // String get password => throw UnimplementedError();
}
