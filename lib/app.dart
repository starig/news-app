import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app/config/colors.dart';
import 'package:news_app/app/screens/new_detail.dart';
import 'package:news_app/app/screens/news.dart';
import 'package:news_app/app/state/everything/everything_cubit.dart';
import 'package:news_app/app/state/favorites/favorites_cubit.dart';
import 'package:news_app/app/state/news/news_cubit.dart';
import 'package:news_app/init.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => NewsCubit())),
        BlocProvider(create: ((context) => FavoritesCubit())),
        BlocProvider(create: ((context) => EverythingCubit())),
      ],
      child: Builder(
        builder: (context) => MaterialApp(
          title: "News App",
          debugShowCheckedModeBanner: false,
          home: InitialScreen(),
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(
                  builder: (context) {
                    return NewsScreen();
                  },
                );
              case '/new_detail':
                return MaterialPageRoute(
                  builder: (context) {
                    return NewDetailScreen(
                      details: (settings.arguments
                          as Map<String, dynamic>)["details"],
                    );
                  },
                );
            }
          },
          theme: ThemeData(
              scaffoldBackgroundColor: background,
              appBarTheme: AppBarTheme(
                backgroundColor: background,
              )),
        ),
      ),
    );
  }
}
