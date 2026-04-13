// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crop_recommendation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CropRecommendationEvent {

 CropRecommendationRequestModel get cropRecommendationRequestModel;
/// Create a copy of CropRecommendationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CropRecommendationEventCopyWith<CropRecommendationEvent> get copyWith => _$CropRecommendationEventCopyWithImpl<CropRecommendationEvent>(this as CropRecommendationEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CropRecommendationEvent&&(identical(other.cropRecommendationRequestModel, cropRecommendationRequestModel) || other.cropRecommendationRequestModel == cropRecommendationRequestModel));
}


@override
int get hashCode => Object.hash(runtimeType,cropRecommendationRequestModel);

@override
String toString() {
  return 'CropRecommendationEvent(cropRecommendationRequestModel: $cropRecommendationRequestModel)';
}


}

/// @nodoc
abstract mixin class $CropRecommendationEventCopyWith<$Res>  {
  factory $CropRecommendationEventCopyWith(CropRecommendationEvent value, $Res Function(CropRecommendationEvent) _then) = _$CropRecommendationEventCopyWithImpl;
@useResult
$Res call({
 CropRecommendationRequestModel cropRecommendationRequestModel
});




}
/// @nodoc
class _$CropRecommendationEventCopyWithImpl<$Res>
    implements $CropRecommendationEventCopyWith<$Res> {
  _$CropRecommendationEventCopyWithImpl(this._self, this._then);

  final CropRecommendationEvent _self;
  final $Res Function(CropRecommendationEvent) _then;

/// Create a copy of CropRecommendationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cropRecommendationRequestModel = null,}) {
  return _then(_self.copyWith(
cropRecommendationRequestModel: null == cropRecommendationRequestModel ? _self.cropRecommendationRequestModel : cropRecommendationRequestModel // ignore: cast_nullable_to_non_nullable
as CropRecommendationRequestModel,
  ));
}

}


/// Adds pattern-matching-related methods to [CropRecommendationEvent].
extension CropRecommendationEventPatterns on CropRecommendationEvent {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( CropRecommendationRequestModel cropRecommendationRequestModel)?  started,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.cropRecommendationRequestModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( CropRecommendationRequestModel cropRecommendationRequestModel)  started,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.cropRecommendationRequestModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( CropRecommendationRequestModel cropRecommendationRequestModel)?  started,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.cropRecommendationRequestModel);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements CropRecommendationEvent {
  const _Started({required this.cropRecommendationRequestModel});
  

@override final  CropRecommendationRequestModel cropRecommendationRequestModel;

/// Create a copy of CropRecommendationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.cropRecommendationRequestModel, cropRecommendationRequestModel) || other.cropRecommendationRequestModel == cropRecommendationRequestModel));
}


@override
int get hashCode => Object.hash(runtimeType,cropRecommendationRequestModel);

@override
String toString() {
  return 'CropRecommendationEvent.started(cropRecommendationRequestModel: $cropRecommendationRequestModel)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $CropRecommendationEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@override @useResult
$Res call({
 CropRecommendationRequestModel cropRecommendationRequestModel
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of CropRecommendationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cropRecommendationRequestModel = null,}) {
  return _then(_Started(
cropRecommendationRequestModel: null == cropRecommendationRequestModel ? _self.cropRecommendationRequestModel : cropRecommendationRequestModel // ignore: cast_nullable_to_non_nullable
as CropRecommendationRequestModel,
  ));
}


}

/// @nodoc
mixin _$CropRecommendationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CropRecommendationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CropRecommendationState()';
}


}

/// @nodoc
class $CropRecommendationStateCopyWith<$Res>  {
$CropRecommendationStateCopyWith(CropRecommendationState _, $Res Function(CropRecommendationState) __);
}


/// Adds pattern-matching-related methods to [CropRecommendationState].
extension CropRecommendationStatePatterns on CropRecommendationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( LoadingCropRecommendationState value)?  loading,TResult Function( LoadedCropRecommendationState value)?  loaded,TResult Function( ErrorCropRecommendationState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoadingCropRecommendationState() when loading != null:
return loading(_that);case LoadedCropRecommendationState() when loaded != null:
return loaded(_that);case ErrorCropRecommendationState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( LoadingCropRecommendationState value)  loading,required TResult Function( LoadedCropRecommendationState value)  loaded,required TResult Function( ErrorCropRecommendationState value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case LoadingCropRecommendationState():
return loading(_that);case LoadedCropRecommendationState():
return loaded(_that);case ErrorCropRecommendationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( LoadingCropRecommendationState value)?  loading,TResult? Function( LoadedCropRecommendationState value)?  loaded,TResult? Function( ErrorCropRecommendationState value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoadingCropRecommendationState() when loading != null:
return loading(_that);case LoadedCropRecommendationState() when loaded != null:
return loaded(_that);case ErrorCropRecommendationState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( CropRecommendationResponseModel data)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoadingCropRecommendationState() when loading != null:
return loading();case LoadedCropRecommendationState() when loaded != null:
return loaded(_that.data);case ErrorCropRecommendationState() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( CropRecommendationResponseModel data)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case LoadingCropRecommendationState():
return loading();case LoadedCropRecommendationState():
return loaded(_that.data);case ErrorCropRecommendationState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( CropRecommendationResponseModel data)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoadingCropRecommendationState() when loading != null:
return loading();case LoadedCropRecommendationState() when loaded != null:
return loaded(_that.data);case ErrorCropRecommendationState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CropRecommendationState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CropRecommendationState.initial()';
}


}




/// @nodoc


class LoadingCropRecommendationState implements CropRecommendationState {
  const LoadingCropRecommendationState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingCropRecommendationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CropRecommendationState.loading()';
}


}




/// @nodoc


class LoadedCropRecommendationState implements CropRecommendationState {
  const LoadedCropRecommendationState({required this.data});
  

 final  CropRecommendationResponseModel data;

/// Create a copy of CropRecommendationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCropRecommendationStateCopyWith<LoadedCropRecommendationState> get copyWith => _$LoadedCropRecommendationStateCopyWithImpl<LoadedCropRecommendationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedCropRecommendationState&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'CropRecommendationState.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $LoadedCropRecommendationStateCopyWith<$Res> implements $CropRecommendationStateCopyWith<$Res> {
  factory $LoadedCropRecommendationStateCopyWith(LoadedCropRecommendationState value, $Res Function(LoadedCropRecommendationState) _then) = _$LoadedCropRecommendationStateCopyWithImpl;
@useResult
$Res call({
 CropRecommendationResponseModel data
});




}
/// @nodoc
class _$LoadedCropRecommendationStateCopyWithImpl<$Res>
    implements $LoadedCropRecommendationStateCopyWith<$Res> {
  _$LoadedCropRecommendationStateCopyWithImpl(this._self, this._then);

  final LoadedCropRecommendationState _self;
  final $Res Function(LoadedCropRecommendationState) _then;

/// Create a copy of CropRecommendationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(LoadedCropRecommendationState(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CropRecommendationResponseModel,
  ));
}


}

/// @nodoc


class ErrorCropRecommendationState implements CropRecommendationState {
  const ErrorCropRecommendationState({required this.message});
  

 final  String message;

/// Create a copy of CropRecommendationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCropRecommendationStateCopyWith<ErrorCropRecommendationState> get copyWith => _$ErrorCropRecommendationStateCopyWithImpl<ErrorCropRecommendationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorCropRecommendationState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CropRecommendationState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCropRecommendationStateCopyWith<$Res> implements $CropRecommendationStateCopyWith<$Res> {
  factory $ErrorCropRecommendationStateCopyWith(ErrorCropRecommendationState value, $Res Function(ErrorCropRecommendationState) _then) = _$ErrorCropRecommendationStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCropRecommendationStateCopyWithImpl<$Res>
    implements $ErrorCropRecommendationStateCopyWith<$Res> {
  _$ErrorCropRecommendationStateCopyWithImpl(this._self, this._then);

  final ErrorCropRecommendationState _self;
  final $Res Function(ErrorCropRecommendationState) _then;

/// Create a copy of CropRecommendationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorCropRecommendationState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
