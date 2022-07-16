import 'dart:convert';

import 'package:memegenerator/features/core/error/exception.dart';
import 'package:memegenerator/features/jokes/data/models/jokes_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class JokesLocalDataSources {
  Future<JokesModel> getLastJoke();

  Future<void> cacheJoke(JokesModel jokeToCahce);
}

const CACHED_JOKES = 'CACHED JOKES';

class JokesLocalDataSourceImpl implements JokesLocalDataSources {
  final SharedPreferences sharedPreferences;

  JokesLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheJoke(JokesModel jokeToCahce) {
    return sharedPreferences.setString(
        CACHED_JOKES,
        json.encode(
          jokeToCahce.toJson(),
        ));
  }

  @override
  Future<JokesModel> getLastJoke() {
    final jsonString = sharedPreferences.getString(CACHED_JOKES);
    if (jsonString != null) {
      return Future.value(JokesModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
