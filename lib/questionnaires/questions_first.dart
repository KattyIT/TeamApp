import 'package:flutter/material.dart';
import '../image/app_images.dart';
import 'package:another_xlider/another_xlider.dart';

class QuestionsFirst extends StatefulWidget {
  const QuestionsFirst({Key? key}) : super(key: key);

  @override
  QuestionsFirstState createState() => QuestionsFirstState();
}

class QuestionsFirstState extends State {
  double _stress = 0.0;
  double _anxiety = 0.0;
  double _mood = 0.0;
  Color _trackBarColorStress = Colors.teal;
  Color _trackBarColorAnxiety = Colors.teal;
  Color _trackBarColorMood = Colors.teal;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Как сегодня Ваше самочувствие?',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Container(
          padding: EdgeInsets.all(10.0),
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, int index) {
                return Column(children: [
                  _logo(),
                  _levelOfSmth('Уровень стресса'),
                  _stressRow(),
                  _levelOfSmth('Уровень тревожности'),
                  _anxietyRow(),
                  _levelOfSmth('Уровень настроения'),
                  _moodRow(),
                  _finalButton(),
                ]);
              })),
    );
  }

  Widget _logo() {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 100,
      height: 100,
      child: Image.asset(AppImages.logo),
    );
  }

  Widget _levelOfSmth(String _level) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        _level,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget _stressRow() {
    double _fontSizeLeft = 0;
    double _fontSizeRight = 0;
    if (_stress < 0) {
      _fontSizeLeft = 15;
    } else if (_stress > 0) {
      _fontSizeRight = 15;
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            child: Text(_stress.toString(),
                style: TextStyle(
                    fontSize: _fontSizeLeft,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          SizedBox(width: 250, child: _stressChanges()),
          SizedBox(
            width: 50,
            child: Text(_stress.toString(),
                style: TextStyle(
                    fontSize: _fontSizeRight,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ]);
  }

  Widget _anxietyRow() {
    double _fontSizeLeft = 0;
    double _fontSizeRight = 0;
    if (_anxiety < 0) {
      _fontSizeLeft = 15;
    } else if (_anxiety > 0) {
      _fontSizeRight = 15;
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            child: Text(_anxiety.toString(),
                style: TextStyle(
                    fontSize: _fontSizeLeft,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          SizedBox(width: 250, child: _anxietyChanges()),
          SizedBox(
            width: 50,
            child: Text(_anxiety.toString(),
                style: TextStyle(
                    fontSize: _fontSizeRight,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ]);
  }

  Widget _moodRow() {
    double _fontSizeLeft = 0;
    double _fontSizeRight = 0;
    if (_mood < 0) {
      _fontSizeLeft = 15;
    } else if (_mood > 0) {
      _fontSizeRight = 15;
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            child: Text(_mood.toString(),
                style: TextStyle(
                    fontSize: _fontSizeLeft,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          SizedBox(width: 250, child: _moodChanges()),
          SizedBox(
            width: 50,
            child: Text(_mood.toString(),
                style: TextStyle(
                    fontSize: _fontSizeRight,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ]);
  }

  Widget _stressChanges() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
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
              inactiveTrackBar: BoxDecoration(color: Colors.white),
            ),
            onDragging: (handlerIndex, lowerValue, upperValue) {
              if (lowerValue >= 0) {
                _trackBarColorStress = Colors.teal;
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
        padding: const EdgeInsets.all(8.0),
        child: FlutterSlider(
            values: [_anxiety],
            min: -6,
            max: 6,
            step: FlutterSliderStep(step: 1),
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
              inactiveTrackBar: BoxDecoration(color: Colors.white),
            ),
            onDragging: (handlerIndex, lowerValue, upperValue) {
              if (lowerValue >= 0) {
                _trackBarColorAnxiety = Colors.teal;
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
        padding: const EdgeInsets.all(8.0),
        child: FlutterSlider(
            values: [_mood],
            min: -6,
            max: 6,
            step: FlutterSliderStep(step: 1),
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
              inactiveTrackBar: const BoxDecoration(color: Colors.white),
            ),
            onDragging: (handlerIndex, lowerValue, upperValue) {
              if (lowerValue >= 0) {
                _trackBarColorMood = Colors.teal;
              } else {
                _trackBarColorMood = Colors.blueGrey;
              }
              setState(() {
                _mood = lowerValue;
              });
            }));
  }

  Widget _finalButton() {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ))),
      onPressed: () {
        //
        //   Future.delayed(
        //       const Duration(seconds: 1),
        //       () => Navigator.pushNamed(context, '/details',
        //                   arguments: ArgumentsToSend(
        //                     _stress,
        //                     _anxiety,
        //                     _mood,
        //                   )););
        //
      },
      child: const Text(
        'Подобрать рекомендации',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
