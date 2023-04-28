
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:user_management/domain/response/api_response.dart';
import 'package:user_management/infrastructure/services/base/api.dart';
import 'package:user_management/infrastructure/services/base/base_api_impl.dart';


class BaseAPI implements BaseAPIImpl {
  Dio? _dio;
  final endpoint = Api();

  /// Initialize constructors
  BaseAPI() {
    _dio = Dio();
    /// Only show logging in debug mode
    if (kDebugMode) {
      _dio?.interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        logPrint: (object) => debugPrint(object.toString(), wrapWidth: 1024),
      ));
    }
  }
  Future<Options> _getHeaders({bool? useToken, bool? useFormData = false}) async {
    var header = <String, dynamic>{};
    header['Accept'] = 'application/json';
    header['Content-Type'] = useFormData == true ? 'multipart/form-data' : 'application/json';
    if (useToken == true) {
      // final authUtils = locator<AuthUtils>();
      // final token = await authUtils.getToken();
      // header['Authorization'] = "Bearer $token";
    }
    return Options(
      headers: header,
      sendTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60)
    );
  }

  @override
  Future<APIResponse> delete(String url, {Map<String, dynamic>? param, bool? useToken}) async {
    try {
      final result = await _dio?.delete(
        url,
        options: await _getHeaders(useToken: useToken),
        queryParameters: param
      );
      return _parseResponse(result);
    } on DioError catch(e) {
      validateUnauthorized(e.response?.statusCode, url);
      return APIResponse.failure(e.response?.data['message'] ?? e.response?.data['error'] ?? e.message, e.response?.statusCode ?? 0);
    }
  }

  @override
  Future<APIResponse> get(String url, {Map<String, dynamic>? param, bool? useToken, CancelToken? cancelToken}) async {
    try {
      final result = await _dio?.get(
        url,
        options: await _getHeaders(useToken: useToken),
        queryParameters: param,
        cancelToken: cancelToken
      );
      return _parseResponse(result);
    } on DioError catch(e) {
      validateUnauthorized(e.response?.statusCode, url);
      return APIResponse.failure(e.response?.data['message'] ?? e.response?.data['error'] ?? e.message, e.response?.statusCode ?? 0);
    }
  }

  @override
  Future<APIResponse> post(String url, {Map<String, dynamic>? param, data, bool? useToken, bool useFormData = true}) async {
    try {
      final result = await _dio?.post(
        url,
        options: await _getHeaders(useToken: useToken, useFormData: useFormData),
        data: data != null ? (useFormData ? FormData.fromMap(data) : data) : null,
        queryParameters: param
      );
      return _parseResponse(result);
    } on DioError catch(e) {
      validateUnauthorized(e.response?.statusCode, url);
      return APIResponse.failure(e.response?.data['message'] ?? e.response?.data['error'] ?? e.message, e.response?.statusCode ?? 0);
    }
  }

  @override
  Future<APIResponse> put(String url, {Map<String, dynamic>? param, data, bool? useToken}) async {
    try {
      final result = await _dio?.put(
        url,
        options: await _getHeaders(useToken: useToken),
        data: data,
        queryParameters: param
      );
      return _parseResponse(result);
    } on DioError catch(e) {
      validateUnauthorized(e.response?.statusCode, url);
      return APIResponse.failure(e.response?.data['message'] ?? e.response?.data['error'] ?? e.message, e.response?.statusCode ?? 0);
    }
  }

  void validateUnauthorized(int? statusCode, String url) async {
    debugPrint("REQUEST FAIL: $statusCode, URL: $url");
    /// Check token expired.
    /// If invalid or expired it will navigate back to login
    if (statusCode == 401){
      // locator<AuthUtils>().clearSession();
      // navigate.pushToRemoveUntil(routeLogin);
    }
  }
  
  Future<APIResponse> _parseResponse(Response? response) async {
    if ([401, 404, 403].contains(response?.statusCode)) {
      validateUnauthorized(response?.statusCode, response?.realUri.toString() ?? "");
      return APIResponse.failure(response?.data['message'] ?? response?.data['error_msg'], response?.statusCode ?? 0);
    }

    return APIResponse.fromJson(
      {
        'success': response?.data['success'] ?? false,
        'data': response?.data,
        'message': response?.data['message'] ?? (response?.data['error_msg'] ?? response?.statusMessage) ?? "",
      },
    );
  }
}