import '../../domain/entity/exchange_rate_current.dart';
import '../models/current_exchange_rate_response.dart';

abstract class CurrentExchangeRateMapper {
  ExchangeRateCurrent mapToEntity(CurrentExchangeRateResponse response);
}
