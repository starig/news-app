import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_app/app/components/news_item.dart';
import 'package:news_app/app/config/colors.dart';
import 'package:news_app/app/config/scale.dart';
import 'package:news_app/app/state/favorites/favorites_cubit.dart';

class NewDetailScreen extends StatefulWidget {
  final NewsItem details;
  final void Function() toggleFavorite;

  const NewDetailScreen(
      {Key? key, required this.details, required this.toggleFavorite})
      : super(key: key);

  @override
  State<NewDetailScreen> createState() => _NewDetailScreenState();
}

class _NewDetailScreenState extends State<NewDetailScreen> {
  @override
  Widget build(BuildContext context) {
    String title = widget.details.title;
    String description = widget.details.description;
    String imgUrl = widget.details.imageUrl;

    DateFormat inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");

    DateTime dateTime = inputFormat.parse(widget.details.date);

    DateFormat outputFormat = DateFormat("HH:mm dd.MM.yyyy");

    String dateString = outputFormat.format(dateTime);

    return Scaffold(
      appBar: AppBar(
        title: Text('Новость'),
        actions: [
          BlocBuilder<FavoritesCubit, FavoritesState>(
            builder: (context, state) {
              late IconData favIcon;
              if (state.favorites
                  .any((element) => element.title == title)) {
                favIcon = Icons.favorite;
              } else {
                favIcon = Icons.favorite_border;
              }
              return Padding(
                padding: EdgeInsets.only(right: scale(16)),
                child: GestureDetector(
                  onTap: widget.toggleFavorite,
                  child: Icon(favIcon, color: white),
                ),
              );
            },
          )

        ],
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(vertical: scale(12), horizontal: scale(24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: white,
                  fontWeight: FontWeight.w800,
                  fontSize: scale(24)),
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
            SizedBox(
              height: scale(20),
            ),
            imgUrl != ''
                ? Image.network(
                    imgUrl,
                    width: double.maxFinite,
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
                  )
                : Container(),
            SizedBox(
              height: scale(16),
            ),
            Text(
              description == '' ? 'Описание отсутствует' : description,
              style: TextStyle(color: white),
            ),
          ],
        ),
      ),
    );
  }
}
