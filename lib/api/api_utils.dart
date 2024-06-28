import 'package:dio/dio.dart';

const title = "ApiUtils";
ApiUtils apiUtils = ApiUtils();

class ApiUtils {
  static final ApiUtils _apiUtils = ApiUtils._i();
  final Dio _dio = Dio();

  ApiUtils._i();
  factory ApiUtils() {
    return _apiUtils;
  }

  Future<Response> get({
    required String url,
    required FormData data,
    Options? options,
  }) async {
    var result = await _dio.get(
      url,
      data: data,
      options: options,
    );
    return result;
  }

  Future<Response> getWithToken({
    required String url,
    Map<String, dynamic>? queryParameters,
    Options? options,
    String? accessToken,
  }) async {
    var result = await _dio.get(
      url,
      queryParameters: queryParameters,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken",
          'accept': 'application/json',
        },
      ),
    );
    return result;
  }

  Future<Response> post({
    required String url,
    data,
    String? accessToken,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers,
  }) async {
    var result = await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
    return result;
  }

  Future<Response> postWithoutToken({
    required String url,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    var result = await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    return result;
  }

  Future<Response> postWithProgress({
    required String url,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
  }) async {
    //
    var result = await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
      onSendProgress: onSendProgress,
    );
    return result;
  }

  Future<Response> put({
    required String url,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    required Map<String, dynamic>? headers,
  }) async {
    var result = await _dio.put(url,
        data: data, queryParameters: queryParameters, options: options);
    return result;
  }

  Future<Response> delete({
    required String api,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    var result = await _dio.delete(
      api,
      queryParameters: queryParameters,
      options: options,
    );
    return result;
  }
}
