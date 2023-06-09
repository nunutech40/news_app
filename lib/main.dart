import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/pages/detail_news.dart';
import 'package:news_app/pages/detail_webview.dart';
import 'package:news_app/pages/news_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: NewsListPage.routeName,
      routes: {
        NewsListPage.routeName: (context) => const NewsListPage(),
        DetailNews.routeName: (context) => DetailNews(
            article: ModalRoute.of(context)?.settings.arguments as Article),
        DetailWebview.routeName: (context) => DetailWebview(
            url: ModalRoute.of(context)?.settings.arguments as String)
      },
    );
  }
}
