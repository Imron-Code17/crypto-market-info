import 'package:dartz/dartz.dart';

import '../../../lib.dart';

abstract class CryptoMarketRepository {
  Future<Either<Failure, Stream<CryptoData>>> getCryptoWatchlist();
  Future<Either<Failure, Stream<CryptoData>>> getCryptoCurrentPrice(
      String symbol);
  Future<Either<Failure, bool>> unsubscribe(String symbols);
}
