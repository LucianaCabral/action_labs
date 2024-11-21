import 'package:action_labs/features/currencies/domain/repository/exchange_rate_current_repository.dart';
import 'package:action_labs/features/currencies/domain/usecase/exchange_rate_current_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/exchange_rate_current_mock.dart';
import '../../utils/stubs.dart';

void main() {
  late ExchangeRateCurrentRepository exchangeRateCurrentRepository;
  late ExchangeRateCurrentUseCase subject;

  setUpAll(() {
    exchangeRateCurrentRepository = ExchangeRateCurrentMock();
    subject = ExchangeRateCurrentUseCase(exchangeRateCurrentRepository);
  });
  group("ExchangeRateCurrentUseCase: ", () {
    test('Should return a exchange rate current', () async {
      when(() => exchangeRateCurrentRepository.getExchangeRateCurrent())
          .thenAnswer((_) => Future.value(exchangeRateCurrentMock));

      final result = await subject.invoke();

      expect(result, exchangeRateCurrentMock);
    });
  });
}
