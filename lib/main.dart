import 'package:flutter/material.dart';
import 'package:mburger/mburger.dart';
import 'package:mburger_news/news/news_scaffold.dart';

import 'constants.dart';

void main() {
  MBManager.shared.apiToken = Constants.mburgerToken;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MBurger News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NewsScaffold(),
    );
  }
}
