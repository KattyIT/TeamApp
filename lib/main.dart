import 'package:flutter/material.dart';
import 'package:meditation_app/presentation/MainScreen/questionnaires/questions_first.dart';
import 'package:meditation_app/presentation/MainScreen/recommendations/breathe.dart';
import 'package:meditation_app/presentation/MainScreen/recommendations/meditations.dart';
import 'package:meditation_app/presentation/MainScreen/recommendations/move.dart';
import 'package:meditation_app/presentation/MainScreen/recommendations/recommendations.dart';
import 'package:meditation_app/presentation/ResultScreen/statistics.dart';


//import 'questionnaires/questions_first.dart';

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
      initialRoute: '/questions_first',
      routes: {
        '/questions_first': (context) => const QuestionsFirst(),
        '/recommendations': (context) => const Recommendations(),
        '/meditation_screen': (context) => const Meditations(),
        '/breathe_screen':  (context) => const Breathe(),
        '/move_screen': (context) => const Move(),
      },
    );
  }
}
