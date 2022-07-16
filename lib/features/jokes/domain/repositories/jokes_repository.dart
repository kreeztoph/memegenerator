import 'package:dartz/dartz.dart';
import 'package:memegenerator/features/jokes/domain/entities/jokes.dart';

import '../../../core/error/failure.dart';

abstract class JokesRepository {
  Future<Either<Failure, Jokes>> getJokes();
}
