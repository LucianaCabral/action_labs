import '../../../domain/entity/exchange_rate_current.dart';
import '../../network/service/exchange_rate_service.dart';
import '../mapper/current_exchange_rate_mapper.dart';
import 'current_exchange_rate_data_source.dart';

class CurrentExchangeRateDataSourceImpl
    implements CurrentExchangeRateDataSource {
  final ExchangeRateService service;
  final CurrentExchangeRateMapper mapper;

  CurrentExchangeRateDataSourceImpl({
    required this.service,
    required this.mapper,
  });

  @override
  Future<ExchangeRateCurrent> getExchangeRateCurrent(
    String fromSymbol,
    String toSymbol,
  ) async {
    try {
      final response = await service.getCurrentExchangeRate(
        fromSymbol: fromSymbol,
        toSymbol: toSymbol,
      );
      return mapper.mapToEntity(response);
    } catch (e) {
      throw Exception('Erro ao obter taxa de câmbio: $e');
    }
  }
}
