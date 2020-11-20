import 'package:http/http.dart' as http;
import 'dart:convert';

class API {
  Future<dynamic> get(
      dynamic url, Map<String, String> credentials) async {
    http.Response response = await http.get(url, headers: credentials);
    var reply = json.decode(response.body);
    return reply;
  }

  Future<Map<String, dynamic>> post(String url, Map<String, dynamic> payload,
      Map<String, String> credentials) async {
    Map<String, dynamic> reply = Map<String, dynamic>();
    http.Response response =
        await http.post(url, body: payload, headers: credentials);
    reply = json.decode(response.body);
    return reply;
  }
}
