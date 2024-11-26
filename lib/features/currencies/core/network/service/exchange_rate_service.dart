import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../data/models/current_exchange_rate_response.dart';
part 'exchange_rate_service.g.dart';

@JsonSerializable()
@RestApi(baseUrl: "https://api-brl-exchange.actionlabs.com.br/api/1.0")
abstract class ExchangeRateService {
  factory ExchangeRateService(Dio dio, {String baseUrl}) = _ExchangeRateService;

  @GET('/open/currentExchangeRate')
  Future<CurrentExchangeRateResponse> getCurrentExchangeRate({
    @Query("from_symbol") required String fromSymbol,
    @Query("to_symbol") required String toSymbol,
  });
}

