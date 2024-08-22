import 'package:auto_route/auto_route.dart';
import 'package:crypto_market_info/lib.dart';
import 'package:crypto_market_info/presentations/crypto_market/cubit/crypto_chart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CryptoChartView extends StatefulWidget {
  final String? symbol;
  const CryptoChartView({super.key, @QueryParam('symbol') this.symbol});

  @override
  State<CryptoChartView> createState() => _CryptoChartViewState();
}

class _CryptoChartViewState extends State<CryptoChartView> {
  late CryptoChartCubit _cryptoChartCubit;
  late CryptoWatchlistCubit _cryptoWatchlistCubit;

  @override
  void initState() {
    super.initState();
    _cryptoChartCubit = di<CryptoChartCubit>();
    _cryptoWatchlistCubit = di<CryptoWatchlistCubit>();
    _cryptoChartCubit.fetchCryptoCurrentPrice(widget.symbol ?? '');
  }

  @override
  void dispose() {
    _cryptoChartCubit.unsubscribe(widget.symbol ?? '');
    if (mounted) {
      _cryptoWatchlistCubit.fetchCryptoWatchlist();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: BlocBuilder<CryptoChartCubit, CryptoChartState>(
              builder: (context, state) {
            return state.when(
              initial: () =>
                  const Center(child: Text('Press button to fetch data')),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (data) {
                List<double> prices = data
                    .map((e) => double.tryParse(e.lastPrice ?? '') ?? 0)
                    .toList();
                return TradingViewWidgetHtml(
                    symbol: widget.symbol ?? '', prices: prices);
              },
              error: (message) => Center(child: Text(message)),
            );
          }),
        ));
  }
}
