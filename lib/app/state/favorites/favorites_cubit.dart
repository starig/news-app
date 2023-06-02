import 'package:bloc/bloc.dart';
import 'package:news_app/app/models/news_item.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesState(favorites: []));

  toggleFavorite(NewsItem item) {
    late int index;
    if (state.favorites.any((favorite) {
      index = state.favorites.indexOf(favorite);
      return favorite.title == item.title;
    })) {
      state.favorites.removeAt(index);
    } else {
      state.favorites.add(item);
    }

    emit(state.copyWith(favorites: state.favorites));
  }

  deleteFavorite(int index) {
    state.favorites.removeAt(index);
    emit(state.copyWith(favorites: state.favorites));
  }
}
