class Category {
  String _categoryName;
  String _imgUrl;

  Category.fromJson(Map<String, dynamic> parsedJson) {
    _categoryName = parsedJson['category_name'];
    _imgUrl = parsedJson['img_url'];
  }

  String get categoryName => _categoryName;
  String get imgUrl => _imgUrl;
}
