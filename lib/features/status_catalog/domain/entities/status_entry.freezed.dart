// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StatusEntry {

 int get code; String get title; StatusCategory get category; String get description; String get imageUrl; String? get docUrl;
/// Create a copy of StatusEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatusEntryCopyWith<StatusEntry> get copyWith => _$StatusEntryCopyWithImpl<StatusEntry>(this as StatusEntry, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatusEntry&&(identical(other.code, code) || other.code == code)&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.docUrl, docUrl) || other.docUrl == docUrl));
}


@override
int get hashCode => Object.hash(runtimeType,code,title,category,description,imageUrl,docUrl);

@override
String toString() {
  return 'StatusEntry(code: $code, title: $title, category: $category, description: $description, imageUrl: $imageUrl, docUrl: $docUrl)';
}


}

/// @nodoc
abstract mixin class $StatusEntryCopyWith<$Res>  {
  factory $StatusEntryCopyWith(StatusEntry value, $Res Function(StatusEntry) _then) = _$StatusEntryCopyWithImpl;
@useResult
$Res call({
 int code, String title, StatusCategory category, String description, String imageUrl, String? docUrl
});




}
/// @nodoc
class _$StatusEntryCopyWithImpl<$Res>
    implements $StatusEntryCopyWith<$Res> {
  _$StatusEntryCopyWithImpl(this._self, this._then);

  final StatusEntry _self;
  final $Res Function(StatusEntry) _then;

/// Create a copy of StatusEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? title = null,Object? category = null,Object? description = null,Object? imageUrl = null,Object? docUrl = freezed,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as StatusCategory,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,docUrl: freezed == docUrl ? _self.docUrl : docUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StatusEntry].
extension StatusEntryPatterns on StatusEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatusEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatusEntry() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatusEntry value)  $default,){
final _that = this;
switch (_that) {
case _StatusEntry():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatusEntry value)?  $default,){
final _that = this;
switch (_that) {
case _StatusEntry() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int code,  String title,  StatusCategory category,  String description,  String imageUrl,  String? docUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatusEntry() when $default != null:
return $default(_that.code,_that.title,_that.category,_that.description,_that.imageUrl,_that.docUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int code,  String title,  StatusCategory category,  String description,  String imageUrl,  String? docUrl)  $default,) {final _that = this;
switch (_that) {
case _StatusEntry():
return $default(_that.code,_that.title,_that.category,_that.description,_that.imageUrl,_that.docUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int code,  String title,  StatusCategory category,  String description,  String imageUrl,  String? docUrl)?  $default,) {final _that = this;
switch (_that) {
case _StatusEntry() when $default != null:
return $default(_that.code,_that.title,_that.category,_that.description,_that.imageUrl,_that.docUrl);case _:
  return null;

}
}

}

/// @nodoc


class _StatusEntry implements StatusEntry {
  const _StatusEntry({required this.code, required this.title, required this.category, required this.description, required this.imageUrl, this.docUrl});
  

@override final  int code;
@override final  String title;
@override final  StatusCategory category;
@override final  String description;
@override final  String imageUrl;
@override final  String? docUrl;

/// Create a copy of StatusEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatusEntryCopyWith<_StatusEntry> get copyWith => __$StatusEntryCopyWithImpl<_StatusEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusEntry&&(identical(other.code, code) || other.code == code)&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.docUrl, docUrl) || other.docUrl == docUrl));
}


@override
int get hashCode => Object.hash(runtimeType,code,title,category,description,imageUrl,docUrl);

@override
String toString() {
  return 'StatusEntry(code: $code, title: $title, category: $category, description: $description, imageUrl: $imageUrl, docUrl: $docUrl)';
}


}

/// @nodoc
abstract mixin class _$StatusEntryCopyWith<$Res> implements $StatusEntryCopyWith<$Res> {
  factory _$StatusEntryCopyWith(_StatusEntry value, $Res Function(_StatusEntry) _then) = __$StatusEntryCopyWithImpl;
@override @useResult
$Res call({
 int code, String title, StatusCategory category, String description, String imageUrl, String? docUrl
});




}
/// @nodoc
class __$StatusEntryCopyWithImpl<$Res>
    implements _$StatusEntryCopyWith<$Res> {
  __$StatusEntryCopyWithImpl(this._self, this._then);

  final _StatusEntry _self;
  final $Res Function(_StatusEntry) _then;

/// Create a copy of StatusEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? title = null,Object? category = null,Object? description = null,Object? imageUrl = null,Object? docUrl = freezed,}) {
  return _then(_StatusEntry(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as StatusCategory,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,docUrl: freezed == docUrl ? _self.docUrl : docUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
