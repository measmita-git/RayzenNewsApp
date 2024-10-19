import 'package:equatable/equatable.dart';

import '../model/categories_new_model.dart';


abstract class NewsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchNewsChannelHeadlines extends NewsEvent {
  final String channelId;
  FetchNewsChannelHeadlines(this.channelId);
}

class NewsCategories extends NewsEvent {
  final String category;
  NewsCategories(this.category);
}

// New Events for managing favorites
class AddToFavorites extends NewsEvent {
  final Articles article;
  AddToFavorites(this.article);

  @override
  List<Object> get props => [article];
}

class RemoveFromFavorites extends NewsEvent {
  final Articles article;
  RemoveFromFavorites(this.article);

  @override
  List<Object> get props => [article];
}
