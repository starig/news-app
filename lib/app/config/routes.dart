import 'package:flutter/material.dart';
import 'package:news_app/init.dart';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  '/': (context) => const InitialScreen(),
};
