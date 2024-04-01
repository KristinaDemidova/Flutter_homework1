import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app_flutter/ui/screens/home.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app_flutter/data/repository/news_repository.dart';
import 'package:news_app_flutter/data/repository/favourite_repository.dart';
import 'package:news_app_flutter/data/api/api_utils.dart';
import 'package:news_app_flutter/data/api/service/news_service.dart';
import 'package:news_app_flutter/domain/service/favourite_service.dart';
import 'package:news_app_flutter/domain/repository/favourite_repository.dart';
import 'package:news_app_flutter/domain/repository/news_repository.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  GetIt.I.registerSingleton<NewsRepository>(
      NewsDataRepository(ApiUtil(NewsDataService())));
  GetIt.I.registerSingleton<FavouriteRepository>(FavouriteDataRepository());
  GetIt.I.registerSingleton<FavouriteService>(FavouriteService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const Home(),
    );
  }
}
