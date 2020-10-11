import 'package:flutter_news/src/model/category.dart';

abstract class LocalDataSource {
  Future<List<Category>> getCategoies();
}
