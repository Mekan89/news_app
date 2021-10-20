import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;

  const ArticleView({Key? key, required this.blogUrl}) : super(key: key);

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

final Completer<WebViewController> _completer = Completer<WebViewController>();

class _ArticleViewState extends State<ArticleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Flutter'),
              Text(
                'News',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Container(
          child: WebView(
            initialUrl: widget.blogUrl,
            onWebViewCreated: ((WebViewController webViewController) {
              _completer.complete(webViewController);
            }),
          ),
        ));
  }
}
