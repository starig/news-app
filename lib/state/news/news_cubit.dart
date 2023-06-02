import 'package:bloc/bloc.dart';
import 'package:news_app/models/news_item.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit()
      : super(NewsState(
          news: [],
        ));
}
