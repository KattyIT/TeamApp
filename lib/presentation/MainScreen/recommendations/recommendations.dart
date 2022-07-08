import 'package:flutter/material.dart';
import 'package:meditation_app/presentation/MainScreen/questionnaires/arguments_to_send.dart';
import '../../../const/custom_theme.dart';
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
    final args = ModalRoute
        .of(context)!
        .settings
        .arguments as ArgumentsToSend;
    _stress = args.stressLevel;
    _anxiety = args.anxietyLevel;
    _mood = args.moodLevel;

    return MaterialApp(
      theme: CustomTheme.darkTheme,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
            BoxConstraints(maxHeight: MediaQuery
                .of(context)
                .size
                .height),
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
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline1,
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
            const SizedBox(
              width: 180,
              child: Text(
                'Meditate',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
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
            const SizedBox(
              width: 180,
              child: Text(
                "Breathe",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
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
            const SizedBox(
              width: 180,
              child: Text(
                "Move",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
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
      child: const Text(
          "Skip",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
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
        text = 'L1QOh-n-eus';
        break;
      case 5:
        text = 'L1QOh-n-eus';
        break;
      case 4:
        text = 'L1QOh-n-eus';
        break;
      case 3:
        text = 'L1QOh-n-eus';
        break;
      case 2:
        text = '0QOuuGj_9_4';
        break;
      case 1:
        text = '0QOuuGj_9_4';
        break;
      case 0:
        text = '0QOuuGj_9_4';
        break;
      case -1:
        text = '0QOuuGj_9_4';
        break;
      case -2:
        text = '0QOuuGj_9_4';
        break;
      case -3:
        text = 'KD6Zr1V5CzQ';
        break;
      case -4:
        text = 'KD6Zr1V5CzQ';
        break;
      case -5:
        text = 'KD6Zr1V5CzQ';
        break;
      case -6:
        text = 'KD6Zr1V5CzQ';
        break;
      default:
        text = '0';
    }
    videoForMeditation = text;
    Navigator.pushNamed(context, '/meditation_screen');
  }

  void forMove(double mood) {
    String text;

    switch (_mood.toInt()) {
      case 6:
        text = 'BPK9WNtpBgk';
        break;
      case 5:
        text = 'BPK9WNtpBgk';
        break;
      case 4:
        text = 'BPK9WNtpBgk';
        break;
      case 3:
        text = 'BPK9WNtpBgk';
        break;
      case 2:
        text = 'K2LnW1gF6Eg';
        break;
      case 1:
        text = 'K2LnW1gF6Eg';
        break;
      case 0:
        text = 'K2LnW1gF6Eg';
        break;
      case -1:
        text = 'K2LnW1gF6Eg';
        break;
      case -2:
        text = 'K2LnW1gF6Eg';
        break;
      case -3:
        text = 'Sxddnugwu-8';
        break;
      case -4:
        text = 'Sxddnugwu-8';
        break;
      case -5:
        text = 'Sxddnugwu-8';
        break;
      case -6:
        text = 'Sxddnugwu-8';
        break;
      default:
        text = '0';
    }
    videoForMoving = text;
    Navigator.pushNamed(
      context,
      '/move_screen',
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
