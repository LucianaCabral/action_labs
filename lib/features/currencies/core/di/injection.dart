import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../domain/repository/current_exchange_rate_repository.dart';
import '../../domain/usecase/get_exchange_rate_current_use_case.dart';
import '../../presentation/bloc/current_exchange_rate_bloc.dart';
import '../api_client.dart';
import '../data/mapper/current_exchange_rate_mapper.dart';
import '../data/mapper/current_exchange_rate_mapper_impl.dart';
import '../data/repository/current_exchange_rate_repository_impl.dart';
import '../data/source/current_exchange_rate_data_source.dart';
import '../data/source/current_exchange_rate_data_source_impl.dart';
import '../network/service/exchange_rate_service.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  final apiClient = await ApiClient.create();
  getIt.registerSingleton<Dio>(apiClient.dio);

  getIt.registerSingleton<ExchangeRateService>(
    ExchangeRateService(getIt<Dio>()),
  );

  getIt.registerSingleton<CurrentExchangeRateMapper>(
    CurrentExchangeRateMapperImpl(),
  );

  getIt.registerSingleton<CurrentExchangeRateDataSource>(
    CurrentExchangeRateDataSourceImpl(
      service: getIt<ExchangeRateService>(),
      mapper: getIt<CurrentExchangeRateMapper>(),
    ),
  );

  getIt.registerSingleton<CurrentExchangeRateRepository>(
      CurrentExchangeRateRepositoryImpl(
          remoteDataSource: getIt<CurrentExchangeRateDataSource>()));
  getIt.registerLazySingleton<GetExchangeRateCurrentUseCase>(
    () => GetExchangeRateCurrentUseCase(getIt<CurrentExchangeRateRepository>()),
  );
  getIt.registerFactory<CurrentExchangeRateBloc>(
      () => CurrentExchangeRateBloc(getIt<GetExchangeRateCurrentUseCase>()));
}
