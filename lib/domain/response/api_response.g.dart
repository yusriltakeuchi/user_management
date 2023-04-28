// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_APIResponse _$$_APIResponseFromJson(Map<String, dynamic> json) =>
    _$_APIResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$_APIResponseToJson(_$_APIResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
