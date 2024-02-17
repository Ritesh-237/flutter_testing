import 'package:dummy/models/get_news_response.dart';
import 'package:dummy/repository/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mapper/auth_mapp.dart';

class MockAuthRepository extends Mock implements AuthRepository {
  @override
  Future<bool> loginUser(String username, String password) {
    return Future.value(true);
  }

  @override
  Future<GetNewsResponse> getNews() async {
    final response = await getNewsMapper();
    return Future.value(response);
  }
}
