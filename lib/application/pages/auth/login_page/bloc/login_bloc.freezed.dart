// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent()';
}


}

/// @nodoc
class $LoginEventCopyWith<$Res>  {
$LoginEventCopyWith(LoginEvent _, $Res Function(LoginEvent) __);
}


/// Adds pattern-matching-related methods to [LoginEvent].
extension LoginEventPatterns on LoginEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _LoginWithGoogle value)?  loginWithGoogle,TResult Function( _LogOutEvet value)?  logOut,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _LoginWithGoogle() when loginWithGoogle != null:
return loginWithGoogle(_that);case _LogOutEvet() when logOut != null:
return logOut(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _LoginWithGoogle value)  loginWithGoogle,required TResult Function( _LogOutEvet value)  logOut,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _LoginWithGoogle():
return loginWithGoogle(_that);case _LogOutEvet():
return logOut(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _LoginWithGoogle value)?  loginWithGoogle,TResult? Function( _LogOutEvet value)?  logOut,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _LoginWithGoogle() when loginWithGoogle != null:
return loginWithGoogle(_that);case _LogOutEvet() when logOut != null:
return logOut(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email,  String password)?  started,TResult Function()?  loginWithGoogle,TResult Function()?  logOut,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.email,_that.password);case _LoginWithGoogle() when loginWithGoogle != null:
return loginWithGoogle();case _LogOutEvet() when logOut != null:
return logOut();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email,  String password)  started,required TResult Function()  loginWithGoogle,required TResult Function()  logOut,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.email,_that.password);case _LoginWithGoogle():
return loginWithGoogle();case _LogOutEvet():
return logOut();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email,  String password)?  started,TResult? Function()?  loginWithGoogle,TResult? Function()?  logOut,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.email,_that.password);case _LoginWithGoogle() when loginWithGoogle != null:
return loginWithGoogle();case _LogOutEvet() when logOut != null:
return logOut();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements LoginEvent {
  const _Started({required this.email, required this.password});
  

 final  String email;
 final  String password;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'LoginEvent.started(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_Started(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LoginWithGoogle implements LoginEvent {
  const _LoginWithGoogle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginWithGoogle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.loginWithGoogle()';
}


}




/// @nodoc


class _LogOutEvet implements LoginEvent {
  const _LogOutEvet();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogOutEvet);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.logOut()';
}


}




/// @nodoc
mixin _$LoginState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState()';
}


}

/// @nodoc
class $LoginStateCopyWith<$Res>  {
$LoginStateCopyWith(LoginState _, $Res Function(LoginState) __);
}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( LoadingLoginState value)?  loading,TResult Function( SuccessLoginState value)?  success,TResult Function( ErrorLoginState value)?  error,TResult Function( SignOutLoginState value)?  signOut,TResult Function( ErrorSignOut value)?  errorSignOut,TResult Function( SignOutSuccess value)?  signOutSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoadingLoginState() when loading != null:
return loading(_that);case SuccessLoginState() when success != null:
return success(_that);case ErrorLoginState() when error != null:
return error(_that);case SignOutLoginState() when signOut != null:
return signOut(_that);case ErrorSignOut() when errorSignOut != null:
return errorSignOut(_that);case SignOutSuccess() when signOutSuccess != null:
return signOutSuccess(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( LoadingLoginState value)  loading,required TResult Function( SuccessLoginState value)  success,required TResult Function( ErrorLoginState value)  error,required TResult Function( SignOutLoginState value)  signOut,required TResult Function( ErrorSignOut value)  errorSignOut,required TResult Function( SignOutSuccess value)  signOutSuccess,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case LoadingLoginState():
return loading(_that);case SuccessLoginState():
return success(_that);case ErrorLoginState():
return error(_that);case SignOutLoginState():
return signOut(_that);case ErrorSignOut():
return errorSignOut(_that);case SignOutSuccess():
return signOutSuccess(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( LoadingLoginState value)?  loading,TResult? Function( SuccessLoginState value)?  success,TResult? Function( ErrorLoginState value)?  error,TResult? Function( SignOutLoginState value)?  signOut,TResult? Function( ErrorSignOut value)?  errorSignOut,TResult? Function( SignOutSuccess value)?  signOutSuccess,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoadingLoginState() when loading != null:
return loading(_that);case SuccessLoginState() when success != null:
return success(_that);case ErrorLoginState() when error != null:
return error(_that);case SignOutLoginState() when signOut != null:
return signOut(_that);case ErrorSignOut() when errorSignOut != null:
return errorSignOut(_that);case SignOutSuccess() when signOutSuccess != null:
return signOutSuccess(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( String message)?  error,TResult Function()?  signOut,TResult Function( String message)?  errorSignOut,TResult Function()?  signOutSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoadingLoginState() when loading != null:
return loading();case SuccessLoginState() when success != null:
return success();case ErrorLoginState() when error != null:
return error(_that.message);case SignOutLoginState() when signOut != null:
return signOut();case ErrorSignOut() when errorSignOut != null:
return errorSignOut(_that.message);case SignOutSuccess() when signOutSuccess != null:
return signOutSuccess();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( String message)  error,required TResult Function()  signOut,required TResult Function( String message)  errorSignOut,required TResult Function()  signOutSuccess,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case LoadingLoginState():
return loading();case SuccessLoginState():
return success();case ErrorLoginState():
return error(_that.message);case SignOutLoginState():
return signOut();case ErrorSignOut():
return errorSignOut(_that.message);case SignOutSuccess():
return signOutSuccess();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( String message)?  error,TResult? Function()?  signOut,TResult? Function( String message)?  errorSignOut,TResult? Function()?  signOutSuccess,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoadingLoginState() when loading != null:
return loading();case SuccessLoginState() when success != null:
return success();case ErrorLoginState() when error != null:
return error(_that.message);case SignOutLoginState() when signOut != null:
return signOut();case ErrorSignOut() when errorSignOut != null:
return errorSignOut(_that.message);case SignOutSuccess() when signOutSuccess != null:
return signOutSuccess();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements LoginState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.initial()';
}


}




/// @nodoc


class LoadingLoginState implements LoginState {
  const LoadingLoginState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingLoginState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.loading()';
}


}




/// @nodoc


class SuccessLoginState implements LoginState {
  const SuccessLoginState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessLoginState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.success()';
}


}




/// @nodoc


class ErrorLoginState implements LoginState {
  const ErrorLoginState({required this.message});
  

 final  String message;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorLoginStateCopyWith<ErrorLoginState> get copyWith => _$ErrorLoginStateCopyWithImpl<ErrorLoginState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorLoginState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LoginState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorLoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $ErrorLoginStateCopyWith(ErrorLoginState value, $Res Function(ErrorLoginState) _then) = _$ErrorLoginStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorLoginStateCopyWithImpl<$Res>
    implements $ErrorLoginStateCopyWith<$Res> {
  _$ErrorLoginStateCopyWithImpl(this._self, this._then);

  final ErrorLoginState _self;
  final $Res Function(ErrorLoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorLoginState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SignOutLoginState implements LoginState {
  const SignOutLoginState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignOutLoginState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.signOut()';
}


}




/// @nodoc


class ErrorSignOut implements LoginState {
  const ErrorSignOut({required this.message});
  

 final  String message;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorSignOutCopyWith<ErrorSignOut> get copyWith => _$ErrorSignOutCopyWithImpl<ErrorSignOut>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorSignOut&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LoginState.errorSignOut(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorSignOutCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $ErrorSignOutCopyWith(ErrorSignOut value, $Res Function(ErrorSignOut) _then) = _$ErrorSignOutCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorSignOutCopyWithImpl<$Res>
    implements $ErrorSignOutCopyWith<$Res> {
  _$ErrorSignOutCopyWithImpl(this._self, this._then);

  final ErrorSignOut _self;
  final $Res Function(ErrorSignOut) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorSignOut(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SignOutSuccess implements LoginState {
  const SignOutSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignOutSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.signOutSuccess()';
}


}




// dart format on
