import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  Map<String, String> headers = {};

  final JsonDecoder _decoder = const JsonDecoder();

  static const _baseUrl = "YOUR_API_URL";

  Future<dynamic> post(String endpoint,
      {Map<String, String> headers, body, encoding}) {
        
    body = {};

    Map<String, String> requestHeaders = {
      "Content-type": "application/json; charset=UTF-8",
      "Accept": "application/json",
      "X-Auth-Token": "",
    };

    return http
        .post(Uri.parse(_baseUrl + endpoint),
            body: json.encode(body),
            headers: requestHeaders,
            encoding: encoding)
        .then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw Exception("Error while fetching data");
      }

      return _decoder.convert(response.body); // convert == decode
    }, onError: (error) {
      throw Exception(error.toString());
    });
  }
}
