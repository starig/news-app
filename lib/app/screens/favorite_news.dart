import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app/components/news_item.dart';
import 'package:news_app/app/config/scale.dart';
import 'package:news_app/app/state/favorites/favorites_cubit.dart';
import 'package:news_app/app/state/news/news_cubit.dart';

class FavoriteNewsScreen extends StatefulWidget {
  const FavoriteNewsScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteNewsScreen> createState() => _FavoriteNewsScreenState();
}

class _FavoriteNewsScreenState extends State<FavoriteNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Закладки'),
      ),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:
                state.favorites.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: scale(12), horizontal: scale(8)),
                    child: NewsItem(
                      title: state.favorites[index].title ?? '',
                      description:
                      state.favorites[index].description ?? '',
                      date: state.favorites[index].publishedAt ?? '',
                      imageUrl: state.favorites[index].urlToImage ?? '',
                      toggleFavorite: () {
                        context.read<FavoritesCubit>().deleteFavorite(index);
                      },
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}
