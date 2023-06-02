part of 'news_cubit.dart';

class NewsState {
  List<NewsItem> news;
  bool isLoadingMore;
  bool isFinished;
  int page;

  NewsState({
    required this.news,
    required this.isLoadingMore,
    required this.page,
    required this.isFinished,
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
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      isFinished: isFinished ?? this.isFinished,
      page: page ?? this.page,
    );
  }
}
