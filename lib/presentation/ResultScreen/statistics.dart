import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/presentation/ResultScreen/statistics_data/line_chart.dart';


import '../../image/app_images.dart';
import '../MainScreen/custom_style/custom_text_style.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  int _currentPage = 0;

  final _controller = PageController(initialPage: 0);
  final _pages = const [
    LineChartPage(),
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _controller,
          children: _pages,
        ),
      ),
    );
  }
}

class LineChartPage extends StatelessWidget {
  const LineChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,//const Color(0xff262545),
      child: ListView(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 36.0,
                top: 24,
              ),
              child: Row(
                children: [
                  _logo(),
                  Text(
                    'Statistics',
                    style: customTextStyle(
                        'Arima', Colors.black, 24, FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Changes in your state',
            style: customTextStyle(
                'Arima', Colors.black, 24, FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 28,
              right: 28,
            ),
            child: LineChartSample1(),
          ),
          const SizedBox(
            height: 22,
          ),
        ],
      ),
    );
  }
}

Widget _logo() {
  return Container(
    margin: const EdgeInsets.all(10),
    width: 100,
    height: 100,
    child: Image.asset(AppImages.logo),
  );
}

