import 'package:dartz/dartz.dart';
import 'package:memegenerator/features/core/error/exception.dart';
import 'package:memegenerator/features/jokes/data/models/jokes_model.dart';

import '../../../core/error/failure.dart';
import '../../../core/network/network_info.dart';
import '../../domain/entities/jokes.dart';
import '../../domain/repositories/jokes_repository.dart';
import '../datasources/jokes_local_data_sources.dart';
import '../datasources/jokes_remote_data_source.dart';

typedef Future<Jokes> JokesPicking();

class JokesRepositoryImpl extends JokesRepository {
  final JokesRemoteDataSource remoteDataSource;
  final JokesLocalDataSources localDataSources;
  final NetworkInfo networkInfo;

  JokesRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSources,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Jokes>> getJokes() async {
    return await _getJokes(() {
      return remoteDataSource.getJokes();
    });
  }

  Future<Either<Failure, Jokes>> _getJokes(JokesPicking gettingjokes) async {
    if (await networkInfo.isDeviceConnected) {
      try {
        final remotejoke = await gettingjokes();
        localDataSources.cacheJoke(remotejoke as JokesModel);
        return Right(remotejoke);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localJoke = await localDataSources.getLastJoke();
        return Right(localJoke);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
