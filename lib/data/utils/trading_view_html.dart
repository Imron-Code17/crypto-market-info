class TradingViewHtml {
  static String symbol(String name, List<double> prices) {
    return '''
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>Load file or HTML string example</title>
<style>
  body, html {
    margin: 0;
    padding: 0;
    width: 100%;
    height: 100%;
    overflow: hidden;
  }
  .tradingview-widget-container {
    width: 100%;
    height: 100vh;
  }
</style>
</head>
<body>
<div class="tradingview-widget-container">
  <div class="tradingview-widget-container__widget"></div>
  <div class="tradingview-widget-copyright"><a href="https://www.tradingview.com/" rel="noopener nofollow" target="_blank"><span class="blue-text">Track all markets on TradingView</span></a></div>
  <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-advanced-chart.js" async>
{
  "autosize": true,
  "symbol": "BITSTAMP:${name.replaceAll('-', '')}",
  "interval": "0.0160",
  "timezone": "Asia/Jakarta",
  "theme": "dark",
  "style": "3",
  "locale": "en",
  "gridColor": "rgba(0, 0, 0, 0.06)",
  "hide_legend": false,
  "allow_symbol_change": false,
  "save_image": false,
  "calendar": false,
  "hide_volume": true,
  "support_host": "https://www.tradingview.com"
}
  </script>
</div>
</body>
</html>
''';
  }
}
