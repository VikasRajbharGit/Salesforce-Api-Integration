import 'dart:io';

import 'package:salesforce/api/api.dart';
import 'package:salesforce/api/urls.dart';
import 'package:salesforce/secrets/keys.dart';

class ContactProvider {
  final API api = API();
  final SecretKeys secretKeys = SecretKeys();

  Future<Map> fetchContactById(String id) async {
    Map result = await api.get(URLs.baseURL + URLs.contactURL + id, {
      HttpHeaders.authorizationHeader:
          "Bearer " + SecretKeys().secrets('access_token'),
    }) as Map;
    return result;
  }
}
