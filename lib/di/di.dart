// ignore_for_file: avoid_print

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../lib.dart';

final di = GetIt.I;

setupInjection() {
  try {
    _utils();
    _datasources();
    _repositories();
    _useCases();
    _cubits();
  } catch (e) {
    print(e);
  }
}

void _datasources() {
  di.registerSingleton<CryptoMarketApi>(CryptoMarketApiImpl(di()));
}

void _repositories() {
  di.registerSingleton<CryptoMarketRepository>(
      CryptoMarketRepositoryImpl(di(), di()));
}

void _useCases() {
  di.registerSingleton<GetCryptoWatchlistUsecase>(
      GetCryptoWatchlistUsecase(di()));
  di.registerSingleton<GetCryptoCurrentPrice>(GetCryptoCurrentPrice(di()));
  di.registerSingleton<UnsubscribeChannelUsecase>(
      UnsubscribeChannelUsecase(di()));
}

void _cubits() {
  di.registerSingleton<CryptoWatchlistCubit>(CryptoWatchlistCubit(di(), di()));
  di.registerSingleton<CryptoChartCubit>(CryptoChartCubit(di(), di()));
}

void _utils() {
  di.registerLazySingleton(
    () {
      final dio = Dio();
      dio.options.baseUrl = AppConfig.baseUrl;
      dio.interceptors.add(DioTokenInterceptor(di()));
      dio.interceptors.add(LogInterceptor());
      return dio;
    },
    // instanceName: 'dio_for_api',
  );
  di.registerSingleton(Connectivity());
  di.registerSingleton<AppRouter>(AppRouter());
  di.registerSingleton<NetworkInfo>(NetworkInfoImpl(di()));
  di.registerSingleton(WebSocketService());
}
