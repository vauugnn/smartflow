import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'dart:io';
import 'package:sprinkler_controller/landing_page.dart'; // Import the LandingPage class

class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  String url = 'http://192.168.243.151'; // Replace with the actual IP address of your ESP32 board
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  Future<void> _reloadWebView() async {
    final controller = await _controller.future;
    await controller.loadUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LandingPage()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Back',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: _reloadWebView,
                ),
              ],
            ),
          ),
          Expanded(
            child: WebView(
              initialUrl: url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              debuggingEnabled: true,
              gestureNavigationEnabled: true,
            ),
          ),
        ],
      ),
    );
  }
}