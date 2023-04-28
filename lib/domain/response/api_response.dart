
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_response.freezed.dart';
part 'api_response.g.dart';

@freezed
class APIResponse with _$APIResponse {
  factory APIResponse({
    required bool success,
    required String message,
    Map<String, dynamic>? data,
  }) = _APIResponse;
  const APIResponse._();

  factory APIResponse.fromJson(Map<String, dynamic> json) => _$APIResponseFromJson(json);
  factory APIResponse.failure(String message, int statusCode) {
    return APIResponse(
      success: false,
      message: message,
      data: null,
    );
  }
} 