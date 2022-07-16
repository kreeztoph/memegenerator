import 'package:memegenerator/features/jokes/domain/entities/jokes.dart';

class JokesModel extends Jokes {
  const JokesModel({
    required String setup,
    required String delivery,
  }) : super(
          setup: setup,
          delivery: delivery,
        );

  factory JokesModel.fromJson(Map<String, dynamic> json) {
    return JokesModel(
      setup: json['setup'],
      delivery: json['delivery'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'setup': setup,
      'delivery': delivery,
    };
  }
}
