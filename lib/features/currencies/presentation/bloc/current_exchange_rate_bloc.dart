import 'package:action_labs/features/currencies/domain/usecase/get_exchange_rate_current_use_case.dart';
import 'package:action_labs/features/currencies/presentation/resources/strings_path.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'current_exchange_rate_event.dart';
import 'current_exchange_rate_state.dart';

class CurrentExchangeRateBloc
    extends Bloc<CurrentExchangeRateEvent, CurrentExchangeRateState> {
  final GetExchangeRateCurrentUseCase useCase;

  CurrentExchangeRateBloc(this.useCase) : super(CurrentExchangeRateInitial()) {
    print("CurrentExchangeRateBloc initialized");
    on<LoadCurrentExchangeRate>(_onLoadExchangeRate);
  }

    Future<void> _onLoadExchangeRate(
      LoadCurrentExchangeRate event, Emitter<CurrentExchangeRateState> emit) async {
    emit(CurrentExchangeRateLoading());

    try {
      final exchangeRate = await useCase.getExchangeRateCurrent(
        fromSymbol: event.fromSymbol,
        toSymbol: event.toSymbol,
      );
      emit(CurrentExchangeRateLoaded(exchangeRate));
    } catch (e) {
      emit(CurrentExchangeRateError(StringPath.errorMessage));    }
  }
}
