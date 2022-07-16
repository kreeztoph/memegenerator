part of 'jokes_cubit.dart';

abstract class JokesState extends Equatable {
  @override
  List<Object> get props => [];
}

class JokesInitial extends JokesState {}

class JokesLoading extends JokesState {}

class JokesLoaded extends JokesState {
  final Jokes jokes;

  JokesLoaded({required this.jokes});

  @override
  List<Object> get props => [jokes];
}

class Error extends JokesState {
  final String message;

  Error(this.message);

  @override
  List<Object> get props => [message];
}
