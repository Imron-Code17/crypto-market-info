import 'package:dartz/dartz.dart';
import '../../../lib.dart';

class CryptoMarketRepositoryImpl implements CryptoMarketRepository {
  final CryptoMarketApi _api;
  final NetworkInfo _networkInfo;
  CryptoMarketRepositoryImpl(this._api, this._networkInfo);
  @override
  Future<Either<Failure, Stream<CryptoData>>> getCryptoWatchlist() async {
    if (!await _networkInfo.isConnected) {
      return Left(Failure.noConnection());
    }
    try {
      final response = await _api.getCryptoWatchlist();
      if (!response.success) return Left(Failure.serverError(response.message));
      return Right(response.data!);
    } catch (e) {
      return Left(Failure.parseFromException(e));
    }
  }

  @override
  Future<Either<Failure, Stream<CryptoData>>> getCryptoCurrentPrice(
      String symbol) async {
    if (!await _networkInfo.isConnected) {
      return Left(Failure.noConnection());
    }
    try {
      final response = await _api.getCryptoCurrentPrice(symbol);
      if (!response.success) return Left(Failure.serverError(response.message));
      return Right(response.data!);
    } catch (e) {
      return Left(Failure.parseFromException(e));
    }
  }

  @override
  Future<Either<Failure, bool>> unsubscribe(String symbols) async {
    if (!await _networkInfo.isConnected) {
      return Left(Failure.noConnection());
    }
    try {
      final response = await _api.unsubscribe(symbols);
      if (!response.success) return Left(Failure.serverError(response.message));
      return Right(response.data!);
    } catch (e) {
      return Left(Failure.parseFromException(e));
    }
  }
}
