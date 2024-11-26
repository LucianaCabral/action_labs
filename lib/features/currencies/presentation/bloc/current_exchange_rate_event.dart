import 'package:equatable/equatable.dart';

abstract class CurrentExchangeRateEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadCurrentExchangeRate extends CurrentExchangeRateEvent {
  final String fromSymbol;
  final String toSymbol;

  LoadCurrentExchangeRate({required this.fromSymbol, required this.toSymbol});

  @override
  List<Object?> get props => [fromSymbol, toSymbol];
}
