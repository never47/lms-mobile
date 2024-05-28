import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lms_mobile/constants/api.dart';

class NetworkManager {
  static final NetworkManager _instance = NetworkManager._internal();

  factory NetworkManager() {
    return _instance;
  }

  NetworkManager._internal();

  Map<String, String> headers = {
    "content-type": "application/json",
  };
  List<String> cookies = [];

  void _updateCookies(http.Response response) {
    String? allSetCookie = response.headers['set-cookie'];
    if (allSetCookie != null) {
      allSetCookie.split(',').forEach((String cookie) {
        cookies.add(cookie);
      });
    }
  }

  String _formatCookies() {
    return cookies.join('; ');
  }

  Future<http.Response> login(Map<String, Object> data) async {
    String jsonData = jsonEncode(data);
    http.Response response = await http.post(Uri.parse(Api.session),
        body: jsonData, headers: headers);
    //cookieee = response.headers['set-cookie'];
    _updateCookies(response);
    return response;
  }

  Future<http.Response> getStudentCard() async {
    Map<String, String> headersWithCookies = Map.from(headers);
    print(_formatCookies());
    headersWithCookies["Cookie"] = _formatCookies();

    print(headersWithCookies);

    print("123123");

    http.Response response = await http.post(
      Uri.parse(Api.studenCard),
      body: "1",
      headers: headersWithCookies,
    );

    return response;
  }
}
