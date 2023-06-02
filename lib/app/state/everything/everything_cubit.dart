import 'package:bloc/bloc.dart';
import 'package:news_app/app/models/news_item.dart';

part 'everything_state.dart';

class EverythingCubit extends Cubit<EverythingState> {
  EverythingCubit() : super(EverythingState(news: [], isLoadingMore: false, page: 2, isFinished: false));
}
