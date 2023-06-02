import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:news_app/app/config/api.dart';
import 'package:news_app/app/models/news_item.dart';

part 'everything_state.dart';

class EverythingCubit extends Cubit<EverythingState> {
  EverythingCubit()
      : super(
          EverythingState(
            news: [],
            isLoadingMore: false,
            page: 2,
            isFinished: false,
          ),
        );

  final dio = Dio();

  getInitialList() async {
    try {
      List<NewsItem> initialNews = [];
      Response response = await dio.get(
          '$apiUrl/everything?q=bitcoin&pageSize=15&apiKey=$apiKey');
      List<dynamic> articles = response.data['articles'];
      articles.forEach((element) {
        NewsItem item = NewsItem.fromJson(element);
        initialNews.add(item);
      });
      state.news = initialNews;
      emit(state.copyWith(news: state.news));
    } catch (e) {
      throw Exception(e);
    }
  }

  loadMoreNews() async {
    try {
      if (!state.isFinished) {
        List<NewsItem> moreNews = state.news;
        state.isLoadingMore = true;
        emit(state.copyWith(isLoadingMore: state.isLoadingMore));
        Response response = await dio.get(
            '$apiUrl/everything?q=bitcoin&pageSize=15&page=${state.page}&apiKey=$apiKey');
        if (response.data['status'] == 'ok') {
          List<dynamic> articles = response.data['articles'];
          articles.forEach((element) {
            NewsItem item = NewsItem.fromJson(element);
            moreNews.add(item);
          });
          state.news = moreNews;
          state.page = state.page + 1;
          state.isLoadingMore = false;
        } else {
          if (response.data['code'] == 'maximumResultsReached') {
            state.isLoadingMore = false;
            state.isFinished = true;
          } else {
            throw Exception('Error');
          }
        }
        emit(state.copyWith(
            news: state.news, isLoadingMore: state.isLoadingMore));
      }
    } catch (e) {
      state.isLoadingMore = false;
      state.isFinished = true;
      emit(
          state.copyWith(news: state.news, isLoadingMore: state.isLoadingMore));
      throw Exception(e);
    }
  }
}
