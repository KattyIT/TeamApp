import 'package:flutter/material.dart';

import 'questionnaires/questions_first.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black38,
        primarySwatch: Colors.teal,
      ),
      home: const QuestionsFirst(),
    );
  }
}
