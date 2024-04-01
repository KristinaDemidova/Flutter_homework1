import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/domain/bloc/article/article_bloc.dart';
import 'package:news_app_flutter/domain/model/article.dart';
import 'package:news_app_flutter/domain/service/favourite_service.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatefulWidget {
  final Article article;

  const NewsCard({
    super.key,
    required this.article,
  });

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  late final FavouriteService _favouriteService;
  late final ArticleBloc _articleBloc;

  @override
  void initState() {
    super.initState();
    _favouriteService = GetIt.I<FavouriteService>();
    _articleBloc = ArticleBloc(_favouriteService);
    _articleBloc.add(GetFavorite(article: widget.article));
  }

  void openLink() async {
    Uri uri = Uri.parse(widget.article.url.toString());
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<ArticleBloc, ArticleState>(
            bloc: _articleBloc,
            builder: (context, state) {
              if (state is GetFavourite) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.network(
                      widget.article.urlToImage.toString(),
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.article.title.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.article.content.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: openLink,
                      child: Text(widget.article.url.toString()),
                    ),
                    ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("To home page")),
                    ElevatedButton(
                        onPressed: () => _articleBloc
                            .add(ChangeFavorite(article: widget.article)),
                        child: state.isFavourite
                            ? const Text("Remove from favorites")
                            : const Text("Add to favorites")),
                  ],
                );
              }
              return Container();
            }));
  }
}
