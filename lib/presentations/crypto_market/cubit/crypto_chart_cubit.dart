import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import '../../../lib.dart';
import 'crypto_chart_state.dart';

class CryptoChartCubit extends HydratedCubit<CryptoChartState> {
  CryptoChartCubit(
      this._getCryptoCurrentPriceUsecase, this._unsubscribeChannelUsecase)
      : super(const CryptoChartState.initial());
  final GetCryptoCurrentPrice _getCryptoCurrentPriceUsecase;
  final UnsubscribeChannelUsecase _unsubscribeChannelUsecase;

  final List<CryptoData> _cryptoData = [];
  StreamSubscription? streamSubscription;

  Future<void> fetchCryptoCurrentPrice(String symbol) async {
    emit(const CryptoChartState.loading());
    final result = await _getCryptoCurrentPriceUsecase(symbol);
    result.fold(
      (failure) =>
          emit(const CryptoChartState.error(message: 'Failed to fetch data')),
      (socketResponse) {
        streamSubscription = socketResponse
            .throttleTime(const Duration(seconds: 1))
            .listen((cryptoData) {
          if (cryptoData.tickerCode != null &&
              cryptoData.timestamp != null &&
              (double.tryParse(cryptoData.lastPrice ?? '') ?? 0) > 0) {
            DateTime dateTime =
                DateTime.fromMillisecondsSinceEpoch(cryptoData.timestamp!);
            String formattedDate =
                DateFormat('dd/MM/yyyy HH:mm:ss').format(dateTime);
            bool alreadyExists = _cryptoData.any((data) {
              DateTime existingDateTime =
                  DateTime.fromMillisecondsSinceEpoch(data.timestamp!);
              return DateFormat('dd/MM/yyyy HH:mm:ss')
                      .format(existingDateTime) ==
                  formattedDate;
            });

            if (!alreadyExists) {
              _cryptoData.add(cryptoData);
              emit(CryptoChartState.loaded(datas: List.from(_cryptoData)));
            }
          }
        });
      },
    );
  }

  Future<void> unsubscribe(String symbols) async {
    final result = await _unsubscribeChannelUsecase(symbols);
    result.fold(
      (failure) =>
          emit(const CryptoChartState.error(message: 'Failed to fetch data')),
      (success) {
        _cryptoData.clear();
        streamSubscription?.cancel();
      },
    );
  }

  @override
  CryptoChartState? fromJson(Map<String, dynamic> json) {
    return CryptoChartState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(CryptoChartState state) {
    return state.toJson();
  }
}
