import 'package:flutter/material.dart';

import '../../../lib.dart';

class WatchlistItem extends StatelessWidget {
  const WatchlistItem(
      {super.key,
      this.onTap,
      required this.cryptoData,
      required this.chgMinus,
      required this.chgPercentageMinus});

  final Function()? onTap;
  final CryptoData cryptoData;
  final bool chgMinus;
  final bool chgPercentageMinus;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(color: Colors.white30, width: .8),
                  bottom: BorderSide(color: Colors.white30, width: .8))),
          child: Row(
            children: [
              Expanded(
                  flex: 6,
                  child: Row(
                    children: [
                      AppIcon(
                          (cryptoData.tickerCode?.startsWith('BTC') ?? false)
                              ? AppIcons.btc
                              : AppIcons.eth,
                          size: 14),
                      const SizedBox(width: 6),
                      Text(cryptoData.tickerCode?.twoDecimalPlaces ?? '',
                          style: context.textTheme.labelMedium
                              ?.copyWith(color: Colors.white)),
                    ],
                  )),
              const SizedBox(width: 8),
              Expanded(
                  flex: 3,
                  child: Text(
                      cryptoData.lastPrice?.twoDecimalPlacesCurrency ?? '',
                      style: context.textTheme.labelMedium
                          ?.copyWith(color: Colors.white))),
              const SizedBox(width: 8),
              Expanded(
                  flex: 3,
                  child: Text(
                      cryptoData.dailyDifferentPrice?.twoDecimalPlaces ?? '',
                      style: context.textTheme.labelMedium?.copyWith(
                        color: chgMinus ? Colors.red : Colors.green,
                      ))),
              const SizedBox(width: 8),
              Expanded(
                flex: 3,
                child: Text(
                  "${cryptoData.dailyChange?.twoDecimalPlaces}%",
                  style: context.textTheme.labelMedium?.copyWith(
                    color: chgPercentageMinus ? Colors.red : Colors.green,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
