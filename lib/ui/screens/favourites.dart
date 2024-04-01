import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app_flutter/domain/bloc/favourite/favourite_bloc.dart';
import 'package:news_app_flutter/ui/views/blog_tile.dart';
import 'package:news_app_flutter/ui/screens/news_card.dart';
import 'package:news_app_flutter/domain/service/favourite_service.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  late final FavouriteService _favouriteService;
  late final FavouriteBloc _favouriteBloc;

  @override
  void initState() {
    super.initState();
    _favouriteService = GetIt.I<FavouriteService>();
    _favouriteBloc = FavouriteBloc(_favouriteService);
    _favouriteBloc.add(LoadFavourites());
  }

  void openNews(context, article) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewsCard(
                  article: article,
                )));
  }

  void closeFavourites(context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Favourite",
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w600),
              ),
              Text(
                "News",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0.0,
        ),
        body: BlocBuilder<FavouriteBloc, FavouriteState>(
          bloc: _favouriteBloc,
          builder: (context, state) {
            if (state is FavouriteLoaded) {
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
