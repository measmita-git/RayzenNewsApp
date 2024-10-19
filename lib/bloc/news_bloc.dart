import 'package:bloc/bloc.dart';
import '../model/categories_new_model.dart' as categoriesModel;
import '../repository/news_repository.dart';
import 'news_event.dart';
import 'news_states.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsRepository postRepository = NewsRepository();

  NewsBloc() : super(NewsState()) {
    on<FetchNewsChannelHeadlines>(fetchChannelNews);
    on<NewsCategories>(fetchNewsCategories);
    on<AddToFavorites>(addArticleToFavorites);
    on<RemoveFromFavorites>(removeArticleFromFavorites);
  }

  Future<void> fetchChannelNews(FetchNewsChannelHeadlines event, Emitter<NewsState> emit) async {
    emit(state.copyWith(status: Status.initial));

    await postRepository.fetchNewsChannelHeadlinesApi(event.channelId).then((value) {
      emit(state.copyWith(status: Status.success, newsList: value, message: 'success'));
    }).onError((error, stackTrace) {
      emit(state.copyWith(status: Status.failure, message: error.toString()));
    });
  }

  Future<void> fetchNewsCategories(NewsCategories event, Emitter<NewsState> emit) async {
    emit(state.copyWith(categoriesStatus: Status.initial));

    await postRepository.fetchNewsCategoires(event.category).then((value) {
      emit(state.copyWith(categoriesStatus: Status.success, categoriesNewsModel: value, categoriesMessage: 'success'));
    }).onError((error, stackTrace) {
      emit(state.copyWith(categoriesStatus: Status.failure, categoriesMessage: error.toString()));
    });
  }

  // Method to add an article to favorites
  void addArticleToFavorites(AddToFavorites event, Emitter<NewsState> emit) {
    final updatedFavoritesList = List<categoriesModel.Articles>.from(state.favoritesList)..add(event.article);
    emit(state.copyWith(favoritesList: updatedFavoritesList));
  }

  // Method to remove an article from favorites
  void removeArticleFromFavorites(RemoveFromFavorites event, Emitter<NewsState> emit) {
    final updatedFavoritesList = List<categoriesModel.Articles>.from(state.favoritesList)..remove(event.article);
    emit(state.copyWith(favoritesList: updatedFavoritesList));
  }
}
