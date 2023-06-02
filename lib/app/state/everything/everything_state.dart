part of 'everything_cubit.dart';


class EverythingState {
  List<NewsItem> news;
  bool isLoadingMore;
  bool isFinished;
  int page;

  EverythingState({
    required this.news,
    required this.isLoadingMore,
    required this.page,
    required this.isFinished,
  });

  EverythingState copyWith({
    List<NewsItem>? news,
    bool? isLoadingMore,
    int? page,
    bool? isFinished,
    List<NewsItem>? favorites,
  }) {
    return EverythingState(
      news: news ?? this.news,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      isFinished: isFinished ?? this.isFinished,
      page: page ?? this.page,
    );
  }
}

