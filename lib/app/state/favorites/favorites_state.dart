part of 'favorites_cubit.dart';

class FavoritesState {
  List<NewsItem> favorites;

  FavoritesState({
    required this.favorites,
  });

  FavoritesState copyWith({List<NewsItem>? favorites}) {
    return FavoritesState(favorites: favorites ?? this.favorites);
  }
}

