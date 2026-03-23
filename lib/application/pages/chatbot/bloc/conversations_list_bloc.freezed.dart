// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversations_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConversationsListEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationsListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationsListEvent()';
}


}

/// @nodoc
class $ConversationsListEventCopyWith<$Res>  {
$ConversationsListEventCopyWith(ConversationsListEvent _, $Res Function(ConversationsListEvent) __);
}


/// Adds pattern-matching-related methods to [ConversationsListEvent].
extension ConversationsListEventPatterns on ConversationsListEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadConversations value)?  loadConversations,TResult Function( _RefreshConversations value)?  refreshConversations,TResult Function( _DeleteConversation value)?  deleteConversation,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadConversations() when loadConversations != null:
return loadConversations(_that);case _RefreshConversations() when refreshConversations != null:
return refreshConversations(_that);case _DeleteConversation() when deleteConversation != null:
return deleteConversation(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadConversations value)  loadConversations,required TResult Function( _RefreshConversations value)  refreshConversations,required TResult Function( _DeleteConversation value)  deleteConversation,}){
final _that = this;
switch (_that) {
case _LoadConversations():
return loadConversations(_that);case _RefreshConversations():
return refreshConversations(_that);case _DeleteConversation():
return deleteConversation(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadConversations value)?  loadConversations,TResult? Function( _RefreshConversations value)?  refreshConversations,TResult? Function( _DeleteConversation value)?  deleteConversation,}){
final _that = this;
switch (_that) {
case _LoadConversations() when loadConversations != null:
return loadConversations(_that);case _RefreshConversations() when refreshConversations != null:
return refreshConversations(_that);case _DeleteConversation() when deleteConversation != null:
return deleteConversation(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int limit)?  loadConversations,TResult Function( int limit)?  refreshConversations,TResult Function( String conversationId)?  deleteConversation,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadConversations() when loadConversations != null:
return loadConversations(_that.limit);case _RefreshConversations() when refreshConversations != null:
return refreshConversations(_that.limit);case _DeleteConversation() when deleteConversation != null:
return deleteConversation(_that.conversationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int limit)  loadConversations,required TResult Function( int limit)  refreshConversations,required TResult Function( String conversationId)  deleteConversation,}) {final _that = this;
switch (_that) {
case _LoadConversations():
return loadConversations(_that.limit);case _RefreshConversations():
return refreshConversations(_that.limit);case _DeleteConversation():
return deleteConversation(_that.conversationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int limit)?  loadConversations,TResult? Function( int limit)?  refreshConversations,TResult? Function( String conversationId)?  deleteConversation,}) {final _that = this;
switch (_that) {
case _LoadConversations() when loadConversations != null:
return loadConversations(_that.limit);case _RefreshConversations() when refreshConversations != null:
return refreshConversations(_that.limit);case _DeleteConversation() when deleteConversation != null:
return deleteConversation(_that.conversationId);case _:
  return null;

}
}

}

/// @nodoc


class _LoadConversations implements ConversationsListEvent {
  const _LoadConversations({this.limit = 20});
  

@JsonKey() final  int limit;

/// Create a copy of ConversationsListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadConversationsCopyWith<_LoadConversations> get copyWith => __$LoadConversationsCopyWithImpl<_LoadConversations>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadConversations&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,limit);

@override
String toString() {
  return 'ConversationsListEvent.loadConversations(limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$LoadConversationsCopyWith<$Res> implements $ConversationsListEventCopyWith<$Res> {
  factory _$LoadConversationsCopyWith(_LoadConversations value, $Res Function(_LoadConversations) _then) = __$LoadConversationsCopyWithImpl;
@useResult
$Res call({
 int limit
});




}
/// @nodoc
class __$LoadConversationsCopyWithImpl<$Res>
    implements _$LoadConversationsCopyWith<$Res> {
  __$LoadConversationsCopyWithImpl(this._self, this._then);

  final _LoadConversations _self;
  final $Res Function(_LoadConversations) _then;

/// Create a copy of ConversationsListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? limit = null,}) {
  return _then(_LoadConversations(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _RefreshConversations implements ConversationsListEvent {
  const _RefreshConversations({this.limit = 20});
  

@JsonKey() final  int limit;

/// Create a copy of ConversationsListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshConversationsCopyWith<_RefreshConversations> get copyWith => __$RefreshConversationsCopyWithImpl<_RefreshConversations>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshConversations&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,limit);

@override
String toString() {
  return 'ConversationsListEvent.refreshConversations(limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$RefreshConversationsCopyWith<$Res> implements $ConversationsListEventCopyWith<$Res> {
  factory _$RefreshConversationsCopyWith(_RefreshConversations value, $Res Function(_RefreshConversations) _then) = __$RefreshConversationsCopyWithImpl;
@useResult
$Res call({
 int limit
});




}
/// @nodoc
class __$RefreshConversationsCopyWithImpl<$Res>
    implements _$RefreshConversationsCopyWith<$Res> {
  __$RefreshConversationsCopyWithImpl(this._self, this._then);

  final _RefreshConversations _self;
  final $Res Function(_RefreshConversations) _then;

/// Create a copy of ConversationsListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? limit = null,}) {
  return _then(_RefreshConversations(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _DeleteConversation implements ConversationsListEvent {
  const _DeleteConversation({required this.conversationId});
  

 final  String conversationId;

/// Create a copy of ConversationsListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteConversationCopyWith<_DeleteConversation> get copyWith => __$DeleteConversationCopyWithImpl<_DeleteConversation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteConversation&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId));
}


@override
int get hashCode => Object.hash(runtimeType,conversationId);

@override
String toString() {
  return 'ConversationsListEvent.deleteConversation(conversationId: $conversationId)';
}


}

/// @nodoc
abstract mixin class _$DeleteConversationCopyWith<$Res> implements $ConversationsListEventCopyWith<$Res> {
  factory _$DeleteConversationCopyWith(_DeleteConversation value, $Res Function(_DeleteConversation) _then) = __$DeleteConversationCopyWithImpl;
@useResult
$Res call({
 String conversationId
});




}
/// @nodoc
class __$DeleteConversationCopyWithImpl<$Res>
    implements _$DeleteConversationCopyWith<$Res> {
  __$DeleteConversationCopyWithImpl(this._self, this._then);

  final _DeleteConversation _self;
  final $Res Function(_DeleteConversation) _then;

/// Create a copy of ConversationsListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversationId = null,}) {
  return _then(_DeleteConversation(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ConversationsListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationsListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationsListState()';
}


}

/// @nodoc
class $ConversationsListStateCopyWith<$Res>  {
$ConversationsListStateCopyWith(ConversationsListState _, $Res Function(ConversationsListState) __);
}


/// Adds pattern-matching-related methods to [ConversationsListState].
extension ConversationsListStatePatterns on ConversationsListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ConversationItem> conversations)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.conversations);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ConversationItem> conversations)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.conversations);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ConversationItem> conversations)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.conversations);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ConversationsListState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationsListState.initial()';
}


}




/// @nodoc


class _Loading implements ConversationsListState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationsListState.loading()';
}


}




/// @nodoc


class _Loaded implements ConversationsListState {
  const _Loaded({required final  List<ConversationItem> conversations}): _conversations = conversations;
  

 final  List<ConversationItem> _conversations;
 List<ConversationItem> get conversations {
  if (_conversations is EqualUnmodifiableListView) return _conversations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conversations);
}


/// Create a copy of ConversationsListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._conversations, _conversations));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_conversations));

@override
String toString() {
  return 'ConversationsListState.loaded(conversations: $conversations)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $ConversationsListStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<ConversationItem> conversations
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of ConversationsListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversations = null,}) {
  return _then(_Loaded(
conversations: null == conversations ? _self._conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<ConversationItem>,
  ));
}


}

/// @nodoc


class _Error implements ConversationsListState {
  const _Error({required this.message});
  

 final  String message;

/// Create a copy of ConversationsListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ConversationsListState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $ConversationsListStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of ConversationsListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
