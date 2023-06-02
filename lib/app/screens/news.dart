import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app/config/colors.dart';
import 'package:news_app/app/screens/everything_news.dart';
import 'package:news_app/app/screens/headline_news.dart';
import 'package:news_app/app/state/news/news_cubit.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          initialIndex: state.selectedIndex,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                state.selectedIndex == 0 ? 'Top headlines' : 'All news',
                style: TextStyle(color: white),
              ),
              bottom: TabBar(
                indicatorColor: green,
                onTap: (id) {
                  context.read<NewsCubit>().setSelectedIndex(id);
                },
                tabs: [
                  Tab(icon: Icon(Icons.list_alt)),
                  Tab(icon: Icon(Icons.list_outlined)),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                HeadlineNewsList(),
                EverythingNewsList()
              ],
            ),
          ),
        );
      },
    );
  }
}
