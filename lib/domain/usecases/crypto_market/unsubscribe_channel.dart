import 'package:dartz/dartz.dart';
import '../../../lib.dart';

class UnsubscribeChannelUsecase implements UseCase<bool, String> {
  final CryptoMarketRepository repository;

  UnsubscribeChannelUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(String params) async {
    return await repository.unsubscribe(params);
  }
}
