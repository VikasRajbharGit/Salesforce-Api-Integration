# Flutter Salesforce App

A Flutter app connected to a Salesforce Org


------------

- To run this app you need to have your own access token
[Link to obtain access key](https://www.gosquared.com/blog/salesforce-rest-api-integration "Link to obtain access key") 

##### Screenshots

![Salesforce](/screenshots/1.JPG "Salesforce")
![Salesforce](/screenshots/2.JPG "Salesforce")
![Salesforce](/screenshots/3.JPG "Salesforce")
![Salesforce](/screenshots/4.JPG "Salesforce")
![Salesforce](/screenshots/5.JPG "Salesforce")
![Salesforce](/screenshots/6.JPG "Salesforce")

- Create a file under `/lib/secrets/actual_keys.dart` and paste the below code with your Credentials

```dart
String _consumerKey = "YOUR_CONSUMER_KEY";

String _consumerSecret = "YOUR_CONSUMER_SECRET";

String _accessCode = "ACCESS_CODE";

Map<String, dynamic> _credentials = {
  "access_token": "ACCESS_TOKEN",
  "refresh_token": "REFRESH_TOKEN",
  "signature": "SIGNATURE",
  "scope": "refresh_token web api",
  "instance_url": "https://INSTANCE.salesforce.com",
  "id": "https://login.salesforce.com/id/ID",
  "token_type": "Bearer",
  "issued_at": "TIME"
};

String get consumerKey => _consumerKey;

String get consumerSecret => _consumerSecret;

String get accessCode => _accessCode;

String secrets(String key) => _credentials[key];

```
