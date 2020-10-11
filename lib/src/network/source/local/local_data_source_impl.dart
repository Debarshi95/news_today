import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_news/src/model/category.dart';
import 'package:flutter_news/src/network/source/local/local_data_source.dart';

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<List<Category>> getCategoies() async {
    String _data = await rootBundle.loadString("assets/category.json");
    var _jsonData = json.decode(_data);
    var _categoryList = _jsonData['categories'] as List;
    return _categoryList.map((e) => Category.fromJson(e)).toList();
  }
}
