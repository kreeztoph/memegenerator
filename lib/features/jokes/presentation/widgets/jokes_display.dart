// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../domain/entities/jokes.dart';

class JokesDisplay extends StatelessWidget {
  final Jokes jokes;

  const JokesDisplay({
    Key? key,
    required this.jokes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        children: [
          Text(
            jokes.setup,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Text(
                  jokes.delivery,
                  style: TextStyle(fontSize: 26),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
