import 'package:dummy/models/get_news_response.dart';

import '../responses/auth_responses.dart';

Future<GetNewsResponse> getNewsMapper() {
  return Future.value(GetNewsResponse.fromJson(getNewsResponse));
}
