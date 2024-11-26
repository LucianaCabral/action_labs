import '../../domain/entity/exchange_rate_current.dart';
import '../../domain/repository/current_exchange_rate_repository.dart';
import '../source/current_exchange_rate_data_source.dart';

class CurrentExchangeRateRepositoryImpl implements CurrentExchangeRateRepository {
  final CurrentExchangeRateDataSource remoteDataSource;

  CurrentExchangeRateRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<ExchangeRateCurrent> getExchangeRate(
      {required String fromSymbol, required String toSymbol}) async {
    try {
      final ExchangeRateCurrent response =
      await remoteDataSource.getExchangeRateCurrent(
        fromSymbol,
        toSymbol,
      );
           return response;
    } catch (e) {
      throw Exception('Exception: $e');
    }
  }
}