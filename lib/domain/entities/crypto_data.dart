// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_data.freezed.dart';
part 'crypto_data.g.dart';

@freezed
class CryptoData with _$CryptoData {
  const factory CryptoData({
    @JsonKey(name: 's') String? tickerCode,
    @JsonKey(name: 'p') String? lastPrice,
    @JsonKey(name: 'q') String? quantityOfTrade,
    @JsonKey(name: 'dc') String? dailyChange,
    @JsonKey(name: 'dd') String? dailyDifferentPrice,
    @JsonKey(name: 't') int? timestamp,
  }) = _CryptoData;

  factory CryptoData.fromJson(Map<String, dynamic> json) =>
      _$CryptoDataFromJson(json);
}
