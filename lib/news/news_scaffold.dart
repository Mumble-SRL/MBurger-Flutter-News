import 'package:flutter/material.dart';
import 'package:mburger/mburger.dart';
import '../model/news.dart';
import '../news/news_detail_scaffold.dart';

import '../constants.dart';

class NewsScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News')),
      body: FutureBuilder<List<News>>(
        future: _news(),
        builder: (context, snapshot) => _NewsList(
          news: snapshot.data,
          onTap: (news) => _showNewsDetail(context, news),
        ),
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

  void _showNewsDetail(BuildContext context, News news) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NewsDetailScaffold(news: news),
      ),
    );
  }
}

class _NewsList extends StatelessWidget {
  final List<News>? news;
  final Function(News news) onTap;

  const _NewsList({
    Key? key,
    required this.news,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (news == null) {
      return SizedBox.shrink();
    }
    return ListView.builder(
      itemCount: news!.length,
      itemBuilder: (context, index) => _NewsListTile(
        news: news![index],
        onTap: () => onTap(news![index]),
      ),
    );
  }
}

class _NewsListTile extends StatelessWidget {
  final News news;
  final VoidCallback onTap;

  const _NewsListTile({
    Key? key,
    required this.news,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          contentPadding: const EdgeInsets.all(10),
          leading: news.image != null
              ? ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      news.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : null,
          title: Text(news.title),
          onTap: () => onTap(),
        ),
      ),
    );
  }
}
