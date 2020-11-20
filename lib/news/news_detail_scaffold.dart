import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../model/news.dart';

class NewsDetailScaffold extends StatelessWidget {
  final News news;

  const NewsDetailScaffold({
    Key key,
    @required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title),
      ),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 3 / 2,
            child: Image.network(
              news.image,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MarkdownBody(
              data: news.content,
            ),
          ),
        ],
      ),
    );
  }
}
