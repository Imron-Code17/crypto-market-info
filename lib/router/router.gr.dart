// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [CryptoChartView]
class CryptoChartRoute extends PageRouteInfo<CryptoChartRouteArgs> {
  CryptoChartRoute({
    Key? key,
    String? symbol,
    List<PageRouteInfo>? children,
  }) : super(
          CryptoChartRoute.name,
          args: CryptoChartRouteArgs(
            key: key,
            symbol: symbol,
          ),
          rawQueryParams: {'symbol': symbol},
          initialChildren: children,
        );

  static const String name = 'CryptoChartRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<CryptoChartRouteArgs>(
          orElse: () =>
              CryptoChartRouteArgs(symbol: queryParams.optString('symbol')));
      return CryptoChartView(
        key: args.key,
        symbol: args.symbol,
      );
    },
  );
}

class CryptoChartRouteArgs {
  const CryptoChartRouteArgs({
    this.key,
    this.symbol,
  });

  final Key? key;

  final String? symbol;

  @override
  String toString() {
    return 'CryptoChartRouteArgs{key: $key, symbol: $symbol}';
  }
}

/// generated route for
/// [CryptoMarketView]
class CryptoMarketRoute extends PageRouteInfo<void> {
  const CryptoMarketRoute({List<PageRouteInfo>? children})
      : super(
          CryptoMarketRoute.name,
          initialChildren: children,
        );

  static const String name = 'CryptoMarketRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CryptoMarketView();
    },
  );
}
