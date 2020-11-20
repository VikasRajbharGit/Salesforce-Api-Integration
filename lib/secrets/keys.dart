import 'package:salesforce/secrets/actual_keys.dart' as secret;

class SecretKeys {
  String _consumerKey;

  String _consumerSecret;

  String _accessCode;

  SecretKeys._() {
    _consumerKey = secret.consumerKey;
    _consumerSecret = secret.consumerSecret;
    _accessCode = secret.accessCode;
  }

  static final SecretKeys internal = SecretKeys._();

  factory SecretKeys() => internal;

  String get consumerKey => _consumerKey;

  String get consumerSecret => _consumerSecret;

  String get accessCode => _accessCode;

  String secrets(String key) => secret.secrets(key);
}