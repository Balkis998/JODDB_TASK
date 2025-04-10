import 'package:dio/dio.dart';

class ApiService {
  static const String _baseUrl = 'https://kmmattend.baladia.gov.kw/api/v1/';

  final Dio _dio;

  ApiService(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 120), // Timeout for connecting
      receiveTimeout: const Duration(seconds: 120), // Timeout for receiving
      sendTimeout: const Duration(seconds: 120), // Timeout for sending
    );
  }

  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? headers,
  }) async {
    var response = await _dio.get(
      '$_baseUrl$endPoint',
      options: Options(headers: headers),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    Object? data,
    required Map<String, dynamic>? headers,
  }) async {
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      data: data,
      options: Options(headers: headers),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> put({
    required String endPoint,
    Object? data,
    required Map<String, dynamic>? headers,
  }) async {
    var response = await _dio.put(
      '$_baseUrl$endPoint',
      data: data,
      options: Options(headers: headers),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> patch({
    required String endPoint,
    required Map<String, dynamic>? headers,
  }) async {
    var response = await _dio.patch(
      '$_baseUrl$endPoint',
      options: Options(headers: headers),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> delete({
    required String endPoint,
    required Map<String, dynamic>? headers,
  }) async {
    var response = await _dio.delete(
      '$_baseUrl$endPoint',
      options: Options(headers: headers),
    );
    return response.data;
  }
}
