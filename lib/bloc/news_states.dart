import 'package:equatable/equatable.dart';
import '../model/categories_new_model.dart' as categoriesModel;
import '../model/news_channel_headlines_model.dart' as headlinesModel;

enum Status { initial, success, failure }

class NewsState extends Equatable {
  NewsState({
    this.status = Status.initial,
    this.categoriesStatus = Status.initial,
    this.categoriesMessage = '',
    this.message = '',
    headlinesModel.NewsChannelsHeadlinesModel? newsList,
    categoriesModel.CategoriesNewsModel? categoriesNewsModel,
    List<categoriesModel.Articles>? favoritesList,
  })  : newsList = newsList ?? headlinesModel.NewsChannelsHeadlinesModel(),
        newsCategoriesList = categoriesNewsModel ?? categoriesModel.CategoriesNewsModel(),
        favoritesList = favoritesList ?? [];

  final Status status;
  final headlinesModel.NewsChannelsHeadlinesModel? newsList;
  final String message;
  final Status categoriesStatus;
  final String categoriesMessage;
  final categoriesModel.CategoriesNewsModel? newsCategoriesList;
  final List<categoriesModel.Articles> favoritesList; // List of favorite articles

  NewsState copyWith({
    Status? status,
    headlinesModel.NewsChannelsHeadlinesModel? newsList,
    String? message,
    categoriesModel.CategoriesNewsModel? categoriesNewsModel,
    String? categoriesMessage,
    Status? categoriesStatus,
    List<categoriesModel.Articles>? favoritesList,
  }) {
    return NewsState(
      status: status ?? this.status,
      newsList: newsList ?? this.newsList,
      message: message ?? this.message,
      categoriesMessage: categoriesMessage ?? this.categoriesMessage,
      categoriesNewsModel: categoriesNewsModel ?? this.newsCategoriesList,
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
      favoritesList: favoritesList ?? this.favoritesList,
    );
  }

  @override
  String toString() {
    return '''NewsState { status: $status, message: $message, favoritesCount: ${favoritesList.length} }''';
  }

  @override
  List<Object?> get props => [status, newsList, message, categoriesStatus, newsCategoriesList, favoritesList];
}
