import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';

class DetailNews extends StatelessWidget {
  static const routeName = '/article_detail';
  const DetailNews({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.network(article.urlToImage),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Text(article.description),
              Divider(
                color: Colors.grey,
              ),
              Text(
                article.title,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              const Divider(color: Colors.grey),
              Text('Date: ${article.publishedAt}'),
              const SizedBox(height: 10),
              Text('Author: ${article.author}'),
              const Divider(color: Colors.grey),
              Text(
                article.content,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text('Read more'),
                onPressed: () {},
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
