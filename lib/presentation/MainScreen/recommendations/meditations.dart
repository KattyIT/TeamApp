import 'package:flutter/material.dart';

import '../../../image/logo.dart';
import '../custom_style/custom_text_style.dart';

class Meditations extends StatefulWidget {
  const Meditations({Key? key}) : super(key: key);

  @override
  State<Meditations> createState() => _MeditationsState();
}

class _MeditationsState extends State<Meditations> {
  @override
  Widget build(BuildContext context) {
    var message = ModalRoute.of(context)?.settings.arguments as String;

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(bottom: 10.0, left: 10, right: 10, top: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    logo(),
                    Text(
                      'Meditation',
                      style: customTextStyle(
                          'Arima', Colors.black, 24, FontWeight.bold),
                    ),
                  ],
                ),
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
          ),
        ),
      ),
    );
  }
}
