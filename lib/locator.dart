import 'package:dummy/repository/dio.dart';
import 'package:dummy/repository/interceptor.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.instance;
setUp() {
  getIt.registerLazySingleton<DioFactory>(
      () => DioFactory('baseUrl', AppendTimestampInterceptor()));
}
