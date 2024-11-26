import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient {
  final Dio dio;

  ApiClient._(this.dio);

  static Future<ApiClient> create() async {
    try {
      await dotenv.load(fileName: ".env");
    } catch (e) {
      throw Exception("Failed to load .env file: $e");
    }

    final dio = Dio();

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final apiKey = dotenv.env['API_KEY'];

          if (apiKey != null) {
            options.queryParameters['apiKey'] = apiKey;
          } else {
            throw Exception('API key not found in .env file');
          }

          return handler.next(options);
        },
      ),
    );

    return ApiClient._(dio);
  }
}
