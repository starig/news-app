import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app/config/colors.dart';
import 'package:news_app/app/config/routes.dart';
import 'package:news_app/state/news/news_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => NewsCubit())),
      ],
      child: Builder(
        builder: (context) => MaterialApp(
          title: "News App",
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: routes,
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
