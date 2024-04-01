part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {}

class LoadNews extends NewsEvent {
  @override
  List<Object?> get props => [];
}
