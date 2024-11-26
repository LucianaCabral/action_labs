import 'package:json_annotation/json_annotation.dart';
part 'current_exchange_rate_response.g.dart';

@JsonSerializable()
class CurrentExchangeRateResponse {
  final int exchangeRate;
  final String fromSymbol;
  final String toSymbol;
  final String lastUpdatedAt;
  final bool? rateLimitExceeded;
  final bool? success;

  CurrentExchangeRateResponse({
    required this.exchangeRate,
    required this.fromSymbol,
    required this.toSymbol,
    required this.lastUpdatedAt,
    required this.rateLimitExceeded,
    required this.success,
  });

  factory CurrentExchangeRateResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrentExchangeRateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentExchangeRateResponseToJson(this);

}


