part of 'article_bloc.dart';

abstract class ArticleEvent extends Equatable {}

class ChangeFavorite extends ArticleEvent {
  final Article article;

  ChangeFavorite({required this.article});

  @override
  List<Object?> get props => [];
}

class GetFavorite extends ArticleEvent {
  final Article article;

  GetFavorite({required this.article});

  @override
  List<Object?> get props => [];
}
