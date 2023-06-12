import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/pages/detail_news.dart';
import 'package:news_app/pages/detail_webview.dart';
import 'package:news_app/pages/news_list_page.dart';
import 'package:news_app/styles.dart';

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
          colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              onPrimary: Colors.black,
              secondary: secondaryColor),
          useMaterial3: true,
          textTheme: myTextTheme,
          appBarTheme: AppBarTheme(elevation: 0),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryColor,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)))))),
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
