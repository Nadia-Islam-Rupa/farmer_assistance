// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crop_disease_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CropDiseaseEvent {

 File get imageFile;
/// Create a copy of CropDiseaseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CropDiseaseEventCopyWith<CropDiseaseEvent> get copyWith => _$CropDiseaseEventCopyWithImpl<CropDiseaseEvent>(this as CropDiseaseEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CropDiseaseEvent&&(identical(other.imageFile, imageFile) || other.imageFile == imageFile));
}


@override
int get hashCode => Object.hash(runtimeType,imageFile);

@override
String toString() {
  return 'CropDiseaseEvent(imageFile: $imageFile)';
}


}

/// @nodoc
abstract mixin class $CropDiseaseEventCopyWith<$Res>  {
  factory $CropDiseaseEventCopyWith(CropDiseaseEvent value, $Res Function(CropDiseaseEvent) _then) = _$CropDiseaseEventCopyWithImpl;
@useResult
$Res call({
 File imageFile
});




}
/// @nodoc
class _$CropDiseaseEventCopyWithImpl<$Res>
    implements $CropDiseaseEventCopyWith<$Res> {
  _$CropDiseaseEventCopyWithImpl(this._self, this._then);

  final CropDiseaseEvent _self;
  final $Res Function(CropDiseaseEvent) _then;

/// Create a copy of CropDiseaseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? imageFile = null,}) {
  return _then(_self.copyWith(
imageFile: null == imageFile ? _self.imageFile : imageFile // ignore: cast_nullable_to_non_nullable
as File,
  ));
}

}


/// Adds pattern-matching-related methods to [CropDiseaseEvent].
extension CropDiseaseEventPatterns on CropDiseaseEvent {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( File imageFile)?  started,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.imageFile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( File imageFile)  started,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.imageFile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( File imageFile)?  started,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.imageFile);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements CropDiseaseEvent {
  const _Started({required this.imageFile});
  

@override final  File imageFile;

/// Create a copy of CropDiseaseEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.imageFile, imageFile) || other.imageFile == imageFile));
}


@override
int get hashCode => Object.hash(runtimeType,imageFile);

@override
String toString() {
  return 'CropDiseaseEvent.started(imageFile: $imageFile)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $CropDiseaseEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@override @useResult
$Res call({
 File imageFile
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of CropDiseaseEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imageFile = null,}) {
  return _then(_Started(
imageFile: null == imageFile ? _self.imageFile : imageFile // ignore: cast_nullable_to_non_nullable
as File,
  ));
}


}

/// @nodoc
mixin _$CropDiseaseState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CropDiseaseState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CropDiseaseState()';
}


}

/// @nodoc
class $CropDiseaseStateCopyWith<$Res>  {
$CropDiseaseStateCopyWith(CropDiseaseState _, $Res Function(CropDiseaseState) __);
}


/// Adds pattern-matching-related methods to [CropDiseaseState].
extension CropDiseaseStatePatterns on CropDiseaseState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( LoadingCropDiseaseState value)?  loading,TResult Function( LoadedCropDiseaseState value)?  loaded,TResult Function( ErrorCropDiseaseState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoadingCropDiseaseState() when loading != null:
return loading(_that);case LoadedCropDiseaseState() when loaded != null:
return loaded(_that);case ErrorCropDiseaseState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( LoadingCropDiseaseState value)  loading,required TResult Function( LoadedCropDiseaseState value)  loaded,required TResult Function( ErrorCropDiseaseState value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case LoadingCropDiseaseState():
return loading(_that);case LoadedCropDiseaseState():
return loaded(_that);case ErrorCropDiseaseState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( LoadingCropDiseaseState value)?  loading,TResult? Function( LoadedCropDiseaseState value)?  loaded,TResult? Function( ErrorCropDiseaseState value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoadingCropDiseaseState() when loading != null:
return loading(_that);case LoadedCropDiseaseState() when loaded != null:
return loaded(_that);case ErrorCropDiseaseState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( CropDiseaseModel cropDiseaseModel)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoadingCropDiseaseState() when loading != null:
return loading();case LoadedCropDiseaseState() when loaded != null:
return loaded(_that.cropDiseaseModel);case ErrorCropDiseaseState() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( CropDiseaseModel cropDiseaseModel)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case LoadingCropDiseaseState():
return loading();case LoadedCropDiseaseState():
return loaded(_that.cropDiseaseModel);case ErrorCropDiseaseState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( CropDiseaseModel cropDiseaseModel)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoadingCropDiseaseState() when loading != null:
return loading();case LoadedCropDiseaseState() when loaded != null:
return loaded(_that.cropDiseaseModel);case ErrorCropDiseaseState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CropDiseaseState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CropDiseaseState.initial()';
}


}




/// @nodoc


class LoadingCropDiseaseState implements CropDiseaseState {
  const LoadingCropDiseaseState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingCropDiseaseState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CropDiseaseState.loading()';
}


}




/// @nodoc


class LoadedCropDiseaseState implements CropDiseaseState {
  const LoadedCropDiseaseState(this.cropDiseaseModel);
  

 final  CropDiseaseModel cropDiseaseModel;

/// Create a copy of CropDiseaseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCropDiseaseStateCopyWith<LoadedCropDiseaseState> get copyWith => _$LoadedCropDiseaseStateCopyWithImpl<LoadedCropDiseaseState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedCropDiseaseState&&(identical(other.cropDiseaseModel, cropDiseaseModel) || other.cropDiseaseModel == cropDiseaseModel));
}


@override
int get hashCode => Object.hash(runtimeType,cropDiseaseModel);

@override
String toString() {
  return 'CropDiseaseState.loaded(cropDiseaseModel: $cropDiseaseModel)';
}


}

/// @nodoc
abstract mixin class $LoadedCropDiseaseStateCopyWith<$Res> implements $CropDiseaseStateCopyWith<$Res> {
  factory $LoadedCropDiseaseStateCopyWith(LoadedCropDiseaseState value, $Res Function(LoadedCropDiseaseState) _then) = _$LoadedCropDiseaseStateCopyWithImpl;
@useResult
$Res call({
 CropDiseaseModel cropDiseaseModel
});




}
/// @nodoc
class _$LoadedCropDiseaseStateCopyWithImpl<$Res>
    implements $LoadedCropDiseaseStateCopyWith<$Res> {
  _$LoadedCropDiseaseStateCopyWithImpl(this._self, this._then);

  final LoadedCropDiseaseState _self;
  final $Res Function(LoadedCropDiseaseState) _then;

/// Create a copy of CropDiseaseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cropDiseaseModel = null,}) {
  return _then(LoadedCropDiseaseState(
null == cropDiseaseModel ? _self.cropDiseaseModel : cropDiseaseModel // ignore: cast_nullable_to_non_nullable
as CropDiseaseModel,
  ));
}


}

/// @nodoc


class ErrorCropDiseaseState implements CropDiseaseState {
  const ErrorCropDiseaseState(this.message);
  

 final  String message;

/// Create a copy of CropDiseaseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCropDiseaseStateCopyWith<ErrorCropDiseaseState> get copyWith => _$ErrorCropDiseaseStateCopyWithImpl<ErrorCropDiseaseState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorCropDiseaseState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CropDiseaseState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCropDiseaseStateCopyWith<$Res> implements $CropDiseaseStateCopyWith<$Res> {
  factory $ErrorCropDiseaseStateCopyWith(ErrorCropDiseaseState value, $Res Function(ErrorCropDiseaseState) _then) = _$ErrorCropDiseaseStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCropDiseaseStateCopyWithImpl<$Res>
    implements $ErrorCropDiseaseStateCopyWith<$Res> {
  _$ErrorCropDiseaseStateCopyWithImpl(this._self, this._then);

  final ErrorCropDiseaseState _self;
  final $Res Function(ErrorCropDiseaseState) _then;

/// Create a copy of CropDiseaseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorCropDiseaseState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
