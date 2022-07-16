import 'package:equatable/equatable.dart';

class Jokes extends Equatable {
  final String setup;
  final String delivery;

  const Jokes({
    required this.setup,
    required this.delivery,
  });

  @override
  List<Object?> get props => [
        setup,
        delivery,
      ];
}
