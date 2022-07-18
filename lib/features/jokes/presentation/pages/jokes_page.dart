// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memegenerator/features/jokes/presentation/cubit/jokes_cubit.dart';
import 'package:memegenerator/features/jokes/presentation/widgets/widgets.dart';

import '../../../../injection_container.dart';
import '../widgets/loading_circle.dart';
import '../widgets/message_display.dart';

class JokesPage extends StatelessWidget {
  const JokesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jokes App'),
      ),
      body: buildBody(),
    );
  }

  BlocProvider<JokesCubit> buildBody() {
    return BlocProvider(
        create: (_) => sl<JokesCubit>(),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<JokesCubit, JokesState>(
              builder: (context, state) {
                if (state is JokesInitial) {
                  return MessageDisplay(
                    message: 'Get a Joke',
                  );
                } else if (state is JokesLoading) {
                  return LoadingCircle();
                } else if (state is JokesLoaded) {
                  return JokesDisplay(jokes: state.jokes);
                } else if (state is Error) {
                  return MessageDisplay(message: state.message);
                } else {
                  return MessageDisplay(message: 'Get a Joke');
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            JokesControl(),
          ]),
        )));
  }
}

class JokesControl extends StatefulWidget {
  const JokesControl({
    Key? key,
  }) : super(key: key);

  @override
  State<JokesControl> createState() => _JokesControlState();
}

class _JokesControlState extends State<JokesControl> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: ElevatedButton(
                    onPressed: () {}, child: Text('Get a Joke'))),
          ],
        )
      ],
    );
  }
}

// void dispatchJokes(BuildContext context) {
//   BlocProvider.of<JokesCubit>(context).
// }
