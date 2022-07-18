import 'package:flutter/material.dart';
import 'package:memegenerator/features/jokes/presentation/pages/jokes_page.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokes App',
      theme: ThemeData(
        primaryColor: Colors.blue.shade800,
        // accentColor: Colors.blue.shade500,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.blue.shade500),
      ),
      home: JokesPage(),
    );
  }
}
