import 'package:flutter_news/src/model/article.dart';
import 'package:flutter_news/src/model/category.dart';
import 'package:flutter_news/src/network/source/local/local_data_source_impl.dart';
import 'package:flutter_news/src/network/source/remote/remote_data_source_impl.dart';

class Repository {
  RemoteDataSourceImpl _remoteDataSourceImpl = RemoteDataSourceImpl();
  LocalDataSourceImpl _localDataSourceImpl = LocalDataSourceImpl();

  Future<List<Article>> getArticles() => _remoteDataSourceImpl.getArticles();
  Future<List<Category>> getCategories() => _localDataSourceImpl.getCategoies();
}
