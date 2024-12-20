import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http; // Import the http package
import 'core/utils/config.dart';
import 'features/homepage/data/datasources/salon_remote_data_source.dart';
import 'features/homepage/data/repositories_impl/salon_repository_impl.dart';
import 'features/homepage/domain/repositories/salon_repository.dart';
import 'features/homepage/domain/usecases/get_appointments_use_case.dart';
import 'core/network/network_info.dart';
import 'features/homepage/presentation/controllers/salon_controller.dart';

final sl = GetIt.instance;

void init() {
  // Core
  sl.registerLazySingleton<http.Client>(
      () => http.Client()); // Register http.Client
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  // Use cases
  sl.registerLazySingleton(() => GetAppointmentsUseCase(sl()));

//====================SALON CARD Dependency Injection ====================
// Remote Data Source
  sl.registerLazySingleton(
      () => SalonRemoteDataSource(apiUrl: AppConfig.baseUrl));

  // Register SalonRepositoryImpl
  sl.registerLazySingleton<SalonRepository>(
    () => SalonRepositoryImpl(
        remoteDataSource: SalonRemoteDataSource(apiUrl: AppConfig.baseUrl)),
  );

  // Controller
  sl.registerFactory(() => SalonController(sl()));
}
