part of 'favourite_bloc.dart';

abstract class FavouriteState extends Equatable {}

class FavouriteInitial extends FavouriteState {
  @override
  List<Object?> get props => [];
}

class FavouriteLoading extends FavouriteState {
  @override
  List<Object?> get props => [];
}

class FavouriteLoaded extends FavouriteState {
  final List<Article> articles;

  FavouriteLoaded({required this.articles});

  @override
  List<Object?> get props => [articles];
}
