// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_account_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateAccountEvent {

 String get email; String get password; String get name; String get confirmPassword;
/// Create a copy of CreateAccountEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateAccountEventCopyWith<CreateAccountEvent> get copyWith => _$CreateAccountEventCopyWithImpl<CreateAccountEvent>(this as CreateAccountEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateAccountEvent&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.name, name) || other.name == name)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,name,confirmPassword);

@override
String toString() {
  return 'CreateAccountEvent(email: $email, password: $password, name: $name, confirmPassword: $confirmPassword)';
}


}

/// @nodoc
abstract mixin class $CreateAccountEventCopyWith<$Res>  {
  factory $CreateAccountEventCopyWith(CreateAccountEvent value, $Res Function(CreateAccountEvent) _then) = _$CreateAccountEventCopyWithImpl;
@useResult
$Res call({
 String email, String password, String name, String confirmPassword
});




}
/// @nodoc
class _$CreateAccountEventCopyWithImpl<$Res>
    implements $CreateAccountEventCopyWith<$Res> {
  _$CreateAccountEventCopyWithImpl(this._self, this._then);

  final CreateAccountEvent _self;
  final $Res Function(CreateAccountEvent) _then;

/// Create a copy of CreateAccountEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,Object? name = null,Object? confirmPassword = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateAccountEvent].
extension CreateAccountEventPatterns on CreateAccountEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email,  String password,  String name,  String confirmPassword)?  started,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.email,_that.password,_that.name,_that.confirmPassword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email,  String password,  String name,  String confirmPassword)  started,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.email,_that.password,_that.name,_that.confirmPassword);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email,  String password,  String name,  String confirmPassword)?  started,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.email,_that.password,_that.name,_that.confirmPassword);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements CreateAccountEvent {
  const _Started({required this.email, required this.password, required this.name, required this.confirmPassword});
  

@override final  String email;
@override final  String password;
@override final  String name;
@override final  String confirmPassword;

/// Create a copy of CreateAccountEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.name, name) || other.name == name)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,name,confirmPassword);

@override
String toString() {
  return 'CreateAccountEvent.started(email: $email, password: $password, name: $name, confirmPassword: $confirmPassword)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $CreateAccountEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@override @useResult
$Res call({
 String email, String password, String name, String confirmPassword
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of CreateAccountEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? name = null,Object? confirmPassword = null,}) {
  return _then(_Started(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$CreateAccountState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateAccountState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateAccountState()';
}


}

/// @nodoc
class $CreateAccountStateCopyWith<$Res>  {
$CreateAccountStateCopyWith(CreateAccountState _, $Res Function(CreateAccountState) __);
}


/// Adds pattern-matching-related methods to [CreateAccountState].
extension CreateAccountStatePatterns on CreateAccountState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( LoadingCreateAccountState value)?  loading,TResult Function( SuccessCreateAccountState value)?  success,TResult Function( ErrorAccountCreateState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoadingCreateAccountState() when loading != null:
return loading(_that);case SuccessCreateAccountState() when success != null:
return success(_that);case ErrorAccountCreateState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( LoadingCreateAccountState value)  loading,required TResult Function( SuccessCreateAccountState value)  success,required TResult Function( ErrorAccountCreateState value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case LoadingCreateAccountState():
return loading(_that);case SuccessCreateAccountState():
return success(_that);case ErrorAccountCreateState():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( LoadingCreateAccountState value)?  loading,TResult? Function( SuccessCreateAccountState value)?  success,TResult? Function( ErrorAccountCreateState value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoadingCreateAccountState() when loading != null:
return loading(_that);case SuccessCreateAccountState() when success != null:
return success(_that);case ErrorAccountCreateState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoadingCreateAccountState() when loading != null:
return loading();case SuccessCreateAccountState() when success != null:
return success();case ErrorAccountCreateState() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case LoadingCreateAccountState():
return loading();case SuccessCreateAccountState():
return success();case ErrorAccountCreateState():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoadingCreateAccountState() when loading != null:
return loading();case SuccessCreateAccountState() when success != null:
return success();case ErrorAccountCreateState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CreateAccountState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateAccountState.initial()';
}


}




/// @nodoc


class LoadingCreateAccountState implements CreateAccountState {
  const LoadingCreateAccountState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingCreateAccountState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateAccountState.loading()';
}


}




/// @nodoc


class SuccessCreateAccountState implements CreateAccountState {
  const SuccessCreateAccountState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessCreateAccountState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateAccountState.success()';
}


}




/// @nodoc


class ErrorAccountCreateState implements CreateAccountState {
  const ErrorAccountCreateState(this.message);
  

 final  String message;

/// Create a copy of CreateAccountState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorAccountCreateStateCopyWith<ErrorAccountCreateState> get copyWith => _$ErrorAccountCreateStateCopyWithImpl<ErrorAccountCreateState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorAccountCreateState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CreateAccountState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorAccountCreateStateCopyWith<$Res> implements $CreateAccountStateCopyWith<$Res> {
  factory $ErrorAccountCreateStateCopyWith(ErrorAccountCreateState value, $Res Function(ErrorAccountCreateState) _then) = _$ErrorAccountCreateStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorAccountCreateStateCopyWithImpl<$Res>
    implements $ErrorAccountCreateStateCopyWith<$Res> {
  _$ErrorAccountCreateStateCopyWithImpl(this._self, this._then);

  final ErrorAccountCreateState _self;
  final $Res Function(ErrorAccountCreateState) _then;

/// Create a copy of CreateAccountState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorAccountCreateState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
