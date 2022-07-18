// ignore_for_file: constant_identifier_names

import 'package:memegenerator/features/jokes/domain/entities/jokes.dart';

const String FAILED_SETUP = 'Try another joke';

class JokesModel extends Jokes {
  const JokesModel({
    required String setup,
    required String delivery,
  }) : super(
          setup: setup,
          delivery: delivery,
        );

  factory JokesModel.fromJson(Map<String, dynamic> json) {
    // assert((json['setup']) != null);
    // assert((json['delivery']) != null);
    // if ((json['setup']) != null) {
    //   return JokesModel(
    //     setup: json['setup'],
    //     delivery: json['delivery'],
    //   );
    // } else {
    //   return const JokesModel(
    //     setup: 'Try another Joke',
    //     delivery: 'An error occured while getting your jokes',
    //   );
    // }
    return (json['setup'] != null)
        ? JokesModel(setup: json['setup'], delivery: json['delivery'])
        : const JokesModel(setup: 'Oops...', delivery: 'Reload Jokes Please');
  }

  Map<String, dynamic> toJson() {
    return {
      'setup': setup,
      'delivery': delivery,
    };
  }
}
