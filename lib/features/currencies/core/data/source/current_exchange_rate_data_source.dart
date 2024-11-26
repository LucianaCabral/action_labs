import '../../../domain/entity/exchange_rate_current.dart';

abstract class CurrentExchangeRateDataSource {
  Future<ExchangeRateCurrent> getExchangeRateCurrent(
      String fromSymbol,
      String toSymbol,
      );
}