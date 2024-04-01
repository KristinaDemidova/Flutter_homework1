part of 'article_bloc.dart';

abstract class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object?> get props => [];
}

class ArticleInitial extends ArticleState {
  @override
  List<Object?> get props => [];
}

class GetFavourite extends ArticleState {
  final bool isFavourite;

  const GetFavourite({required this.isFavourite});

  @override
  List<Object?> get props => [isFavourite];
}
