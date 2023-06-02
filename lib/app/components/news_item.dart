import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_app/app/config/colors.dart';
import 'package:news_app/app/config/helpers.dart';
import 'package:news_app/app/config/scale.dart';
import 'package:news_app/app/state/favorites/favorites_cubit.dart';
import 'package:news_app/app/state/news/news_cubit.dart';

class NewsItem extends StatefulWidget {
  final String title;
  final String description;
  final String date;
  final String imageUrl;
  final void Function() toggleFavorite;

  const NewsItem({
    Key? key,
    required this.title,
    required this.description,
    required this.date,
    required this.imageUrl,
    required this.toggleFavorite,
  }) : super(key: key);

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    String dateString = stringToDatetime(widget.date);

    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/new_detail', arguments: {
              'details': NewsItem(
                title: widget.title,
                description: widget.description,
                date: widget.date,
                imageUrl: widget.imageUrl,
                toggleFavorite: widget.toggleFavorite,
              ),
              'toggleFavorite': widget.toggleFavorite
            });
          },
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  widget.imageUrl,
                  width: scale(100),
                  height: scale(70),
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return SizedBox(
                      width: scale(100),
                      child: Icon(
                        Icons.image_not_supported,
                        color: white,
                        size: scale(45),
                      ),
                    );
                  },
                ),
                Container(
                  width: scale(240),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.w600,
                          fontSize: scale(16),
                        ),
                      ),
                      Text(
                        widget.description,
                        style: TextStyle(
                          color: grey,
                          fontWeight: FontWeight.w400,
                          fontSize: scale(12),
                        ),
                      ),
                      Text(
                        dateString,
                        style: TextStyle(
                          color: grey,
                          fontWeight: FontWeight.w300,
                          fontSize: scale(12),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<FavoritesCubit, FavoritesState>(
                  builder: (context, state) {
                    late IconData favIcon;

                    if (state.favorites
                        .any((element) => element.title == widget.title)) {
                      favIcon = Icons.favorite;
                    } else {
                      favIcon = Icons.favorite_border;
                    }
                    return GestureDetector(
                      onTap: widget.toggleFavorite,
                      child: Icon(favIcon, color: white),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
