import 'package:eyo_bingo/core/service/dio_service.dart';
import 'package:eyo_bingo/core/service/hive_service.dart';
import 'package:eyo_bingo/core/service/socket_service.dart';
import 'package:eyo_bingo/features/admin/data/datasources/admin_remote_datasource.dart';
import 'package:eyo_bingo/features/admin/data/datasources/super_admin_remotedatasoursce.dart';
import 'package:eyo_bingo/features/admin/data/repositories/admin_repository_impl.dart';
import 'package:eyo_bingo/features/admin/data/repositories/super_admin_repository_impl.dart';
import 'package:eyo_bingo/features/admin/domain/repositories/admin_repository.dart';
import 'package:eyo_bingo/features/admin/domain/repositories/super_admin_repository.dart';
import 'package:eyo_bingo/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:eyo_bingo/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:eyo_bingo/features/auth/domain/repositories/auth_repository.dart';
import 'package:eyo_bingo/features/number_bingo/data/datasources/number_bingo_remote_datasource.dart';
import 'package:eyo_bingo/features/number_bingo/data/repositories/number_bingo_repository_impl.dart';
import 'package:eyo_bingo/features/number_bingo/domain/repositories/number_bingo_repository.dart';
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
  sl.registerLazySingleton<DioHttpClient>(() => DioHttpClient());

  //router
  sl.registerSingleton<AppRouter>(AppRouter());

  final localStorageService = LocalStorageService();
  sl.registerLazySingleton<LocalStorageService>(() => localStorageService);
  // sl.registerSingleton<AppRouter>(AppRouter(localStorageService.getIsDoneOnboarding()));
  sl.registerSingleton<AppConnectivity>(AppConnectivity());
  sl.registerSingleton<TokenRefreshService>(TokenRefreshService());

  // ============= NUMBER BINGO INTEGRATION =============

  // Auth
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(sl()),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl(), sl()),
  );

  // Number Bingo
  sl.registerLazySingleton<NumberBingoRemoteDataSource>(
    () => NumberBingoRemoteDataSource(sl()),
  );
  sl.registerLazySingleton<NumberBingoRepository>(
    () => NumberBingoRepositoryImpl(sl()),
  );

  // Admin
  sl.registerLazySingleton<AdminRemoteDataSource>(
    () => AdminRemoteDataSource(sl()),
  );
  sl.registerLazySingleton<AdminRepository>(() => AdminRepositoryImpl(sl()));

  // Super Admin
  sl.registerLazySingleton<SuperAdminRemoteDataSource>(
    () => SuperAdminRemoteDataSource(sl()),
  );
  sl.registerLazySingleton<SuperAdminRepository>(() => SuperAdminRepositoryImpl(sl()));
}
