import 'package:flutter/material.dart';
import 'package:webview_flutter/platform_interface.dart';

import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';

class WebViewWiget extends StatefulWidget {
  @override
  WebViewWigetState createState() => WebViewWigetState();
}

class WebViewWigetState extends State<WebViewWiget> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'www.baidu.com',
        debuggingEnabled: true,
        onWebResourceError: (WebResourceError error) {
          print(error.description);
        },
        onPageStarted: (String url) {
          print(url);
          int t = new DateTime.now().millisecondsSinceEpoch;
          print('onPageStarted=$t');
        },
        onPageFinished: (String url) {
          print(url);
          int t = new DateTime.now().millisecondsSinceEpoch;
          print('onPageFinished=$t');
        });
  }
}
