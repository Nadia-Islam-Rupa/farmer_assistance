// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forget_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForgetPasswordEvent {

 String get email;
/// Create a copy of ForgetPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgetPasswordEventCopyWith<ForgetPasswordEvent> get copyWith => _$ForgetPasswordEventCopyWithImpl<ForgetPasswordEvent>(this as ForgetPasswordEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgetPasswordEvent&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ForgetPasswordEvent(email: $email)';
}


}

/// @nodoc
abstract mixin class $ForgetPasswordEventCopyWith<$Res>  {
  factory $ForgetPasswordEventCopyWith(ForgetPasswordEvent value, $Res Function(ForgetPasswordEvent) _then) = _$ForgetPasswordEventCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$ForgetPasswordEventCopyWithImpl<$Res>
    implements $ForgetPasswordEventCopyWith<$Res> {
  _$ForgetPasswordEventCopyWithImpl(this._self, this._then);

  final ForgetPasswordEvent _self;
  final $Res Function(ForgetPasswordEvent) _then;

/// Create a copy of ForgetPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ForgetPasswordEvent].
extension ForgetPasswordEventPatterns on ForgetPasswordEvent {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email)?  started,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email)  started,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email)?  started,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.email);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ForgetPasswordEvent {
  const _Started({required this.email});
  

@override final  String email;

/// Create a copy of ForgetPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ForgetPasswordEvent.started(email: $email)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $ForgetPasswordEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@override @useResult
$Res call({
 String email
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of ForgetPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_Started(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ForgetPasswordState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgetPasswordState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgetPasswordState()';
}


}

/// @nodoc
class $ForgetPasswordStateCopyWith<$Res>  {
$ForgetPasswordStateCopyWith(ForgetPasswordState _, $Res Function(ForgetPasswordState) __);
}


/// Adds pattern-matching-related methods to [ForgetPasswordState].
extension ForgetPasswordStatePatterns on ForgetPasswordState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( LoadingForgetPasswordState value)?  loading,TResult Function( ErrorForgetPasswordState value)?  error,TResult Function( SuccessForgetPasswordState value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoadingForgetPasswordState() when loading != null:
return loading(_that);case ErrorForgetPasswordState() when error != null:
return error(_that);case SuccessForgetPasswordState() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( LoadingForgetPasswordState value)  loading,required TResult Function( ErrorForgetPasswordState value)  error,required TResult Function( SuccessForgetPasswordState value)  success,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case LoadingForgetPasswordState():
return loading(_that);case ErrorForgetPasswordState():
return error(_that);case SuccessForgetPasswordState():
return success(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( LoadingForgetPasswordState value)?  loading,TResult? Function( ErrorForgetPasswordState value)?  error,TResult? Function( SuccessForgetPasswordState value)?  success,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoadingForgetPasswordState() when loading != null:
return loading(_that);case ErrorForgetPasswordState() when error != null:
return error(_that);case SuccessForgetPasswordState() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String message)?  error,TResult Function( String message)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoadingForgetPasswordState() when loading != null:
return loading();case ErrorForgetPasswordState() when error != null:
return error(_that.message);case SuccessForgetPasswordState() when success != null:
return success(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String message)  error,required TResult Function( String message)  success,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case LoadingForgetPasswordState():
return loading();case ErrorForgetPasswordState():
return error(_that.message);case SuccessForgetPasswordState():
return success(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String message)?  error,TResult? Function( String message)?  success,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoadingForgetPasswordState() when loading != null:
return loading();case ErrorForgetPasswordState() when error != null:
return error(_that.message);case SuccessForgetPasswordState() when success != null:
return success(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ForgetPasswordState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgetPasswordState.initial()';
}


}




/// @nodoc


class LoadingForgetPasswordState implements ForgetPasswordState {
  const LoadingForgetPasswordState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingForgetPasswordState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgetPasswordState.loading()';
}


}




/// @nodoc


class ErrorForgetPasswordState implements ForgetPasswordState {
  const ErrorForgetPasswordState({required this.message});
  

 final  String message;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorForgetPasswordStateCopyWith<ErrorForgetPasswordState> get copyWith => _$ErrorForgetPasswordStateCopyWithImpl<ErrorForgetPasswordState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorForgetPasswordState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ForgetPasswordState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorForgetPasswordStateCopyWith<$Res> implements $ForgetPasswordStateCopyWith<$Res> {
  factory $ErrorForgetPasswordStateCopyWith(ErrorForgetPasswordState value, $Res Function(ErrorForgetPasswordState) _then) = _$ErrorForgetPasswordStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorForgetPasswordStateCopyWithImpl<$Res>
    implements $ErrorForgetPasswordStateCopyWith<$Res> {
  _$ErrorForgetPasswordStateCopyWithImpl(this._self, this._then);

  final ErrorForgetPasswordState _self;
  final $Res Function(ErrorForgetPasswordState) _then;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorForgetPasswordState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SuccessForgetPasswordState implements ForgetPasswordState {
  const SuccessForgetPasswordState({required this.message});
  

 final  String message;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessForgetPasswordStateCopyWith<SuccessForgetPasswordState> get copyWith => _$SuccessForgetPasswordStateCopyWithImpl<SuccessForgetPasswordState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessForgetPasswordState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ForgetPasswordState.success(message: $message)';
}


}

/// @nodoc
abstract mixin class $SuccessForgetPasswordStateCopyWith<$Res> implements $ForgetPasswordStateCopyWith<$Res> {
  factory $SuccessForgetPasswordStateCopyWith(SuccessForgetPasswordState value, $Res Function(SuccessForgetPasswordState) _then) = _$SuccessForgetPasswordStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SuccessForgetPasswordStateCopyWithImpl<$Res>
    implements $SuccessForgetPasswordStateCopyWith<$Res> {
  _$SuccessForgetPasswordStateCopyWithImpl(this._self, this._then);

  final SuccessForgetPasswordState _self;
  final $Res Function(SuccessForgetPasswordState) _then;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SuccessForgetPasswordState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
