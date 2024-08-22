// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CryptoData _$CryptoDataFromJson(Map<String, dynamic> json) {
  return _CryptoData.fromJson(json);
}

/// @nodoc
mixin _$CryptoData {
  @JsonKey(name: 's')
  String? get tickerCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'p')
  String? get lastPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'q')
  String? get quantityOfTrade => throw _privateConstructorUsedError;
  @JsonKey(name: 'dc')
  String? get dailyChange => throw _privateConstructorUsedError;
  @JsonKey(name: 'dd')
  String? get dailyDifferentPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 't')
  int? get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CryptoDataCopyWith<CryptoData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CryptoDataCopyWith<$Res> {
  factory $CryptoDataCopyWith(
          CryptoData value, $Res Function(CryptoData) then) =
      _$CryptoDataCopyWithImpl<$Res, CryptoData>;
  @useResult
  $Res call(
      {@JsonKey(name: 's') String? tickerCode,
      @JsonKey(name: 'p') String? lastPrice,
      @JsonKey(name: 'q') String? quantityOfTrade,
      @JsonKey(name: 'dc') String? dailyChange,
      @JsonKey(name: 'dd') String? dailyDifferentPrice,
      @JsonKey(name: 't') int? timestamp});
}

/// @nodoc
class _$CryptoDataCopyWithImpl<$Res, $Val extends CryptoData>
    implements $CryptoDataCopyWith<$Res> {
  _$CryptoDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tickerCode = freezed,
    Object? lastPrice = freezed,
    Object? quantityOfTrade = freezed,
    Object? dailyChange = freezed,
    Object? dailyDifferentPrice = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      tickerCode: freezed == tickerCode
          ? _value.tickerCode
          : tickerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      lastPrice: freezed == lastPrice
          ? _value.lastPrice
          : lastPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      quantityOfTrade: freezed == quantityOfTrade
          ? _value.quantityOfTrade
          : quantityOfTrade // ignore: cast_nullable_to_non_nullable
              as String?,
      dailyChange: freezed == dailyChange
          ? _value.dailyChange
          : dailyChange // ignore: cast_nullable_to_non_nullable
              as String?,
      dailyDifferentPrice: freezed == dailyDifferentPrice
          ? _value.dailyDifferentPrice
          : dailyDifferentPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CryptoDataImplCopyWith<$Res>
    implements $CryptoDataCopyWith<$Res> {
  factory _$$CryptoDataImplCopyWith(
          _$CryptoDataImpl value, $Res Function(_$CryptoDataImpl) then) =
      __$$CryptoDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 's') String? tickerCode,
      @JsonKey(name: 'p') String? lastPrice,
      @JsonKey(name: 'q') String? quantityOfTrade,
      @JsonKey(name: 'dc') String? dailyChange,
      @JsonKey(name: 'dd') String? dailyDifferentPrice,
      @JsonKey(name: 't') int? timestamp});
}

/// @nodoc
class __$$CryptoDataImplCopyWithImpl<$Res>
    extends _$CryptoDataCopyWithImpl<$Res, _$CryptoDataImpl>
    implements _$$CryptoDataImplCopyWith<$Res> {
  __$$CryptoDataImplCopyWithImpl(
      _$CryptoDataImpl _value, $Res Function(_$CryptoDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tickerCode = freezed,
    Object? lastPrice = freezed,
    Object? quantityOfTrade = freezed,
    Object? dailyChange = freezed,
    Object? dailyDifferentPrice = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_$CryptoDataImpl(
      tickerCode: freezed == tickerCode
          ? _value.tickerCode
          : tickerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      lastPrice: freezed == lastPrice
          ? _value.lastPrice
          : lastPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      quantityOfTrade: freezed == quantityOfTrade
          ? _value.quantityOfTrade
          : quantityOfTrade // ignore: cast_nullable_to_non_nullable
              as String?,
      dailyChange: freezed == dailyChange
          ? _value.dailyChange
          : dailyChange // ignore: cast_nullable_to_non_nullable
              as String?,
      dailyDifferentPrice: freezed == dailyDifferentPrice
          ? _value.dailyDifferentPrice
          : dailyDifferentPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CryptoDataImpl implements _CryptoData {
  const _$CryptoDataImpl(
      {@JsonKey(name: 's') this.tickerCode,
      @JsonKey(name: 'p') this.lastPrice,
      @JsonKey(name: 'q') this.quantityOfTrade,
      @JsonKey(name: 'dc') this.dailyChange,
      @JsonKey(name: 'dd') this.dailyDifferentPrice,
      @JsonKey(name: 't') this.timestamp});

  factory _$CryptoDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CryptoDataImplFromJson(json);

  @override
  @JsonKey(name: 's')
  final String? tickerCode;
  @override
  @JsonKey(name: 'p')
  final String? lastPrice;
  @override
  @JsonKey(name: 'q')
  final String? quantityOfTrade;
  @override
  @JsonKey(name: 'dc')
  final String? dailyChange;
  @override
  @JsonKey(name: 'dd')
  final String? dailyDifferentPrice;
  @override
  @JsonKey(name: 't')
  final int? timestamp;

  @override
  String toString() {
    return 'CryptoData(tickerCode: $tickerCode, lastPrice: $lastPrice, quantityOfTrade: $quantityOfTrade, dailyChange: $dailyChange, dailyDifferentPrice: $dailyDifferentPrice, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CryptoDataImpl &&
            (identical(other.tickerCode, tickerCode) ||
                other.tickerCode == tickerCode) &&
            (identical(other.lastPrice, lastPrice) ||
                other.lastPrice == lastPrice) &&
            (identical(other.quantityOfTrade, quantityOfTrade) ||
                other.quantityOfTrade == quantityOfTrade) &&
            (identical(other.dailyChange, dailyChange) ||
                other.dailyChange == dailyChange) &&
            (identical(other.dailyDifferentPrice, dailyDifferentPrice) ||
                other.dailyDifferentPrice == dailyDifferentPrice) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tickerCode, lastPrice,
      quantityOfTrade, dailyChange, dailyDifferentPrice, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CryptoDataImplCopyWith<_$CryptoDataImpl> get copyWith =>
      __$$CryptoDataImplCopyWithImpl<_$CryptoDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CryptoDataImplToJson(
      this,
    );
  }
}

abstract class _CryptoData implements CryptoData {
  const factory _CryptoData(
      {@JsonKey(name: 's') final String? tickerCode,
      @JsonKey(name: 'p') final String? lastPrice,
      @JsonKey(name: 'q') final String? quantityOfTrade,
      @JsonKey(name: 'dc') final String? dailyChange,
      @JsonKey(name: 'dd') final String? dailyDifferentPrice,
      @JsonKey(name: 't') final int? timestamp}) = _$CryptoDataImpl;

  factory _CryptoData.fromJson(Map<String, dynamic> json) =
      _$CryptoDataImpl.fromJson;

  @override
  @JsonKey(name: 's')
  String? get tickerCode;
  @override
  @JsonKey(name: 'p')
  String? get lastPrice;
  @override
  @JsonKey(name: 'q')
  String? get quantityOfTrade;
  @override
  @JsonKey(name: 'dc')
  String? get dailyChange;
  @override
  @JsonKey(name: 'dd')
  String? get dailyDifferentPrice;
  @override
  @JsonKey(name: 't')
  int? get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$CryptoDataImplCopyWith<_$CryptoDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
