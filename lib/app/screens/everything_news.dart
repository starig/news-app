import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app/components/news_item.dart';
import 'package:news_app/app/components/refresh_widget.dart';
import 'package:news_app/app/config/colors.dart';
import 'package:news_app/app/config/scale.dart';
import 'package:news_app/app/state/everything/everything_cubit.dart';
import 'package:news_app/app/state/favorites/favorites_cubit.dart';

class EverythingNewsList extends StatefulWidget {
  const EverythingNewsList({Key? key}) : super(key: key);

  @override
  State<EverythingNewsList> createState() => _EverythingNewsListState();
}

class _EverythingNewsListState extends State<EverythingNewsList> {
  late Future _func;
  final ScrollController _scrollController = ScrollController();


  _loadMore() async {
    await context.read<EverythingCubit>().loadMoreNews();
  }

  @override
  void initState() {
    super.initState();
    _func = context.read<EverythingCubit>().getInitialList();
    _scrollController.addListener(() async {
      if (_scrollController.offset >=
          _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        await _loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: _func,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: grey),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error during loading data',
                style: TextStyle(color: red, fontWeight: FontWeight.w600),
              ),
            );
          } else {
            return BlocBuilder<EverythingCubit, EverythingState>(
              builder: (context, state) {
                return RefreshWidget(
                  onRefresh: () async {
                    await context.read<EverythingCubit>().getInitialList();
                  },
                  scrollController: _scrollController,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                      state.news.length + (state.isLoadingMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == state.news.length - 1 &&
                            !state.isFinished) {
                          return Container(
                            margin: EdgeInsets.only(top: scale(25)),
                            child: Center(
                              child: CircularProgressIndicator(color: grey),
                            ),
                          );
                        }
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: scale(12), horizontal: scale(8)),
                          child: NewsItem(
                            title: state.news[index].title ?? '',
                            description:
                            state.news[index].description ?? '',
                            date: state.news[index].publishedAt ?? '',
                            imageUrl: state.news[index].urlToImage ?? '',
                            toggleFavorite: () {
                              context.read<FavoritesCubit>().toggleFavorite(state.news[index]);
                            },
                          ),
                        );
                      }),
                );
              },
            );
          }
        }
        return Container();
      },
    );
  }
}
