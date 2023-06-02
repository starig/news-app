part of 'news_cubit.dart';

class NewsState {
  List<NewsItem> news;

  NewsState({required this.news});

  NewsState copyWith({
    List<NewsItem>? news,
  }) {
    return NewsState(news: news ?? this.news);
  }
}
