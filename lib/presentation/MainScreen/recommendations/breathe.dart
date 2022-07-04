import 'package:flutter/material.dart';

import '../../../image/logo.dart';
import '../custom_style/custom_text_style.dart';

class Breathe extends StatefulWidget {
  const Breathe({Key? key}) : super(key: key);

  @override
  State<Breathe> createState() => _BreatheState();
}

class _BreatheState extends State<Breathe> {
  @override
  Widget build(BuildContext context) {
    var message = ModalRoute.of(context)?.settings.arguments as String;

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: ConstrainedBox(
              constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: [
                        logo(),
                        Text(
                          'Move',
                          style: customTextStyle(
                              'Arima', Colors.black, 24, FontWeight.bold),
                        ),
                      ],
                    ),
                    howToBreathe(message),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.teal),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ))),
                      child: Text(message),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget howToBreathe(String message) {
    String _breathing1 =
        "• Sit comfortably. \n• Breathe in through your nose for 6 seconds (try to fill your abdomen first, then up through your upper chest).\n• Hold your breath for 2-3 seconds.\n• Release your breath slowly through pursed lips.\n• Repeat 10 times.Sit comfortably.Close your eyes.\n• Take one deep breath and release it while saying the word “relax” either silently or aloud.\n• Breathe naturally 10 times while counting each breath (try to relax your face muscles as well as shoulders and other areas).\n• After counting down from 10 to 1, open your eyes.";
    String _breathing2 =
        "• Sit comfortably. \n• Close your eyes.\n• Take one deep breath and release it while saying the word “relax” either silently or aloud.\n• Breathe naturally 10 times while counting each breath (try to relax your face muscles as well as shoulders and other areas).\n• After counting down from 10 to 1, open your eyes.";
    String _breathing3 =
        "• Breathe out slowly.\n• Ignore when you breathe in.\n• Concentrate only on breathing out.\n• Breathe out as much air as possible before breathing in again.\n• Focus on relaxing the muscles in your face, shoulders, and anywhere else you feel tense while you breathe.";

    String text = '';
    if (message == 'Relaxing deep breathing') {
      text = _breathing1;
    } else if (message == 'Counting breaths') {
      text = _breathing2;
    } else if (message == 'Meditation breathing') {
      text = _breathing3;
    } else {
      text = '';
    }

    return Container(
      padding: const EdgeInsets.all(10),
      child: Text(text,
          style: const TextStyle(
              fontFamily: 'Arima',
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 1.5,
              letterSpacing: 1.0)),
    );
  }
}
