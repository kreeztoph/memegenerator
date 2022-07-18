import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/jokes.dart';
import '../repositories/jokes_repository.dart';

class GetJokes implements UseCase<Jokes, NoInput> {
  final JokesRepository repository;

  GetJokes(this.repository);

  @override
  Future<Either<Failure, Jokes>> call(NoInput params) async {
    return await repository.getJokes();
  }
}
