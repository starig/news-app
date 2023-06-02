part of 'news_cubit.dart';

class NewsState {
  List<NewsItem> news;
  bool isLoadingMore;
  bool isFinished;
  int page;
  int selectedIndex;

  NewsState({
    required this.news,
    required this.isLoadingMore,
    required this.page,
    required this.isFinished,
    required this.selectedIndex
  });

  NewsState copyWith({
    List<NewsItem>? news,
    bool? isLoadingMore,
    int? page,
    bool? isFinished,
    List<NewsItem>? favorites,
    int? selectedIndex,
  }) {
    return NewsState(
      news: news ?? this.news,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      isFinished: isFinished ?? this.isFinished,
      page: page ?? this.page,
      selectedIndex: selectedIndex ?? this.selectedIndex
    );
  }
}
