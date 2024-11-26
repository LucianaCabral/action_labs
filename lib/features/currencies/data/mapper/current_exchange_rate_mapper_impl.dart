import '../../domain/entity/exchange_rate_current.dart';
import '../models/current_exchange_rate_response.dart';
import 'current_exchange_rate_mapper.dart';

class CurrentExchangeRateMapperImpl extends CurrentExchangeRateMapper {
  @override
  ExchangeRateCurrent mapToEntity(
      CurrentExchangeRateResponse currentExchangeRateResponse) {
    return ExchangeRateCurrent(
        exchangeRate: currentExchangeRateResponse.exchangeRate,
        fromSymbol: currentExchangeRateResponse.fromSymbol,
        lastUpdatedAt: currentExchangeRateResponse.lastUpdatedAt,
        rateLimitExceeded:
            currentExchangeRateResponse.rateLimitExceeded ?? false,
        success: currentExchangeRateResponse.success ?? false,
        toSymbol: currentExchangeRateResponse.toSymbol);
  }
}
