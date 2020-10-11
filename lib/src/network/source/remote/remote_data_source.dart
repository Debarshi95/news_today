import 'package:flutter_news/src/model/article.dart';

abstract class RemoteDataSource {
  Future<List<Article>> getArticles();
}
