// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_prediction_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PricePredictionEvent {

 PricePredictionRequestModel get data;
/// Create a copy of PricePredictionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PricePredictionEventCopyWith<PricePredictionEvent> get copyWith => _$PricePredictionEventCopyWithImpl<PricePredictionEvent>(this as PricePredictionEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PricePredictionEvent&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'PricePredictionEvent(data: $data)';
}


}

/// @nodoc
abstract mixin class $PricePredictionEventCopyWith<$Res>  {
  factory $PricePredictionEventCopyWith(PricePredictionEvent value, $Res Function(PricePredictionEvent) _then) = _$PricePredictionEventCopyWithImpl;
@useResult
$Res call({
 PricePredictionRequestModel data
});




}
/// @nodoc
class _$PricePredictionEventCopyWithImpl<$Res>
    implements $PricePredictionEventCopyWith<$Res> {
  _$PricePredictionEventCopyWithImpl(this._self, this._then);

  final PricePredictionEvent _self;
  final $Res Function(PricePredictionEvent) _then;

/// Create a copy of PricePredictionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PricePredictionRequestModel,
  ));
}

}


/// Adds pattern-matching-related methods to [PricePredictionEvent].
extension PricePredictionEventPatterns on PricePredictionEvent {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( PricePredictionRequestModel data)?  started,required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( PricePredictionRequestModel data)  started,}) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( PricePredictionRequestModel data)?  started,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements PricePredictionEvent {
  const _Started({required this.data});
  

@override final  PricePredictionRequestModel data;

/// Create a copy of PricePredictionEvent
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
  return 'PricePredictionEvent.started(data: $data)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $PricePredictionEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@override @useResult
$Res call({
 PricePredictionRequestModel data
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of PricePredictionEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_Started(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PricePredictionRequestModel,
  ));
}


}

/// @nodoc
mixin _$PricePredictionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PricePredictionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PricePredictionState()';
}


}

/// @nodoc
class $PricePredictionStateCopyWith<$Res>  {
$PricePredictionStateCopyWith(PricePredictionState _, $Res Function(PricePredictionState) __);
}


/// Adds pattern-matching-related methods to [PricePredictionState].
extension PricePredictionStatePatterns on PricePredictionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( LoadingPricePredictionState value)?  loading,TResult Function( LoadedPricePredictionState value)?  loaded,TResult Function( ErrorPricePredictionState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoadingPricePredictionState() when loading != null:
return loading(_that);case LoadedPricePredictionState() when loaded != null:
return loaded(_that);case ErrorPricePredictionState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( LoadingPricePredictionState value)  loading,required TResult Function( LoadedPricePredictionState value)  loaded,required TResult Function( ErrorPricePredictionState value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case LoadingPricePredictionState():
return loading(_that);case LoadedPricePredictionState():
return loaded(_that);case ErrorPricePredictionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( LoadingPricePredictionState value)?  loading,TResult? Function( LoadedPricePredictionState value)?  loaded,TResult? Function( ErrorPricePredictionState value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoadingPricePredictionState() when loading != null:
return loading(_that);case LoadedPricePredictionState() when loaded != null:
return loaded(_that);case ErrorPricePredictionState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( PricePredictionResponseModel data)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoadingPricePredictionState() when loading != null:
return loading();case LoadedPricePredictionState() when loaded != null:
return loaded(_that.data);case ErrorPricePredictionState() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( PricePredictionResponseModel data)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case LoadingPricePredictionState():
return loading();case LoadedPricePredictionState():
return loaded(_that.data);case ErrorPricePredictionState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( PricePredictionResponseModel data)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoadingPricePredictionState() when loading != null:
return loading();case LoadedPricePredictionState() when loaded != null:
return loaded(_that.data);case ErrorPricePredictionState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements PricePredictionState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PricePredictionState.initial()';
}


}




/// @nodoc


class LoadingPricePredictionState implements PricePredictionState {
  const LoadingPricePredictionState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingPricePredictionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PricePredictionState.loading()';
}


}




/// @nodoc


class LoadedPricePredictionState implements PricePredictionState {
  const LoadedPricePredictionState({required this.data});
  

 final  PricePredictionResponseModel data;

/// Create a copy of PricePredictionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedPricePredictionStateCopyWith<LoadedPricePredictionState> get copyWith => _$LoadedPricePredictionStateCopyWithImpl<LoadedPricePredictionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedPricePredictionState&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'PricePredictionState.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $LoadedPricePredictionStateCopyWith<$Res> implements $PricePredictionStateCopyWith<$Res> {
  factory $LoadedPricePredictionStateCopyWith(LoadedPricePredictionState value, $Res Function(LoadedPricePredictionState) _then) = _$LoadedPricePredictionStateCopyWithImpl;
@useResult
$Res call({
 PricePredictionResponseModel data
});




}
/// @nodoc
class _$LoadedPricePredictionStateCopyWithImpl<$Res>
    implements $LoadedPricePredictionStateCopyWith<$Res> {
  _$LoadedPricePredictionStateCopyWithImpl(this._self, this._then);

  final LoadedPricePredictionState _self;
  final $Res Function(LoadedPricePredictionState) _then;

/// Create a copy of PricePredictionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(LoadedPricePredictionState(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PricePredictionResponseModel,
  ));
}


}

/// @nodoc


class ErrorPricePredictionState implements PricePredictionState {
  const ErrorPricePredictionState({required this.message});
  

 final  String message;

/// Create a copy of PricePredictionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorPricePredictionStateCopyWith<ErrorPricePredictionState> get copyWith => _$ErrorPricePredictionStateCopyWithImpl<ErrorPricePredictionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorPricePredictionState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PricePredictionState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorPricePredictionStateCopyWith<$Res> implements $PricePredictionStateCopyWith<$Res> {
  factory $ErrorPricePredictionStateCopyWith(ErrorPricePredictionState value, $Res Function(ErrorPricePredictionState) _then) = _$ErrorPricePredictionStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorPricePredictionStateCopyWithImpl<$Res>
    implements $ErrorPricePredictionStateCopyWith<$Res> {
  _$ErrorPricePredictionStateCopyWithImpl(this._self, this._then);

  final ErrorPricePredictionState _self;
  final $Res Function(ErrorPricePredictionState) _then;

/// Create a copy of PricePredictionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorPricePredictionState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
