part of 'news_cubit.dart';

class NewsState {
  List<NewsItem> news;
  List<NewsItem> favorites;
  bool isLoadingMore;
  bool isFinished;
  int page;

  NewsState({
    required this.news,
    required this.isLoadingMore,
    required this.page,
    required this.isFinished,
    required this.favorites,
  });

  NewsState copyWith({
    List<NewsItem>? news,
    bool? isLoadingMore,
    int? page,
    bool? isFinished,
    List<NewsItem>? favorites,
  }) {
    return NewsState(
      news: news ?? this.news,
      favorites: favorites ?? this.favorites,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      isFinished: isFinished ?? this.isFinished,
      page: page ?? this.page,
    );
  }
}
