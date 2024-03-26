import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

import 'package:lms_mobile/constants/api.dart';

class NetworkManager {
  NetworkManager() {
    BaseOptions options = BaseOptions(
      headers: {"Accept": "application/json"},
      followRedirects: false,
    );
    _dio = Dio(options)..interceptors.add(CookieManager(CookieJar()));
  }

  late Dio _dio;
  final CookieJar cookieJar = CookieJar(ignoreExpires: true);

  Future<Response> login(Map<String, Object> data) async {
    Response respone = await _dio.post(Api.session, data: data);
    print(respone.headers['set-cookie']);
    return respone;
  }

  Future<Response> getStudentCard() async {
    // Получаем установленные куки из CookieManager
    List<Cookie> cookies = await (_dio.interceptors
            .firstWhere((element) => element is CookieManager) as CookieManager)
        .cookieJar
        .loadForRequest(Uri.parse(Api.session));

    print("_____________________________________________________");

    print(cookies);

    print("_____________________________________________________");
    // Выводим информацию о куках
    cookies.forEach((cookie) {
      print('Name: ${cookie.name}, Value: ${cookie.value}');
    });
    print("_____________________________________________________");
    return _dio.post(Api.student_card, data: "1");
  }
}
