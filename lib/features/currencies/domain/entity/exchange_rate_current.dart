class ExchangeRateCurrent {
  final int exchangeRate;
  final String fromSymbol;
  final String lastUpdatedAt;
  final bool? rateLimitExceeded;
  final bool? success;
  final String toSymbol;

  ExchangeRateCurrent(
      {required this.exchangeRate,
      required this.fromSymbol,
      required this.lastUpdatedAt,
      required this.rateLimitExceeded,
      required this.success,
      required this.toSymbol});
}
