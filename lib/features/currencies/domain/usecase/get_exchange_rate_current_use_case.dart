import 'package:action_labs/features/currencies/domain/entity/exchange_rate_current.dart';
import 'package:action_labs/features/currencies/domain/repository/current_exchange_rate_repository.dart';

class GetExchangeRateCurrentUseCase {
  final CurrentExchangeRateRepository repository;

  GetExchangeRateCurrentUseCase(this.repository);

  Future<ExchangeRateCurrent> getExchangeRateCurrent({
    required String fromSymbol,
    required String toSymbol,
  }) async {
    return await repository.getExchangeRate(
      fromSymbol: fromSymbol,
      toSymbol: toSymbol,
    );
  }
}
