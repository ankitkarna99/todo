import 'package:dio/dio.dart';

class DioService {
  final Dio dio = Dio();

  DioService() {
    dio.options.baseUrl = "https://jsonplaceholder.typicode.com";
    //Other stuffs like interceptors should be added here
  }
}
