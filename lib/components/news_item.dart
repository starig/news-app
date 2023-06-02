import 'package:flutter/material.dart';

class NewsItem extends StatefulWidget {
  const NewsItem({Key? key}) : super(key: key);

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network('https://www.google.com/url?sa=i&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FGiant_panda&psig=AOvVaw0uWrq1WHwz3RwprZ6VM3tQ&ust=1685759884908000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCIDT_4rHo_8CFQAAAAAdAAAAABAD'),
          Column(
            children: [
              Text('Title'),
              Text('Subtitle'),
              Text('01.01.2002')
            ],
          ),
          GestureDetector(
            child: Icon(Icons.favorite_border),
          )
        ],
      ),
    );
  }
}
