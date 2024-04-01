import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/domain/bloc/news/news_bloc.dart';
import 'package:news_app_flutter/ui/views/blog_tile.dart';
import 'package:news_app_flutter/ui/screens/news_card.dart';
import 'package:news_app_flutter/domain/service/news_service.dart';
import 'package:news_app_flutter/ui/screens/favourites.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final NewsService _newsService;
  late final NewsBloc _newsBloc;

  @override
  void initState() {
    super.initState();
    _newsService = NewsService();
    _newsBloc = NewsBloc(_newsService);
    _newsBloc.add(LoadNews());
  }

  void openNews(context, article) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewsCard(
                  article: article,
                )));
  }

  void openFavourites(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Favourite()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Flutter",
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w600),
              ),
              const Text(
                "News",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
              ),
              ElevatedButton(
                onPressed: () {
                  openFavourites(context);
                },
                child: const Text('To Favorites'),
              )
            ],
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0.0,
        ),
        body: BlocBuilder<NewsBloc, NewsState>(
          bloc: _newsBloc,
          builder: (context, state) {
            if (state is NewsLoaded) {
              return SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 30),
                  child: ListView.builder(
                      itemCount: state.articles.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () =>
                                openNews(context, state.articles[index]),
                            child: BlogTile(
                              urlToImage: state.articles[index].urlToImage,
                              title: state.articles[index].title,
                              desc: state.articles[index].description,
                            ));
                      }),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
