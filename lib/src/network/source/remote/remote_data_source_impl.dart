import 'dart:convert';

import 'package:flutter_news/src/model/article.dart';
import 'package:flutter_news/src/network/api_provider.dart';
import 'package:flutter_news/src/network/source/remote/remote_data_source.dart';
import 'package:http/http.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  ApiProvider _apiProvider = ApiProvider();

  @override
  Future<List<Article>> getArticles() async {
    Response response = await _apiProvider.client.get(
      "${_apiProvider.baseApi}/top-headlines?country=in",
      headers: _apiProvider.headers,
    );
    print(response.body);
    if (response.statusCode == 200) {
      var _data = json.decode(response.body);
      return (_data['articles'] as List)
          .map((e) => Article.fromJson(e))
          .toList();
    } else {
      throw Exception("Oops! Some error occured");
    }
  }
}
