import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:memegenerator/features/core/usecases/usecase.dart';
import 'package:memegenerator/features/jokes/domain/entities/jokes.dart';
import 'package:memegenerator/features/jokes/domain/usecases/get_jokes.dart';

import '../../../core/error/failure.dart';

part 'jokes_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class JokesCubit extends Cubit<JokesState> {
  final GetJokes getJokes;

  JokesCubit(this.getJokes) : super(JokesInitial());

  Future<void> getJokesRandomly() async {
    emit(JokesLoading());
    final failureOrJokes = await getJokes(NoInput());
    emit(
      failureOrJokes.fold(
        (failure) => Error(mapFailureToMessage(failure)),
        (jokes) => JokesLoaded(jokes: jokes),
      ),
    );
  }

  // Future<void> eitherloadedorErrorState(
  //     Either<Failure, Jokes> failureOrJokes) async {
  //   return failureOrJokes.fold(
  //     (failure) => Error(mapFailureToMessage(failure)),
  //     (jokes) => JokesLoaded(jokes: jokes),
  //   );
  // }

  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
