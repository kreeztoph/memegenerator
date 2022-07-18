import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/core/network/network_info.dart';
import 'features/jokes/data/datasources/jokes_local_data_sources.dart';
import 'features/jokes/data/datasources/jokes_remote_data_source.dart';
import 'features/jokes/data/repositories/jokes_repository_impl.dart';
import 'features/jokes/domain/repositories/jokes_repository.dart';
import 'features/jokes/domain/usecases/get_jokes.dart';
import 'features/jokes/presentation/cubit/jokes_cubit.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //! features - Jokes
  //Cubit
  sl.registerFactory(
    () => JokesCubit(getJokes: sl()),
  );

  //UseCases
  sl.registerLazySingleton(
    () => GetJokes(sl()),
  );

  // Repository
  sl.registerLazySingleton<JokesRepository>(
    () => JokesRepositoryImpl(
      localDataSources: sl(),
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data Sources
  sl.registerLazySingleton<JokesRemoteDataSource>(
    () => JokesRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<JokesLocalDataSources>(
    () => JokesLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  //! Core - Jokes
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkConnectionImpl(
      sl(),
    ),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Connectivity());
}
