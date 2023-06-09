import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailWebview extends StatelessWidget {
  static const routeName = '/article_web';
  final String url;
  const DetailWebview({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()..loadRequest(Uri.parse(url));
    return Scaffold(
      appBar: AppBar(title: const Text('News App')),
      body: WebViewWidget(controller: controller),
    );
  }
}
