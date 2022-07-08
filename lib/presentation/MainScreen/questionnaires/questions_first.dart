import 'package:flutter/material.dart';
import '../../../const/colors.dart';
import '../../../const/custom_theme.dart';
import '../../../const/strings.dart';
import '../../../image/app_images.dart';
import 'dart:io';
import 'package:another_xlider/another_xlider.dart';

import '../../../image/logo.dart';
import '../custom_style/custom_text_style.dart';
import 'arguments_to_send.dart';
import 'package:path_provider/path_provider.dart';

class QuestionsFirst extends StatefulWidget {
  const QuestionsFirst({Key? key}) : super(key: key);

  @override
  QuestionsFirstState createState() => QuestionsFirstState();
}

class QuestionsFirstState extends State {
  double _stress = 0.0;
  double _anxiety = 0.0;
  double _mood = 0.0;
  Color _trackBarColorStress = aquamarineColor;
  Color _trackBarColorAnxiety = aquamarineColor;
  Color _trackBarColorMood = aquamarineColor;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.darkTheme,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Container(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, int index) {
                      return Column(children: [
                        Row(
                          children: [
                            logo(),
                            Text(
                              'How do you feel today?',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        _levelOfSmth('Stress level'),
                        _stressRow(),
                        _levelOfSmth('Anxiety level'),
                        _anxietyRow(),
                        _levelOfSmth('Mood level'),
                        _moodRow(),
                        const SizedBox(
                          height: 30,
                        ),
                        _recommendationsButton(),
                        const SizedBox(
                          height: 30,
                        ),
                        _downloadButton(),
                      ]);
                    })),
          ),
        ),
      ),
    );
  }

  Widget _levelOfSmth(String _level) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        _level,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _stressRow() {
    double _fontSizeLeft = 0;
    double _fontSizeRight = 0;
    if (_stress < 0) {
      _fontSizeLeft = 20;
    } else if (_stress > 0) {
      _fontSizeRight = 20;
    }
    return Row(mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            child: Text(
              _stress.toInt().toString(),
              style: customTextStyle(Strings.listOfFonts.mainFont, titleColor,
                  _fontSizeLeft, FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: 250, child: _stressChanges()),
          SizedBox(
            width: 50,
            child: Text(
              _stress.toInt().toString(),
              style: customTextStyle(Strings.listOfFonts.mainFont, titleColor,
                  _fontSizeRight, FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ]);
  }

  Widget _anxietyRow() {
    double _fontSizeLeft = 0;
    double _fontSizeRight = 0;
    if (_anxiety < 0) {
      _fontSizeLeft = 20;
    } else if (_anxiety > 0) {
      _fontSizeRight = 20;
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            child: Text(
              _anxiety.toInt().toString(),
              style: customTextStyle(Strings.listOfFonts.mainFont, titleColor,
                  _fontSizeLeft, FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: 250, child: _anxietyChanges()),
          SizedBox(
            width: 50,
            child: Text(
              _anxiety.toInt().toString(),
              style: customTextStyle(Strings.listOfFonts.mainFont, titleColor,
                  _fontSizeRight, FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ]);
  }

  Widget _moodRow() {
    double _fontSizeLeft = 0;
    double _fontSizeRight = 0;
    if (_mood < 0) {
      _fontSizeLeft = 20;
    } else if (_mood > 0) {
      _fontSizeRight = 20;
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            child: Text(
              _mood.toInt().toString(),
              style: customTextStyle(Strings.listOfFonts.mainFont, titleColor,
                  _fontSizeLeft, FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: 250, child: _moodChanges()),
          SizedBox(
            width: 50,
            child: Text(
              _mood.toInt().toString(),
              style: customTextStyle(Strings.listOfFonts.mainFont, titleColor,
                  _fontSizeRight, FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ]);
  }

  Widget _stressChanges() {
    return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: FlutterSlider(
            values: [_stress],
            min: -6,
            max: 6,
            step: FlutterSliderStep(step: 1),
            handler: FlutterSliderHandler(
              decoration: BoxDecoration(),
              child: Material(
                type: MaterialType.canvas,
                color: _trackBarColorStress,
                //elevation: 3,
                child: Container(
                  height: 20,
                  width: 3,
                ),
              ),
            ),
            centeredOrigin: true,
            trackBar: FlutterSliderTrackBar(
              activeTrackBar: BoxDecoration(color: _trackBarColorStress),
              inactiveTrackBar: BoxDecoration(color: Colors.grey),
            ),
            onDragging: (handlerIndex, lowerValue, upperValue) {
              if (lowerValue >= 0) {
                _trackBarColorStress = aquamarineColor;
              } else {
                _trackBarColorStress = Colors.blueGrey;
              }
              setState(() {
                _stress = lowerValue;
              });
            }));
  }

  Widget _anxietyChanges() {
    return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: FlutterSlider(
            values: [_anxiety],
            min: -6,
            max: 6,
            step: const FlutterSliderStep(step: 1),
            handler: FlutterSliderHandler(
              decoration: BoxDecoration(),
              child: Material(
                type: MaterialType.canvas,
                color: _trackBarColorAnxiety,
                //elevation: 3,
                child: Container(
                  height: 20,
                  width: 3,
                ),
              ),
            ),
            centeredOrigin: true,
            trackBar: FlutterSliderTrackBar(
              activeTrackBar: BoxDecoration(color: _trackBarColorAnxiety),
              inactiveTrackBar: BoxDecoration(color: Colors.grey),
            ),
            onDragging: (handlerIndex, lowerValue, upperValue) {
              if (lowerValue >= 0) {
                _trackBarColorAnxiety = aquamarineColor;
              } else {
                _trackBarColorAnxiety = Colors.blueGrey;
              }
              setState(() {
                _anxiety = lowerValue;
              });
            }));
  }

  Widget _moodChanges() {
    return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: FlutterSlider(
            values: [_mood],
            min: -6,
            max: 6,
            step: const FlutterSliderStep(step: 1),
            handler: FlutterSliderHandler(
              decoration: BoxDecoration(),
              child: Material(
                type: MaterialType.canvas,
                color: _trackBarColorMood,
                //elevation: 3,
                child: Container(
                  height: 20,
                  width: 3,
                ),
              ),
            ),
            centeredOrigin: true,
            trackBar: FlutterSliderTrackBar(
              activeTrackBar: BoxDecoration(color: _trackBarColorMood),
              inactiveTrackBar: const BoxDecoration(color: Colors.grey),
            ),
            onDragging: (handlerIndex, lowerValue, upperValue) {
              if (lowerValue >= 0) {
                _trackBarColorMood = aquamarineColor;
              } else {
                _trackBarColorMood = Colors.blueGrey;
              }
              setState(() {
                _mood = lowerValue;
              });
            }));
  }

  Widget _recommendationsButton() {
    return ElevatedButton(
      onPressed: () {
        Future.delayed(
            const Duration(seconds: 1),
            () => Navigator.pushNamed(context, '/recommendations',
                arguments: ArgumentsToSend(
                  _stress,
                  _anxiety,
                  _mood,
                )));
      },
      child: const Text(
        'Recommendations',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _downloadButton() {
    return TextButton(
      onPressed: () {
        _save();
      },
      child: const Text(
        'Download results',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  _save() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/my_file.txt');
    final text =
        'Today is ${DateTime.now()} \nYour stress level is $_stress,\nYour anxiety level is $_anxiety,\nYour mood level is $_mood';
    await file.writeAsString(text);
    print(text);
  }
}
