import 'package:action_labs/features/currencies/domain/repository/current_exchange_rate_repository.dart';
import 'package:mocktail/mocktail.dart';

class ExchangeRateCurrentMock extends Mock
    implements CurrentExchangeRateRepository {}
