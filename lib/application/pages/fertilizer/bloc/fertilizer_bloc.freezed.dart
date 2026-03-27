// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fertilizer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FertilizerEvent {

 FertilizerTipsRequestModel get data;
/// Create a copy of FertilizerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FertilizerEventCopyWith<FertilizerEvent> get copyWith => _$FertilizerEventCopyWithImpl<FertilizerEvent>(this as FertilizerEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FertilizerEvent&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'FertilizerEvent(data: $data)';
}


}

/// @nodoc
abstract mixin class $FertilizerEventCopyWith<$Res>  {
  factory $FertilizerEventCopyWith(FertilizerEvent value, $Res Function(FertilizerEvent) _then) = _$FertilizerEventCopyWithImpl;
@useResult
$Res call({
 FertilizerTipsRequestModel data
});




}
/// @nodoc
class _$FertilizerEventCopyWithImpl<$Res>
    implements $FertilizerEventCopyWith<$Res> {
  _$FertilizerEventCopyWithImpl(this._self, this._then);

  final FertilizerEvent _self;
  final $Res Function(FertilizerEvent) _then;

/// Create a copy of FertilizerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as FertilizerTipsRequestModel,
  ));
}

}


/// Adds pattern-matching-related methods to [FertilizerEvent].
extension FertilizerEventPatterns on FertilizerEvent {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( FertilizerTipsRequestModel data)?  started,required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( FertilizerTipsRequestModel data)  started,}) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( FertilizerTipsRequestModel data)?  started,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements FertilizerEvent {
  const _Started({required this.data});
  

@override final  FertilizerTipsRequestModel data;

/// Create a copy of FertilizerEvent
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
  return 'FertilizerEvent.started(data: $data)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $FertilizerEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@override @useResult
$Res call({
 FertilizerTipsRequestModel data
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of FertilizerEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_Started(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as FertilizerTipsRequestModel,
  ));
}


}

/// @nodoc
mixin _$FertilizerState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FertilizerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FertilizerState()';
}


}

/// @nodoc
class $FertilizerStateCopyWith<$Res>  {
$FertilizerStateCopyWith(FertilizerState _, $Res Function(FertilizerState) __);
}


/// Adds pattern-matching-related methods to [FertilizerState].
extension FertilizerStatePatterns on FertilizerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( LoadingFertilizerState value)?  loading,TResult Function( LoadedFertilizerState value)?  loaded,TResult Function( ErrorFertilizerState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoadingFertilizerState() when loading != null:
return loading(_that);case LoadedFertilizerState() when loaded != null:
return loaded(_that);case ErrorFertilizerState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( LoadingFertilizerState value)  loading,required TResult Function( LoadedFertilizerState value)  loaded,required TResult Function( ErrorFertilizerState value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case LoadingFertilizerState():
return loading(_that);case LoadedFertilizerState():
return loaded(_that);case ErrorFertilizerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( LoadingFertilizerState value)?  loading,TResult? Function( LoadedFertilizerState value)?  loaded,TResult? Function( ErrorFertilizerState value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoadingFertilizerState() when loading != null:
return loading(_that);case LoadedFertilizerState() when loaded != null:
return loaded(_that);case ErrorFertilizerState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( FertilizerTipsResponseModel data)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoadingFertilizerState() when loading != null:
return loading();case LoadedFertilizerState() when loaded != null:
return loaded(_that.data);case ErrorFertilizerState() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( FertilizerTipsResponseModel data)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case LoadingFertilizerState():
return loading();case LoadedFertilizerState():
return loaded(_that.data);case ErrorFertilizerState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( FertilizerTipsResponseModel data)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoadingFertilizerState() when loading != null:
return loading();case LoadedFertilizerState() when loaded != null:
return loaded(_that.data);case ErrorFertilizerState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements FertilizerState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FertilizerState.initial()';
}


}




/// @nodoc


class LoadingFertilizerState implements FertilizerState {
  const LoadingFertilizerState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingFertilizerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FertilizerState.loading()';
}


}




/// @nodoc


class LoadedFertilizerState implements FertilizerState {
  const LoadedFertilizerState({required this.data});
  

 final  FertilizerTipsResponseModel data;

/// Create a copy of FertilizerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedFertilizerStateCopyWith<LoadedFertilizerState> get copyWith => _$LoadedFertilizerStateCopyWithImpl<LoadedFertilizerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedFertilizerState&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'FertilizerState.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $LoadedFertilizerStateCopyWith<$Res> implements $FertilizerStateCopyWith<$Res> {
  factory $LoadedFertilizerStateCopyWith(LoadedFertilizerState value, $Res Function(LoadedFertilizerState) _then) = _$LoadedFertilizerStateCopyWithImpl;
@useResult
$Res call({
 FertilizerTipsResponseModel data
});




}
/// @nodoc
class _$LoadedFertilizerStateCopyWithImpl<$Res>
    implements $LoadedFertilizerStateCopyWith<$Res> {
  _$LoadedFertilizerStateCopyWithImpl(this._self, this._then);

  final LoadedFertilizerState _self;
  final $Res Function(LoadedFertilizerState) _then;

/// Create a copy of FertilizerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(LoadedFertilizerState(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as FertilizerTipsResponseModel,
  ));
}


}

/// @nodoc


class ErrorFertilizerState implements FertilizerState {
  const ErrorFertilizerState({required this.message});
  

 final  String message;

/// Create a copy of FertilizerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorFertilizerStateCopyWith<ErrorFertilizerState> get copyWith => _$ErrorFertilizerStateCopyWithImpl<ErrorFertilizerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorFertilizerState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'FertilizerState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorFertilizerStateCopyWith<$Res> implements $FertilizerStateCopyWith<$Res> {
  factory $ErrorFertilizerStateCopyWith(ErrorFertilizerState value, $Res Function(ErrorFertilizerState) _then) = _$ErrorFertilizerStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorFertilizerStateCopyWithImpl<$Res>
    implements $ErrorFertilizerStateCopyWith<$Res> {
  _$ErrorFertilizerStateCopyWithImpl(this._self, this._then);

  final ErrorFertilizerState _self;
  final $Res Function(ErrorFertilizerState) _then;

/// Create a copy of FertilizerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorFertilizerState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
