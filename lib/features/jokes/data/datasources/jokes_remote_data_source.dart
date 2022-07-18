import 'package:memegenerator/features/core/error/exception.dart';

import '../models/jokes_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class JokesRemoteDataSource {
  ///calls on the https://v2.jokeapi.dev/joke/Any
  ///throws a [ServerException] for all error codes.
  Future<JokesModel> getJokes();
}

class JokesRemoteDataSourceImpl implements JokesRemoteDataSource {
  final http.Client client;

  JokesRemoteDataSourceImpl({required this.client});

  @override
  Future<JokesModel> getJokes() =>
      _getJokesFromUrl('https://v2.jokeapi.dev/joke/Any');

  Future<JokesModel> _getJokesFromUrl(String url) async {
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return JokesModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
