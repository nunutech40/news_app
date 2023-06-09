import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/pages/detail_news.dart';

class NewsListPage extends StatefulWidget {
  static const routeName = '/article_list';
  const NewsListPage({Key? key}) : super(key: key);

  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('News App'),
        ),
        body: FutureBuilder<String>(
          future:
              DefaultAssetBundle.of(context).loadString('assets/articles.json'),
          builder: (context, snapshot) {
            final List<Article> articles = parseArticles(snapshot.data);
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return _buildArticleItem(context, articles[index]);
              },
            );
          },
        ));
  }
}

Widget _buildArticleItem(BuildContext context, Article article) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    leading: Image.network(
      article.urlToImage,
      width: 100,
      fit: BoxFit.cover,
      errorBuilder: (ctx, error, _) => const Center(child: Icon(Icons.error)),
    ),
    title: Text(article.title),
    subtitle: Text(article.author),
    onTap: () {
      Navigator.pushNamed(context, DetailNews.routeName, arguments: article);
    },
  );
}
