import 'dart:async';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../../../lib.dart';
import 'crypto_watchlist_state.dart';

class CryptoWatchlistCubit extends HydratedCubit<CryptoWatchlistState> {
  CryptoWatchlistCubit(
      this._getCryptoWatchlistUsecase, this._unsubscribeChannelUsecase)
      : super(const CryptoWatchlistState.initial()) {
    fetchCryptoWatchlist();
  }
  final GetCryptoWatchlistUsecase _getCryptoWatchlistUsecase;
  final UnsubscribeChannelUsecase _unsubscribeChannelUsecase;

  final Map<String, CryptoData> _cryptoDataMap = {};
  bool isSubscribed = false;
  StreamSubscription? streamSubscription;

  Future<void> fetchCryptoWatchlist() async {
    emit(const CryptoWatchlistState.loading());
    final result = await _getCryptoWatchlistUsecase(NoParams());
    result.fold(
      (failure) => emit(
          const CryptoWatchlistState.error(message: 'Failed to fetch data')),
      (socketResponse) {
        streamSubscription = socketResponse
            .throttleTime(const Duration(seconds: 1))
            .listen((cryptoData) {
          if (cryptoData.tickerCode != null) {
            _cryptoDataMap[cryptoData.tickerCode ?? ''] = cryptoData;
          }
          emit(CryptoWatchlistState.loaded(
            cryptoWatchList: _cryptoDataMap.values.toList(),
          ));
        });
      },
    );
  }

  Future<void> unsubscribe(String symbols) async {
    final result = await _unsubscribeChannelUsecase(symbols);
    result.fold(
      (failure) => emit(
          const CryptoWatchlistState.error(message: 'Failed to fetch data')),
      (success) {
        streamSubscription?.cancel();
      },
    );
  }

  @override
  CryptoWatchlistState? fromJson(Map<String, dynamic> json) {
    return CryptoWatchlistState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(CryptoWatchlistState state) {
    return state.toJson();
  }
}
