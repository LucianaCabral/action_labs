import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../currencies/data/mapper/current_exchange_rate_mapper.dart';
import '../../currencies/data/mapper/current_exchange_rate_mapper_impl.dart';
import '../../currencies/data/repository/current_exchange_rate_repository_impl.dart';
import '../../currencies/data/source/current_exchange_rate_data_source.dart';
import '../../currencies/data/source/current_exchange_rate_data_source_impl.dart';
import '../../currencies/domain/repository/current_exchange_rate_repository.dart';
import '../../currencies/domain/usecase/get_exchange_rate_current_use_case.dart';
import '../network/ApiClient.dart';
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
}
