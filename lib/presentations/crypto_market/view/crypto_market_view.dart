import 'package:auto_route/auto_route.dart';
import 'package:crypto_market_info/presentations/crypto_market/cubit/crypto_watchlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../lib.dart';

@RoutePage()
class CryptoMarketView extends StatefulWidget {
  const CryptoMarketView({super.key});

  @override
  State<CryptoMarketView> createState() => _CryptoMarketViewState();
}

class _CryptoMarketViewState extends State<CryptoMarketView> {
  @override
  void dispose() {
    context.read<CryptoWatchlistCubit>().unsubscribe('BTC-USD,ETH-USD');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      appBar: AppBar(
        centerTitle: false,
        title: Text('Crypto Watchlist',
            style: context.textTheme.bodyLarge?.copyWith(color: Colors.white)),
      ),
      body: BlocBuilder<CryptoWatchlistCubit, CryptoWatchlistState>(
        builder: (context, state) {
          return state.when(
            initial: () =>
                const Center(child: Text('Press button to fetch data')),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (cryptoWatchList) {
              return Column(
                children: [
                  _buildTitleBar(context),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cryptoWatchList.length,
                    itemBuilder: (context, index) {
                      final cryptoData = cryptoWatchList[index];
                      bool chgPercentageMinus = (double.tryParse(cryptoData
                                          .dailyChange?.twoDecimalPlaces ??
                                      '0') ??
                                  0) <
                              0
                          ? true
                          : false;
                      bool chgMinus = (double.tryParse(cryptoData
                                          .dailyChange?.twoDecimalPlaces ??
                                      '0') ??
                                  0) <
                              0
                          ? true
                          : false;
                      return WatchlistItem(
                          onTap: () {
                            context
                                .read<CryptoWatchlistCubit>()
                                .unsubscribe('BTC-USD,ETH-USD');
                            router.push(CryptoChartRoute(
                                symbol: cryptoData.tickerCode ?? ''));
                          },
                          cryptoData: cryptoData,
                          chgMinus: chgMinus,
                          chgPercentageMinus: chgPercentageMinus);
                    },
                  ),
                ],
              );
            },
            error: (message) => Center(child: Text(message)),
          );
        },
      ),
    );
  }

  Widget _buildTitleBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
              flex: 6,
              child: Text('Symbol',
                  style: context.textTheme.labelLarge
                      ?.copyWith(color: Colors.white54))),
          const SizedBox(width: 8),
          Expanded(
              flex: 3,
              child: Text('Last',
                  style: context.textTheme.labelLarge
                      ?.copyWith(color: Colors.white54))),
          const SizedBox(width: 8),
          Expanded(
              flex: 3,
              child: Text('Chg',
                  style: context.textTheme.labelLarge
                      ?.copyWith(color: Colors.white54))),
          const SizedBox(width: 8),
          Expanded(
              flex: 3,
              child: Text('Chg%',
                  style: context.textTheme.labelLarge
                      ?.copyWith(color: Colors.white54))),
        ],
      ),
    );
  }
}
