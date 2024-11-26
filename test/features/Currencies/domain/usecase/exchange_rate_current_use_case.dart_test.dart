import 'package:action_labs/features/currencies/domain/repository/current_exchange_rate_repository.dart';
import 'package:action_labs/features/currencies/domain/usecase/get_exchange_rate_current_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/exchange_rate_current_mock.dart';
import '../../utils/stubs.dart';

void main() {
  late CurrentExchangeRateRepository exchangeRateCurrentRepository;
  late GetExchangeRateCurrentUseCase subject;

  const fromSymbol = "USD";
  const toSymbol = "BRL";

  // Act
  setUpAll(() {
    exchangeRateCurrentRepository = ExchangeRateCurrentMock();
    subject = GetExchangeRateCurrentUseCase(exchangeRateCurrentRepository);
  });

  // Arrange
  group("GetExchangeRateCurrentUseCase: ", () {
    test('Should return a exchange rate current', () async {
      when(() => exchangeRateCurrentRepository.getExchangeRate(
              fromSymbol: fromSymbol, toSymbol: toSymbol))
          .thenAnswer((_) => Future.value(exchangeRateCurrentMock));

      final result = await subject.getExchangeRateCurrent(
          fromSymbol: fromSymbol, toSymbol: toSymbol);

      // Assert
      expect(result, exchangeRateCurrentMock);
    });
  });
}
