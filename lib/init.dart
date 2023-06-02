import 'package:flutter/material.dart';
import 'package:news_app/app/config/colors.dart';
import 'package:news_app/app/screens/favorite_news.dart';
import 'package:news_app/app/screens/top_headlines_news.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _screens = <Widget>[
    TopHeadlinesScreen(),
    FavoriteNewsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        backgroundColor: background,
        selectedItemColor: white,
        unselectedItemColor: grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_sharp),
            label: 'Новости',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Закладки',
          ),
        ],
      ),
    );
  }
}
