
import 'package:eyo_bingo/core/service/hive_service.dart';
import 'package:eyo_bingo/core/service/socket_service.dart';
import 'package:eyo_bingo/shared/routes/app_route.dart';
import 'package:get_it/get_it.dart';
import 'core/service/internet_connectivity_service.dart';
import 'core/service/local_storage_service.dart';
import 'core/service/token_refreshing_service.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator({String prefixBox = ''}) async {

  // Core Services
  sl.registerSingleton<HiveService>(HiveService());
  sl.registerSingleton<SocketService>(SocketService());
  
  //router
  sl.registerSingleton<AppRouter>(AppRouter());

  final localStorageService= LocalStorageService();
  sl.registerLazySingleton<LocalStorageService>(() => localStorageService);
  // sl.registerSingleton<AppRouter>(AppRouter(localStorageService.getIsDoneOnboarding()));
  sl.registerSingleton<AppConnectivity>(AppConnectivity());
  sl.registerSingleton<TokenRefreshService>(TokenRefreshService());


}