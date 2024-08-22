// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CryptoDataImpl _$$CryptoDataImplFromJson(Map<String, dynamic> json) =>
    _$CryptoDataImpl(
      tickerCode: json['s'] as String?,
      lastPrice: json['p'] as String?,
      quantityOfTrade: json['q'] as String?,
      dailyChange: json['dc'] as String?,
      dailyDifferentPrice: json['dd'] as String?,
      timestamp: (json['t'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CryptoDataImplToJson(_$CryptoDataImpl instance) =>
    <String, dynamic>{
      's': instance.tickerCode,
      'p': instance.lastPrice,
      'q': instance.quantityOfTrade,
      'dc': instance.dailyChange,
      'dd': instance.dailyDifferentPrice,
      't': instance.timestamp,
    };
