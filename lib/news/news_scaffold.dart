import 'package:flutter/material.dart';
import 'package:mburger/mburger.dart';
import '../model/news.dart';
import '../news/news_detail_scaffold.dart';

import '../constants.dart';

class NewsScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: FutureBuilder<List<News>>(
        future: _news(),
        builder: (context, snapshot) => _newsList(context, snapshot.data),
      ),
    );
  }

  Future<List<News>> _news() async {
    MBPaginatedResponse<MBSection> homeSections =
        await MBManager.shared.getSections(
      blockId: Constants.newsBlockId,
      includeElements: true,
    );
    return homeSections.items.map((s) => News.fromMBurgerSection(s)).toList();
  }

  Widget _newsList(BuildContext context, List<News> news) {
    if (news == null) {
      return Container();
    }
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) => _newsListTile(context, news[index]),
    );
  }

  Widget _newsListTile(BuildContext context, News news) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          contentPadding: const EdgeInsets.all(10),
          leading: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                news.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(news.title),
          onTap: () => _showNewsDetail(context, news),
        ),
      ),
    );
  }

  void _showNewsDetail(BuildContext context, News news) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NewsDetailScaffold(news: news),
      ),
    );
  }
}
