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
        primarySwatch: _mburgerColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NewsScaffold(),
    );
  }

  MaterialColor get _mburgerColor => MaterialColor(
    0xFF307DF6,
    {
      50: Color(0xFFE6EFFE),
      100: Color(0xFFC1D8FC),
      200: Color(0xFF98BEFB),
      300: Color(0xFF6EA4F9),
      400: Color(0xFF4F91F7),
      500: Color(0xFF307DF6),
      600: Color(0xFF2B75F5),
      700: Color(0xFF246AF3),
      800: Color(0xFF1E60F2),
      900: Color(0xFF134DEF),
    },
  );

}
