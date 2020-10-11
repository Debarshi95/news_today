import 'package:http/http.dart';

class ApiProvider {
  String _apiKey = "4629891daf524f68b8ddb667921b58c2";
  Client _client = Client();
  String _baseApi = "https://newsapi.org/v2";

  Map<String, String> get headers =>
      {"content-type": "application/json", "authorization": "$_apiKey"};
  String get apiKey => _apiKey;
  Client get client => _client;
  String get baseApi => _baseApi;
}
