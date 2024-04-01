part of 'news_bloc.dart';

abstract class NewsState extends Equatable {}

class NewsInitial extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsLoading extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsLoaded extends NewsState {
  final List<Article> articles;

  NewsLoaded({required this.articles});

  @override
  List<Object?> get props => [articles];
}
