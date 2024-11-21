class ExchangeRateCurrent {
  final int exchangeRate;
  final String fromSymbol;
  final String lastPlaceAt;
  final bool rateLimitExceed;
  final bool success;
  final String toSymbol;

  ExchangeRateCurrent(
      {required this.exchangeRate,
      required this.fromSymbol,
      required this.lastPlaceAt,
      required this.rateLimitExceed,
      required this.success,
      required this.toSymbol});
}
