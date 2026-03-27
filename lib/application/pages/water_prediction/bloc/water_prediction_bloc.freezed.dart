// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'water_prediction_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WaterPredictionEvent {

 SmartIrrigationRequestModel get data;
/// Create a copy of WaterPredictionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterPredictionEventCopyWith<WaterPredictionEvent> get copyWith => _$WaterPredictionEventCopyWithImpl<WaterPredictionEvent>(this as WaterPredictionEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterPredictionEvent&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'WaterPredictionEvent(data: $data)';
}


}

/// @nodoc
abstract mixin class $WaterPredictionEventCopyWith<$Res>  {
  factory $WaterPredictionEventCopyWith(WaterPredictionEvent value, $Res Function(WaterPredictionEvent) _then) = _$WaterPredictionEventCopyWithImpl;
@useResult
$Res call({
 SmartIrrigationRequestModel data
});




}
/// @nodoc
class _$WaterPredictionEventCopyWithImpl<$Res>
    implements $WaterPredictionEventCopyWith<$Res> {
  _$WaterPredictionEventCopyWithImpl(this._self, this._then);

  final WaterPredictionEvent _self;
  final $Res Function(WaterPredictionEvent) _then;

/// Create a copy of WaterPredictionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SmartIrrigationRequestModel,
  ));
}

}


/// Adds pattern-matching-related methods to [WaterPredictionEvent].
extension WaterPredictionEventPatterns on WaterPredictionEvent {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( SmartIrrigationRequestModel data)?  started,required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( SmartIrrigationRequestModel data)  started,}) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( SmartIrrigationRequestModel data)?  started,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements WaterPredictionEvent {
  const _Started({required this.data});
  

@override final  SmartIrrigationRequestModel data;

/// Create a copy of WaterPredictionEvent
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
  return 'WaterPredictionEvent.started(data: $data)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $WaterPredictionEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@override @useResult
$Res call({
 SmartIrrigationRequestModel data
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of WaterPredictionEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_Started(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SmartIrrigationRequestModel,
  ));
}


}

/// @nodoc
mixin _$WaterPredictionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterPredictionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WaterPredictionState()';
}


}

/// @nodoc
class $WaterPredictionStateCopyWith<$Res>  {
$WaterPredictionStateCopyWith(WaterPredictionState _, $Res Function(WaterPredictionState) __);
}


/// Adds pattern-matching-related methods to [WaterPredictionState].
extension WaterPredictionStatePatterns on WaterPredictionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( LoadingWaterPredictionState value)?  loading,TResult Function( LoadedWaterPredictionState value)?  loaded,TResult Function( ErrorWaterPredictionState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoadingWaterPredictionState() when loading != null:
return loading(_that);case LoadedWaterPredictionState() when loaded != null:
return loaded(_that);case ErrorWaterPredictionState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( LoadingWaterPredictionState value)  loading,required TResult Function( LoadedWaterPredictionState value)  loaded,required TResult Function( ErrorWaterPredictionState value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case LoadingWaterPredictionState():
return loading(_that);case LoadedWaterPredictionState():
return loaded(_that);case ErrorWaterPredictionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( LoadingWaterPredictionState value)?  loading,TResult? Function( LoadedWaterPredictionState value)?  loaded,TResult? Function( ErrorWaterPredictionState value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoadingWaterPredictionState() when loading != null:
return loading(_that);case LoadedWaterPredictionState() when loaded != null:
return loaded(_that);case ErrorWaterPredictionState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( SmartIrrigationResponseModel data)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoadingWaterPredictionState() when loading != null:
return loading();case LoadedWaterPredictionState() when loaded != null:
return loaded(_that.data);case ErrorWaterPredictionState() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( SmartIrrigationResponseModel data)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case LoadingWaterPredictionState():
return loading();case LoadedWaterPredictionState():
return loaded(_that.data);case ErrorWaterPredictionState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( SmartIrrigationResponseModel data)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoadingWaterPredictionState() when loading != null:
return loading();case LoadedWaterPredictionState() when loaded != null:
return loaded(_that.data);case ErrorWaterPredictionState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements WaterPredictionState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WaterPredictionState.initial()';
}


}




/// @nodoc


class LoadingWaterPredictionState implements WaterPredictionState {
  const LoadingWaterPredictionState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingWaterPredictionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WaterPredictionState.loading()';
}


}




/// @nodoc


class LoadedWaterPredictionState implements WaterPredictionState {
  const LoadedWaterPredictionState({required this.data});
  

 final  SmartIrrigationResponseModel data;

/// Create a copy of WaterPredictionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedWaterPredictionStateCopyWith<LoadedWaterPredictionState> get copyWith => _$LoadedWaterPredictionStateCopyWithImpl<LoadedWaterPredictionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedWaterPredictionState&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'WaterPredictionState.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $LoadedWaterPredictionStateCopyWith<$Res> implements $WaterPredictionStateCopyWith<$Res> {
  factory $LoadedWaterPredictionStateCopyWith(LoadedWaterPredictionState value, $Res Function(LoadedWaterPredictionState) _then) = _$LoadedWaterPredictionStateCopyWithImpl;
@useResult
$Res call({
 SmartIrrigationResponseModel data
});




}
/// @nodoc
class _$LoadedWaterPredictionStateCopyWithImpl<$Res>
    implements $LoadedWaterPredictionStateCopyWith<$Res> {
  _$LoadedWaterPredictionStateCopyWithImpl(this._self, this._then);

  final LoadedWaterPredictionState _self;
  final $Res Function(LoadedWaterPredictionState) _then;

/// Create a copy of WaterPredictionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(LoadedWaterPredictionState(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SmartIrrigationResponseModel,
  ));
}


}

/// @nodoc


class ErrorWaterPredictionState implements WaterPredictionState {
  const ErrorWaterPredictionState({required this.message});
  

 final  String message;

/// Create a copy of WaterPredictionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorWaterPredictionStateCopyWith<ErrorWaterPredictionState> get copyWith => _$ErrorWaterPredictionStateCopyWithImpl<ErrorWaterPredictionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorWaterPredictionState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'WaterPredictionState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorWaterPredictionStateCopyWith<$Res> implements $WaterPredictionStateCopyWith<$Res> {
  factory $ErrorWaterPredictionStateCopyWith(ErrorWaterPredictionState value, $Res Function(ErrorWaterPredictionState) _then) = _$ErrorWaterPredictionStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorWaterPredictionStateCopyWithImpl<$Res>
    implements $ErrorWaterPredictionStateCopyWith<$Res> {
  _$ErrorWaterPredictionStateCopyWithImpl(this._self, this._then);

  final ErrorWaterPredictionState _self;
  final $Res Function(ErrorWaterPredictionState) _then;

/// Create a copy of WaterPredictionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorWaterPredictionState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
