import 'package:memegenerator/features/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:memegenerator/features/core/usecases/usecase.dart';
import 'package:memegenerator/features/jokes/domain/entities/jokes.dart';
import 'package:memegenerator/features/jokes/domain/repositories/jokes_repository.dart';

class GetJokes implements UseCase<Jokes, NoInput> {
  final JokesRepository repository;

  GetJokes(this.repository);

  @override
  Future<Either<Failure, Jokes>> call(params) {
    throw UnimplementedError();
  }
}
