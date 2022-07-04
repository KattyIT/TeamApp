import 'package:flutter/material.dart';

import '../../../image/logo.dart';
import '../custom_style/custom_text_style.dart';

class Move extends StatefulWidget {
  const Move({Key? key}) : super(key: key);

  @override
  State<Move> createState() => _MoveState();
}

class _MoveState extends State<Move> {
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
}
