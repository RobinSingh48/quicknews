import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebScreen extends StatefulWidget {
 String fullNews;
  WebScreen({required this.fullNews}) ;

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: widget.fullNews,

     )
    );
  }
}
