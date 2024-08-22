import 'package:crypto_market_info/data/data.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import '../../../lib.dart';

class TradingViewWidgetHtml extends StatefulWidget {
  const TradingViewWidgetHtml({
    required this.symbol,
    this.prices,
    super.key,
  });

  final String symbol;
  final List<double>? prices;
  @override
  State<TradingViewWidgetHtml> createState() => _TradingViewWidgetHtmlState();
}

class _TradingViewWidgetHtmlState extends State<TradingViewWidgetHtml> {
  late final WebViewControllerPlus controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewControllerPlus()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('progress');
          },
          onPageStarted: (String url) {
            debugPrint('started');
          },
          onPageFinished: (String url) {
            debugPrint('finished');
          },
        ),
      )
      ..enableZoom(true)
      ..loadHtmlString(
        TradingViewHtml.symbol(widget.symbol, widget.prices ?? []),
      );
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
