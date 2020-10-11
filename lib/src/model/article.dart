class Article {
  String _author;
  String _title;
  String _url;
  String _imgUrl;
  String _content;
  String _desc;

  Article.fromJson(Map<String, dynamic> parsedJson) {
    _author = parsedJson['author'];
    _title = parsedJson['title'];
    _url = parsedJson['title'];
    _imgUrl = parsedJson['urlToImage'];
    _content = parsedJson['content'];
    _desc = parsedJson['description'];
  }

  String get author => _author;
  String get title => _title;
  String get url => _url;
  String get imgUrl => _imgUrl;
  String get content => _content;
  String get desc => _desc;
}
