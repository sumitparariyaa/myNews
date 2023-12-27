import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleScreen extends StatelessWidget {
  String blogUrl;
  ArticleScreen({required this.blogUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:WebView(
        initialUrl: blogUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
