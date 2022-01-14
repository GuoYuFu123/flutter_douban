import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpRequest {
  final baseUrl;
  HttpRequest(this.baseUrl);

  //get
  Future<dynamic> get(String uri, {Map<String, String> headers}) async {
    try {
      http.Response response = await http.get(baseUrl + uri, headers: headers);
      final statusCode = response.statusCode;
      final body = response.body;
      var result = jsonDecode(body);
      print('[uri=$uri][statusCode=$statusCode][response=$body]');
      return result;
    } on Exception catch (e) {
      print('[uri=$uri]exception e=${e.toString()}');
    }
  }
}
