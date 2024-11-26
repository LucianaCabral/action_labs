import 'package:equatable/equatable.dart';

import '../../domain/entity/exchange_rate_current.dart';

abstract class CurrentExchangeRateState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CurrentExchangeRateInitial extends CurrentExchangeRateState {}

class CurrentExchangeRateLoading extends CurrentExchangeRateState {}

class CurrentExchangeRateLoaded extends CurrentExchangeRateState {
  final ExchangeRateCurrent exchangeRate;

  CurrentExchangeRateLoaded(this.exchangeRate);

  @override
  List<Object?> get props => [exchangeRate];
}

class CurrentExchangeRateError extends CurrentExchangeRateState {
  final String message;

  CurrentExchangeRateError(this.message);

  @override
  List<Object?> get props => [message];
}
