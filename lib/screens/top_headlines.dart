import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app/config/colors.dart';
import 'package:news_app/app/config/scale.dart';
import 'package:news_app/components/news_item.dart';
import 'package:news_app/state/news/news_cubit.dart';

class TopHeadlinesScreen extends StatefulWidget {
  const TopHeadlinesScreen({Key? key}) : super(key: key);

  @override
  State<TopHeadlinesScreen> createState() => _TopHeadlinesScreenState();
}

class _TopHeadlinesScreenState extends State<TopHeadlinesScreen> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Top headlines',
            style: TextStyle(color: white),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list_alt)),
              Tab(icon: Icon(Icons.list_outlined)),
            ],
          ),
        ),
        body: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 17,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: scale(12), horizontal: scale(8)),
                      child: NewsItem(),
                    );
                  }),
            );
          },
        ),
      ),
    );
  }
}
