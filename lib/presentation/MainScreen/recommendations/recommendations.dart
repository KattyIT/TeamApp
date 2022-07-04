import 'package:flutter/material.dart';
import 'package:meditation_app/presentation/MainScreen/questionnaires/arguments_to_send.dart';
import '../../../image/app_images.dart';
import '../../../image/logo.dart';
import '../custom_style/custom_text_style.dart';
import '../custom_style/custom_boxdecoration.dart';

class Recommendations extends StatefulWidget {
  const Recommendations({Key? key}) : super(key: key);

  @override
  _RecommendationsState createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
  double _stress = 0;
  double _anxiety = 0;
  double _mood = 0;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ArgumentsToSend;
    _stress = args.stressLevel;
    _anxiety = args.anxietyLevel;
    _mood = args.moodLevel;

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Container(
                padding: EdgeInsets.all(10.0),
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, int index) {
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                logo(),
                                Text(
                                  'Recommendations',
                                  style: customTextStyle('Arima', Colors.black,
                                      24, FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            _startMeditation(),
                            _startBreathing(),
                            _startMoving(),
                            const SizedBox(
                              height: 30,
                            ),
                            _skip(),
                          ]);
                    })),
          ),
        ),
      ),
    );
  }

  Widget _startMeditation() {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _meditate(),
            SizedBox(
              width: 180,
              child: Text(
                'Are you ready to meditate?',
                style:
                    customTextStyle('Arima', Colors.black, 20, FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            _meditate(),
          ],
        ),
      ),
      onTap: () {
        forMeditation(_stress);
      },
      highlightColor: Colors.teal.withOpacity(0.5),
      splashColor: Colors.teal.withOpacity(0.5),
    );
  }

  Widget _startBreathing() {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _breathe(),
            SizedBox(
              width: 180,
              child: Text(
                "Maybe you prefer to breathe?",
                style:
                    customTextStyle('Arima', Colors.black, 20, FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            _breathe(),
          ],
        ),
      ),
      onTap: () {
        forBreathe(_anxiety);
      },
      highlightColor: Colors.teal.withOpacity(0.5),
      splashColor: Colors.teal.withOpacity(0.5),
    );
  }

  Widget _startMoving() {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _move(),
            SizedBox(
              width: 180,
              child: Text(
                "Or do some exercises?",
                style:
                    customTextStyle('Arima', Colors.black, 20, FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            _move(),
          ],
        ),
      ),
      onTap: () {
        forMove(_mood);
      },
      highlightColor: Colors.teal.withOpacity(0.5),
      splashColor: Colors.teal.withOpacity(0.5),
    );
  }

  Widget _skip() {
    return TextButton(
      child: Text(
        "Skip",
        style: customTextStyle('Arima', Colors.teal, 20, FontWeight.bold),
      ),
      onPressed: () {},
    );
  }

  Widget _breathe() {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 60,
      height: 60,
      child: Image.asset(AppImages.breathe),
    );
  }

  Widget _move() {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 60,
      height: 60,
      child: Image.asset(AppImages.move),
    );
  }

  Widget _meditate() {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 60,
      height: 60,
      child: Image.asset(AppImages.meditate),
    );
  }

  void forMeditation(double stress) {
    String text;

    switch (stress.toInt()) {
      case 6:
        text = 'Short antistress meditation';
        break;
      case 5:
        text = 'Short antistress meditation';
        break;
      case 4:
        text = 'Short antistress meditation';
        break;
      case 3:
        text = 'A little bit longer meditation';
        break;
      case 2:
        text = 'A little bit longer meditation';
        break;
      case 1:
        text = 'A little bit longer meditation';
        break;
      case 0:
        text = 'Standard meditation';
        break;
      case -1:
        text = 'Standard meditation';
        break;
      case -2:
        text = 'Standard meditation';
        break;
      case -3:
        text = 'Standard meditation';
        break;
      case -4:
        text = 'Long and thorough meditation';
        break;
      case -5:
        text = 'Long and thorough meditation';
        break;
      case -6:
        text = 'Long and thorough meditation';
        break;
      default:
        text = '0';
    }
    Navigator.pushNamed(
      context,
      '/meditation_screen',
      arguments: text,
    );
  }

  void forMove(double mood) {
    String text;

    switch (_mood.toInt()) {
      case 6:
        text = 'Exercises';
        break;
      case 5:
        text = 'Exercises';
        break;
      case 4:
        text = 'Exercises';
        break;
      case 3:
        text = 'Exercises';
        break;
      case 2:
        text = 'Exercises';
        break;
      case 1:
        text = 'Exercises';
        break;
      case 0:
        text = 'Exercises';
        break;
      case -1:
        text = 'Exercises';
        break;
      case -2:
        text = 'Exercises';
        break;
      case -3:
        text = 'Exercises';
        break;
      case -4:
        text = 'Exercises';
        break;
      case -5:
        text = 'Exercises';
        break;
      case -6:
        text = 'Exercises';
        break;
      default:
        text = '0';
    }
    Navigator.pushNamed(
      context,
      '/move_screen',
      arguments: text,
    );
  }

  void forBreathe(double anxiety) {
    String text;

    switch (_anxiety.toInt()) {
      case 6:
        text = 'Relaxing deep breathing';
        break;
      case 5:
        text = 'Relaxing deep breathing';
        break;
      case 4:
        text = 'Relaxing deep breathing';
        break;
      case 3:
        text = 'Relaxing deep breathing';
        break;
      case 2:
        text = 'Counting breaths';
        break;
      case 1:
        text = 'Counting breaths';
        break;
      case 0:
        text = 'Counting breaths';
        break;
      case -1:
        text = 'Counting breaths';
        break;
      case -2:
        text = 'Counting breaths';
        break;
      case -3:
        text = 'Meditation breathing';
        break;
      case -4:
        text = 'Meditation breathing';
        break;
      case -5:
        text = 'Meditation breathing';
        break;
      case -6:
        text = 'Meditation breathing';
        break;
      default:
        text = '0';
    }
    Navigator.pushNamed(
      context,
      '/breathe_screen',
      arguments: text,
    );
  }
}
