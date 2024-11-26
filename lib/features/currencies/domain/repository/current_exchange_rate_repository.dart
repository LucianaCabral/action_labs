import '../entity/exchange_rate_current.dart';

abstract class CurrentExchangeRateRepository {
  Future<ExchangeRateCurrent> getExchangeRate({
    required String fromSymbol,
    required String toSymbol,
  });
}
