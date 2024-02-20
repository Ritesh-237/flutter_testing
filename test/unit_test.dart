import 'package:dummy/models/get_news_response.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mapper/auth_mapp.dart';
import 'repository/mock_auth_respository.dart';

// * *  Debugging
// * *  Use logInvocations and throwOnMissingStub:

// Print all collected invocations of any mock methods of a list of mock objects:
//* *  logInvocations([catOne, catTwo]);

//  Throw every time that a mock method is called without a stub being matched:
// * * throwOnMissingStub(cat)

// * thenReturned can't return stream or future, use instead thenAnswers for future and stream

// * flutter pub add http dev:mockito dev:build_runner

void main() {
  // TestWidgetsFlutterBinding.ensureInitialized();
  // WidgetsFlutterBinding.ensureInitialized();

  late MockAuthRepository mockAuthRepository;

  // register a function before test
  setUp(() {
    mockAuthRepository = MockAuthRepository();
  });
  // register a function after test
  // tearDown(() {});

  group('Auth Repository', () {
    test('Login User Successful', () async {
      // expect(await mockAuthRepository.loginUser('abhishek@gmail.com', '123456'),
      //     true);
    });
    test('Login User Stubing value', () async {
      final result =
          await mockAuthRepository.loginUser('abhishek@gmail.com', '12345');

      expect(result, true);
    });
    test('Get News Successful', () async {
      final model = await getNewsMapper();
      // when(await mockAuthRepository.getNews()).thenAnswer((_) {
      //   return model;
      // });
      final response = await mockAuthRepository.getNews();
      // type matching
      expect(response, isA<GetNewsResponse>());
      // response matching with the equatable package
      expect(model, response);
    });

    // test('Get News Exception', () async {
    //   when(mockAuthRepository.getNews()).thenAnswer((_) {
    //     throw Exception();
    //   });
    //   final result = await mockAuthRepository.getNews();
    //   expect(result, throwsException);
    // });
  });

  group('Counter start, increment and decrement test', () {
    test('Initial Counter value', () {
      final counter = Counter();

      expect(counter.value, 0);
    });

    test('Increment test', () {
      final counter = Counter();
      counter.increment();

      expect(counter.value, 1);
    });

    test('Decrement test', () {
      final counter = Counter();
      counter.decrement();
      expect(counter.value, -1);
    });
  });
}

class Counter {
  int value = 0;

  int increment() {
    return value++;
  }

  int decrement() {
    return value--;
  }
}
