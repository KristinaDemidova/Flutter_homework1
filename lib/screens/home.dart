import 'package:flutter/material.dart';
import 'package:news_app_flutter/models/article.dart';
import 'package:news_app_flutter/news_parsing/news.dart';
import 'package:news_app_flutter/views/blog_tile.dart';
import 'package:news_app_flutter/screens/news_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Article> articles;

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    News newsElement = News();
    await newsElement.getNews();
    articles = newsElement.news;
    setState(() {
      _loading = false;
    });
  }

  void openNews(context, index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewsCard(
                  article: articles[index],
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Flutter",
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w600),
              ),
              Text(
                "News",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
              )
            ],
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0.0,
        ),
        body: _loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 30),
                  child: ListView.builder(
                      itemCount: articles.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () => openNews(context, index),
                            child: BlogTile(
                              urlToImage: articles[index].urlToImage,
                              title: articles[index].title,
                              desc: articles[index].description,
                            ));
                      }),
                ),
              ));
  }
}
