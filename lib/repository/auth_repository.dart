import 'package:dio/dio.dart';

import '../models/get_news_response.dart';

abstract class AuthRepository {
  Future<bool> loginUser(String username, String password);
  Future<GetNewsResponse> getNews();
}

class AuthRepositoryImpl implements AuthRepository {
  Dio dio = Dio();
  AuthRepositoryImpl();

  @override
  Future<bool> loginUser(String username, String password) async {
    try {
      final result = await dio.get('path');
      if (result.statusCode != 200) {
        return false;
      }
    } on DioException catch (e) {
      print(e.message);
      return false;
    }
    return true;
  }

  @override
  Future<GetNewsResponse> getNews() async {
    try {
      final result = await dio.get('https://api.example.com/users/1');
      return GetNewsResponse.fromJson(result.data);
    } on DioException catch (e) {
      throw NetworkException(errorMessage: e.toString());
    }
  }
}

class NetworkException implements Exception {
  final String? statusCode;
  final String errorMessage;

  NetworkException({required this.errorMessage, this.statusCode});
}
