import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../lib.dart';
part 'crypto_chart_state.freezed.dart';
part 'crypto_chart_state.g.dart';

@freezed
class CryptoChartState with _$CryptoChartState {
  const factory CryptoChartState.initial() = _Initial;
  const factory CryptoChartState.loading() = _Loading;
  const factory CryptoChartState.loaded({required List<CryptoData> datas}) =
      _Loaded;
  const factory CryptoChartState.error({required String message}) = _Error;

  factory CryptoChartState.fromJson(Map<String, dynamic> json) =>
      _$CryptoChartStateFromJson(json);
}
