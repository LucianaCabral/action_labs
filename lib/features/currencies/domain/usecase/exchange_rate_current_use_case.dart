
import 'package:action_labs/features/currencies/domain/entity/exchange_rate_current.dart';
import 'package:action_labs/features/currencies/domain/repository/exchange_rate_current_repository.dart';

class ExchangeRateCurrentUseCase {
 final  ExchangeRateCurrentRepository repository;

  ExchangeRateCurrentUseCase(this.repository);

 Future<ExchangeRateCurrent> invoke() => repository.getExchangeRateCurrent();
}