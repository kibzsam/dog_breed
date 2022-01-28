import 'package:dio/dio.dart';

import 'DioClient.dart';

class NetworkClient {
  NetworkClient(this.appUrl);

  final String? appUrl;
  final Dio _dio = Dio();
  DioClient get dogDetails => DioClient(appUrl, _dio);
  static String baseUrl(NetworkClient networkClient) => networkClient.appUrl!;
}
