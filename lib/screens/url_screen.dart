import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class URLScreen extends StatelessWidget {
  final String articleUrl;
  URLScreen({required this.articleUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: articleUrl,
        ));
  }
}
