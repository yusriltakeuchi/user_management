// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

APIResponse _$APIResponseFromJson(Map<String, dynamic> json) {
  return _APIResponse.fromJson(json);
}

/// @nodoc
mixin _$APIResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $APIResponseCopyWith<APIResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $APIResponseCopyWith<$Res> {
  factory $APIResponseCopyWith(
          APIResponse value, $Res Function(APIResponse) then) =
      _$APIResponseCopyWithImpl<$Res, APIResponse>;
  @useResult
  $Res call({bool success, String message, Map<String, dynamic>? data});
}

/// @nodoc
class _$APIResponseCopyWithImpl<$Res, $Val extends APIResponse>
    implements $APIResponseCopyWith<$Res> {
  _$APIResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_APIResponseCopyWith<$Res>
    implements $APIResponseCopyWith<$Res> {
  factory _$$_APIResponseCopyWith(
          _$_APIResponse value, $Res Function(_$_APIResponse) then) =
      __$$_APIResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, Map<String, dynamic>? data});
}

/// @nodoc
class __$$_APIResponseCopyWithImpl<$Res>
    extends _$APIResponseCopyWithImpl<$Res, _$_APIResponse>
    implements _$$_APIResponseCopyWith<$Res> {
  __$$_APIResponseCopyWithImpl(
      _$_APIResponse _value, $Res Function(_$_APIResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$_APIResponse(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_APIResponse extends _APIResponse {
  _$_APIResponse(
      {required this.success,
      required this.message,
      final Map<String, dynamic>? data})
      : _data = data,
        super._();

  factory _$_APIResponse.fromJson(Map<String, dynamic> json) =>
      _$$_APIResponseFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'APIResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_APIResponse &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, message,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_APIResponseCopyWith<_$_APIResponse> get copyWith =>
      __$$_APIResponseCopyWithImpl<_$_APIResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_APIResponseToJson(
      this,
    );
  }
}

abstract class _APIResponse extends APIResponse {
  factory _APIResponse(
      {required final bool success,
      required final String message,
      final Map<String, dynamic>? data}) = _$_APIResponse;
  _APIResponse._() : super._();

  factory _APIResponse.fromJson(Map<String, dynamic> json) =
      _$_APIResponse.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  Map<String, dynamic>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_APIResponseCopyWith<_$_APIResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
