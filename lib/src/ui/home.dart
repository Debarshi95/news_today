import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/src/model/article.dart';
import 'package:flutter_news/src/model/category.dart';
import 'package:flutter_news/src/network/repository.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Article> _articleList;
  List<Category> _categoryList;
  Repository _repository = Repository();
  bool _loading = true;
  @override
  void initState() {
    _getCategories();
    _getArticles();
    super.initState();
  }

  _getArticles() async {
    await _repository.getArticles().then((list) => _articleList = list);
    setState(() {
      _loading = false;
    });
  }

  _getCategories() async {
    await _repository.getCategories().then((list) => _categoryList = list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("News"),
            Text(
              "Today",
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        elevation: 0.0,
        centerTitle: true,
        brightness: Brightness.light,
      ),
      body: Center(
        child: _loading
            ? CircularProgressIndicator()
            : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  child: Column(
                    children: [
                      CategoryTile(categoryList: _categoryList),
                      BlogTile(articleList: _articleList)
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final List<Category> categoryList;

  CategoryTile({@required this.categoryList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.only(left: 10.0, top: 10.0),
      child: ListView.builder(
        itemBuilder: (context, int index) {
          return _buildCategoryTile(
            categoryList[index].imgUrl,
            categoryList[index].categoryName,
          );
        },
        itemCount: categoryList == null ? 0 : categoryList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
      ),
    );
  }

  Widget _buildCategoryTile(String imgUrl, String categoryName) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6.0),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: imgUrl,
                fit: BoxFit.fill,
                width: 130.0,
                height: 90,
              ),
              Container(
                width: 130.0,
                color: Colors.black26,
                alignment: Alignment.center,
                child: Text(
                  categoryName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final List<Article> articleList;

  BlogTile({@required this.articleList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, top: 8.0, right: 10.0),
      child: ListView.builder(
        itemBuilder: (_, int index) {
          return _buildBlogTile(articleList[index], context);
        },
        itemCount: articleList == null ? 0 : articleList.length,
        shrinkWrap: true,
        physics: ScrollPhysics(),
      ),
    );
  }
}

Widget _buildBlogTile(Article article, BuildContext context) {
  return GestureDetector(
    onTap: () {},
    child: Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: [
          CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: article.imgUrl,
            height: 200.0,
            width: MediaQuery.of(context).size.width,
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(),
            ),
          ),
          Padding(
            child: Text(
              article.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
            padding: const EdgeInsets.all(10.0),
          )
        ],
      ),
    ),
  );
}
