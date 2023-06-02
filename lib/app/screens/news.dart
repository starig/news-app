import 'package:flutter/material.dart';
import 'package:news_app/app/config/colors.dart';
import 'package:news_app/app/screens/everything_news.dart';
import 'package:news_app/app/screens/headline_news.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _selectedIndex == 0 ? 'Top headlines' : 'All news',
            style: TextStyle(color: white),
          ),
          bottom: TabBar(
            indicatorColor: green,
            onTap: (int) {
              setState(() {
                _selectedIndex = int;
              });
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
  }
}
