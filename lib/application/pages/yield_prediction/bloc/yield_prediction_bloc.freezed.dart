// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yield_prediction_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$YieldPredictionEvent {

 YieldEstimationRequestModel get data;
/// Create a copy of YieldPredictionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YieldPredictionEventCopyWith<YieldPredictionEvent> get copyWith => _$YieldPredictionEventCopyWithImpl<YieldPredictionEvent>(this as YieldPredictionEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YieldPredictionEvent&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'YieldPredictionEvent(data: $data)';
}


}

/// @nodoc
abstract mixin class $YieldPredictionEventCopyWith<$Res>  {
  factory $YieldPredictionEventCopyWith(YieldPredictionEvent value, $Res Function(YieldPredictionEvent) _then) = _$YieldPredictionEventCopyWithImpl;
@useResult
$Res call({
 YieldEstimationRequestModel data
});




}
/// @nodoc
class _$YieldPredictionEventCopyWithImpl<$Res>
    implements $YieldPredictionEventCopyWith<$Res> {
  _$YieldPredictionEventCopyWithImpl(this._self, this._then);

  final YieldPredictionEvent _self;
  final $Res Function(YieldPredictionEvent) _then;

/// Create a copy of YieldPredictionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as YieldEstimationRequestModel,
  ));
}

}


/// Adds pattern-matching-related methods to [YieldPredictionEvent].
extension YieldPredictionEventPatterns on YieldPredictionEvent {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( YieldEstimationRequestModel data)?  started,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( YieldEstimationRequestModel data)  started,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( YieldEstimationRequestModel data)?  started,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements YieldPredictionEvent {
  const _Started({required this.data});
  

@override final  YieldEstimationRequestModel data;

/// Create a copy of YieldPredictionEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'YieldPredictionEvent.started(data: $data)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $YieldPredictionEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@override @useResult
$Res call({
 YieldEstimationRequestModel data
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of YieldPredictionEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_Started(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as YieldEstimationRequestModel,
  ));
}


}

/// @nodoc
mixin _$YieldPredictionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YieldPredictionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'YieldPredictionState()';
}


}

/// @nodoc
class $YieldPredictionStateCopyWith<$Res>  {
$YieldPredictionStateCopyWith(YieldPredictionState _, $Res Function(YieldPredictionState) __);
}


/// Adds pattern-matching-related methods to [YieldPredictionState].
extension YieldPredictionStatePatterns on YieldPredictionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( LoadingYieldPredictionState value)?  loading,TResult Function( LoadedYieldPredictionState value)?  loaded,TResult Function( ErrorYieldPredictionState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoadingYieldPredictionState() when loading != null:
return loading(_that);case LoadedYieldPredictionState() when loaded != null:
return loaded(_that);case ErrorYieldPredictionState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( LoadingYieldPredictionState value)  loading,required TResult Function( LoadedYieldPredictionState value)  loaded,required TResult Function( ErrorYieldPredictionState value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case LoadingYieldPredictionState():
return loading(_that);case LoadedYieldPredictionState():
return loaded(_that);case ErrorYieldPredictionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( LoadingYieldPredictionState value)?  loading,TResult? Function( LoadedYieldPredictionState value)?  loaded,TResult? Function( ErrorYieldPredictionState value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoadingYieldPredictionState() when loading != null:
return loading(_that);case LoadedYieldPredictionState() when loaded != null:
return loaded(_that);case ErrorYieldPredictionState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( YieldEstimationResponseModel data)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoadingYieldPredictionState() when loading != null:
return loading();case LoadedYieldPredictionState() when loaded != null:
return loaded(_that.data);case ErrorYieldPredictionState() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( YieldEstimationResponseModel data)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case LoadingYieldPredictionState():
return loading();case LoadedYieldPredictionState():
return loaded(_that.data);case ErrorYieldPredictionState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( YieldEstimationResponseModel data)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoadingYieldPredictionState() when loading != null:
return loading();case LoadedYieldPredictionState() when loaded != null:
return loaded(_that.data);case ErrorYieldPredictionState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements YieldPredictionState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'YieldPredictionState.initial()';
}


}




/// @nodoc


class LoadingYieldPredictionState implements YieldPredictionState {
  const LoadingYieldPredictionState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingYieldPredictionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'YieldPredictionState.loading()';
}


}




/// @nodoc


class LoadedYieldPredictionState implements YieldPredictionState {
  const LoadedYieldPredictionState({required this.data});
  

 final  YieldEstimationResponseModel data;

/// Create a copy of YieldPredictionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedYieldPredictionStateCopyWith<LoadedYieldPredictionState> get copyWith => _$LoadedYieldPredictionStateCopyWithImpl<LoadedYieldPredictionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedYieldPredictionState&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'YieldPredictionState.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $LoadedYieldPredictionStateCopyWith<$Res> implements $YieldPredictionStateCopyWith<$Res> {
  factory $LoadedYieldPredictionStateCopyWith(LoadedYieldPredictionState value, $Res Function(LoadedYieldPredictionState) _then) = _$LoadedYieldPredictionStateCopyWithImpl;
@useResult
$Res call({
 YieldEstimationResponseModel data
});




}
/// @nodoc
class _$LoadedYieldPredictionStateCopyWithImpl<$Res>
    implements $LoadedYieldPredictionStateCopyWith<$Res> {
  _$LoadedYieldPredictionStateCopyWithImpl(this._self, this._then);

  final LoadedYieldPredictionState _self;
  final $Res Function(LoadedYieldPredictionState) _then;

/// Create a copy of YieldPredictionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(LoadedYieldPredictionState(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as YieldEstimationResponseModel,
  ));
}


}

/// @nodoc


class ErrorYieldPredictionState implements YieldPredictionState {
  const ErrorYieldPredictionState({required this.message});
  

 final  String message;

/// Create a copy of YieldPredictionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorYieldPredictionStateCopyWith<ErrorYieldPredictionState> get copyWith => _$ErrorYieldPredictionStateCopyWithImpl<ErrorYieldPredictionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorYieldPredictionState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'YieldPredictionState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorYieldPredictionStateCopyWith<$Res> implements $YieldPredictionStateCopyWith<$Res> {
  factory $ErrorYieldPredictionStateCopyWith(ErrorYieldPredictionState value, $Res Function(ErrorYieldPredictionState) _then) = _$ErrorYieldPredictionStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorYieldPredictionStateCopyWithImpl<$Res>
    implements $ErrorYieldPredictionStateCopyWith<$Res> {
  _$ErrorYieldPredictionStateCopyWithImpl(this._self, this._then);

  final ErrorYieldPredictionState _self;
  final $Res Function(ErrorYieldPredictionState) _then;

/// Create a copy of YieldPredictionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorYieldPredictionState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
