import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../lib.dart';

part 'crypto_watchlist_state.freezed.dart';
part 'crypto_watchlist_state.g.dart';

@freezed
class CryptoWatchlistState with _$CryptoWatchlistState {
  const factory CryptoWatchlistState.initial() = _Initial;
  const factory CryptoWatchlistState.loading() = _Loading;
  const factory CryptoWatchlistState.loaded(
      {required List<CryptoData> cryptoWatchList}) = _Loaded;
  const factory CryptoWatchlistState.error({required String message}) = _Error;

  factory CryptoWatchlistState.fromJson(Map<String, dynamic> json) =>
      _$CryptoWatchlistStateFromJson(json);
}
