

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ipo_tracker/feature/data/data_source/ipo_data_source.dart';
import 'package:ipo_tracker/feature/data/data_source/ipo_detail_data_source.dart';
import 'package:ipo_tracker/feature/data/data_source/market_data_source.dart';
import 'package:ipo_tracker/feature/data/data_source/sme_data_source.dart';
import 'package:ipo_tracker/feature/data/data_source/sme_detail_data_source.dart';
import 'package:ipo_tracker/feature/data/repositories_impl/ipo_detail_repo_impl.dart';
import 'package:ipo_tracker/feature/data/repositories_impl/ipo_repo_impl.dart';
import 'package:ipo_tracker/feature/data/repositories_impl/market_repo_impl.dart';
import 'package:ipo_tracker/feature/data/repositories_impl/sme_detail_repo_impl.dart';
import 'package:ipo_tracker/feature/data/repositories_impl/sme_repo_impl.dart';
import 'package:ipo_tracker/feature/domain/repositories/ipo_detail_repo.dart';
import 'package:ipo_tracker/feature/domain/repositories/ipo_repo.dart';
import 'package:ipo_tracker/feature/domain/repositories/sme_detail_repo.dart';
import 'package:ipo_tracker/feature/domain/use_cases/ipo_detail_use_case.dart';
import 'package:ipo_tracker/feature/domain/use_cases/ipo_use_case.dart';
import 'package:ipo_tracker/feature/domain/use_cases/market_use_case.dart';
import 'package:ipo_tracker/feature/domain/use_cases/sme_detail_use_case.dart';
import 'package:ipo_tracker/feature/domain/use_cases/sme_use_case.dart';
import 'package:ipo_tracker/feature/presentation/state_management/current_ipo_provider.dart';
import 'package:ipo_tracker/feature/presentation/state_management/current_sme_provider.dart';
import 'package:ipo_tracker/feature/presentation/state_management/home_page_provider.dart';
import 'package:ipo_tracker/feature/presentation/state_management/ipo_provider.dart';
import 'package:ipo_tracker/feature/presentation/state_management/listed_ipo_provider.dart';
import 'package:ipo_tracker/feature/presentation/state_management/market_provider.dart';
import 'package:ipo_tracker/feature/presentation/state_management/sme_detail_provider.dart';

import '../common/api_handler/api_client.dart';
import '../common/api_handler/dio_client.dart';
import '../feature/domain/repositories/market_repo.dart';
import '../feature/domain/repositories/sme_repo.dart';
import '../feature/presentation/state_management/ipo_detail_provider.dart';
import '../feature/presentation/state_management/listed_sme_provider.dart';
import '../feature/presentation/state_management/sme_provider.dart';
import '../firebase/analytic_observer.dart';
import '../router/navigation_service.dart';
import '../secure_storage/flutter_secure_storege_instance.dart';
import '../themes/app_theme.dart';
import '../util/constants/api_end_point_constant.dart';


GetIt getIt = GetIt.instance;


// inject all class as singleton using get_it
Future<void> init() async {

  //single key use service
  getIt..registerLazySingleton<NavigationService>(() => NavigationService())

  //--DIO--//
  ..registerLazySingleton<DioClient>(() => DioClient())
  ..registerLazySingleton<ApiWrapper>(() => ApiWrapper(dioClient: getIt.call(),cancelToken: getIt.call()))

  //--DIO--//
  ..registerLazySingleton<Dio>(() => Dio( baseOptions,))
  ..registerLazySingleton<CancelToken>(() => CancelToken())
  ..registerLazySingleton<SecureSharedPreInstance>(() => SecureSharedPreInstance())

  ..registerLazySingleton<ObserverAnalytics>(() => ObserverAnalytics())


  ..registerFactory(() => AppThemeNotifier())
  ..registerFactory(() => IpoProvider())
  ..registerFactory(() => HomePageProvider())
  ..registerFactory(() => CurrentIpoProvider())
  ..registerFactory(() => ListedIpoProvider())
  ..registerFactory(() => IpoDetailProvider())

  ..registerFactory(() => SmeProvider())
  ..registerFactory(() => CurrentSmeProvider())
  ..registerFactory(() => ListedSmeProvider())

  ..registerFactory(() => SmeDetailProvider())
  ..registerFactory(() => MarketProvider())



  ..registerLazySingleton<IpoDataSource>(() =>IpoDataSourceImpl())
  ..registerLazySingleton<IpoRepo>(() =>IpoRepoImpl())
  ..registerLazySingleton<IpoUseCases>(() =>IpoUseCases())

  ..registerLazySingleton<IpoDetailDataSource>(() =>IpoDetailDataSourceImpl())
  ..registerLazySingleton<IpoDetailRepo>(() =>IpoDetailRepoImpl())
  ..registerLazySingleton<IpoDetailUseCases>(() =>IpoDetailUseCases())

  ..registerLazySingleton<SmeDataSource>(() =>SmeDataSourceImpl())
  ..registerLazySingleton<SmeRepo>(() =>SmeRepoImpl())
  ..registerLazySingleton<SmeUseCases>(() =>SmeUseCases())

  ..registerLazySingleton<SmeDetailDataSource>(() =>SmeDetailDataSourceImpl())
  ..registerLazySingleton<SmeDetailRepo>(() =>SmeDetailRepoImpl())
  ..registerLazySingleton<SmeDetailUseCases>(() =>SmeDetailUseCases())

    ..registerLazySingleton<MarketDataSource>(() =>MarketDataSourceImpl())
    ..registerLazySingleton<MarketRepo>(() =>MarketRepoImpl())
    ..registerLazySingleton<MarketUseCases>(() =>MarketUseCases());
}

//--Base Option for Dio--//
BaseOptions baseOptions = BaseOptions(
    baseUrl: APIEndPoint.baseURL,
    connectTimeout:APIEndPoint.timeOut,
    sendTimeout:APIEndPoint.timeOut,
    receiveTimeout:APIEndPoint.timeOut,
    contentType: Headers.jsonContentType);