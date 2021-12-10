import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';

class HttpClient {
  HttpClient({required this.baseUrl});

  final String baseUrl;

  late final _dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 5000,
    receiveTimeout: 5000,
  ))
    ..interceptors.add(dioLoggerInterceptor);

  Future<T> getJson<T>(String endpoint) async {
    final response = await _dio.get<dynamic>(endpoint);
    return response.data as T;
  }
}
