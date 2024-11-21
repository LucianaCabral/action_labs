import '../entity/exchange_rate_current.dart';

abstract class ExchangeRateCurrentRepository {
  Future<ExchangeRateCurrent> getExchangeRateCurrent();
}
