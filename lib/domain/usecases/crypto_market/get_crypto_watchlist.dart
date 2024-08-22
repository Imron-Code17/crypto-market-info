import 'package:dartz/dartz.dart';
import '../../../lib.dart';

class GetCryptoWatchlistUsecase
    implements UseCase<Stream<CryptoData>, NoParams> {
  final CryptoMarketRepository repository;

  GetCryptoWatchlistUsecase(this.repository);

  @override
  Future<Either<Failure, Stream<CryptoData>>> call(NoParams params) async {
    return await repository.getCryptoWatchlist();
  }
}
