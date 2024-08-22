import 'package:dartz/dartz.dart';
import '../../../lib.dart';

class GetCryptoCurrentPrice implements UseCase<Stream<CryptoData>, String> {
  final CryptoMarketRepository repository;

  GetCryptoCurrentPrice(this.repository);

  @override
  Future<Either<Failure, Stream<CryptoData>>> call(String params) async {
    return await repository.getCryptoCurrentPrice(params);
  }
}
