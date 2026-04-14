// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent()';
}


}

/// @nodoc
class $ProfileEventCopyWith<$Res>  {
$ProfileEventCopyWith(ProfileEvent _, $Res Function(ProfileEvent) __);
}


/// Adds pattern-matching-related methods to [ProfileEvent].
extension ProfileEventPatterns on ProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchProfileInfo value)?  fetchProfileInfo,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchProfileInfo() when fetchProfileInfo != null:
return fetchProfileInfo(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchProfileInfo value)  fetchProfileInfo,}){
final _that = this;
switch (_that) {
case _FetchProfileInfo():
return fetchProfileInfo(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchProfileInfo value)?  fetchProfileInfo,}){
final _that = this;
switch (_that) {
case _FetchProfileInfo() when fetchProfileInfo != null:
return fetchProfileInfo(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchProfileInfo,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchProfileInfo() when fetchProfileInfo != null:
return fetchProfileInfo();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchProfileInfo,}) {final _that = this;
switch (_that) {
case _FetchProfileInfo():
return fetchProfileInfo();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchProfileInfo,}) {final _that = this;
switch (_that) {
case _FetchProfileInfo() when fetchProfileInfo != null:
return fetchProfileInfo();case _:
  return null;

}
}

}

/// @nodoc


class _FetchProfileInfo implements ProfileEvent {
  const _FetchProfileInfo();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchProfileInfo);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.fetchProfileInfo()';
}


}




/// @nodoc
mixin _$ProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState()';
}


}

/// @nodoc
class $ProfileStateCopyWith<$Res>  {
$ProfileStateCopyWith(ProfileState _, $Res Function(ProfileState) __);
}


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( LoadingProfileInfoState value)?  loading,TResult Function( LoadedProfileInfoState value)?  loaded,TResult Function( ErrorProfileInfoState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoadingProfileInfoState() when loading != null:
return loading(_that);case LoadedProfileInfoState() when loaded != null:
return loaded(_that);case ErrorProfileInfoState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( LoadingProfileInfoState value)  loading,required TResult Function( LoadedProfileInfoState value)  loaded,required TResult Function( ErrorProfileInfoState value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case LoadingProfileInfoState():
return loading(_that);case LoadedProfileInfoState():
return loaded(_that);case ErrorProfileInfoState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( LoadingProfileInfoState value)?  loading,TResult? Function( LoadedProfileInfoState value)?  loaded,TResult? Function( ErrorProfileInfoState value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoadingProfileInfoState() when loading != null:
return loading(_that);case LoadedProfileInfoState() when loaded != null:
return loaded(_that);case ErrorProfileInfoState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( UserModel userModel)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoadingProfileInfoState() when loading != null:
return loading();case LoadedProfileInfoState() when loaded != null:
return loaded(_that.userModel);case ErrorProfileInfoState() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( UserModel userModel)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case LoadingProfileInfoState():
return loading();case LoadedProfileInfoState():
return loaded(_that.userModel);case ErrorProfileInfoState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( UserModel userModel)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoadingProfileInfoState() when loading != null:
return loading();case LoadedProfileInfoState() when loaded != null:
return loaded(_that.userModel);case ErrorProfileInfoState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ProfileState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.initial()';
}


}




/// @nodoc


class LoadingProfileInfoState implements ProfileState {
  const LoadingProfileInfoState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingProfileInfoState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.loading()';
}


}




/// @nodoc


class LoadedProfileInfoState implements ProfileState {
  const LoadedProfileInfoState({required this.userModel});
  

 final  UserModel userModel;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedProfileInfoStateCopyWith<LoadedProfileInfoState> get copyWith => _$LoadedProfileInfoStateCopyWithImpl<LoadedProfileInfoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedProfileInfoState&&(identical(other.userModel, userModel) || other.userModel == userModel));
}


@override
int get hashCode => Object.hash(runtimeType,userModel);

@override
String toString() {
  return 'ProfileState.loaded(userModel: $userModel)';
}


}

/// @nodoc
abstract mixin class $LoadedProfileInfoStateCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $LoadedProfileInfoStateCopyWith(LoadedProfileInfoState value, $Res Function(LoadedProfileInfoState) _then) = _$LoadedProfileInfoStateCopyWithImpl;
@useResult
$Res call({
 UserModel userModel
});




}
/// @nodoc
class _$LoadedProfileInfoStateCopyWithImpl<$Res>
    implements $LoadedProfileInfoStateCopyWith<$Res> {
  _$LoadedProfileInfoStateCopyWithImpl(this._self, this._then);

  final LoadedProfileInfoState _self;
  final $Res Function(LoadedProfileInfoState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userModel = null,}) {
  return _then(LoadedProfileInfoState(
userModel: null == userModel ? _self.userModel : userModel // ignore: cast_nullable_to_non_nullable
as UserModel,
  ));
}


}

/// @nodoc


class ErrorProfileInfoState implements ProfileState {
  const ErrorProfileInfoState({required this.message});
  

 final  String message;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorProfileInfoStateCopyWith<ErrorProfileInfoState> get copyWith => _$ErrorProfileInfoStateCopyWithImpl<ErrorProfileInfoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorProfileInfoState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProfileState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorProfileInfoStateCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $ErrorProfileInfoStateCopyWith(ErrorProfileInfoState value, $Res Function(ErrorProfileInfoState) _then) = _$ErrorProfileInfoStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorProfileInfoStateCopyWithImpl<$Res>
    implements $ErrorProfileInfoStateCopyWith<$Res> {
  _$ErrorProfileInfoStateCopyWithImpl(this._self, this._then);

  final ErrorProfileInfoState _self;
  final $Res Function(ErrorProfileInfoState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorProfileInfoState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
