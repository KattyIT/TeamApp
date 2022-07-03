import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meditation_app/presentation/MainScreen/custom_style/custom_boxdecoration.dart';
import 'package:meditation_app/presentation/MainScreen/custom_style/custom_icons/custom_icons.dart';
import 'package:meditation_app/presentation/MainScreen/greeting_message.dart';
import '../../image/app_images.dart';
import 'custom_style/custom_text_style.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  Widget _logo() {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 100,
      height: 100,
      child: Image.asset(AppImages.logo),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Container(
              margin: EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      _logo(),
                      Text(
                        'Welcome to W.O.W',
                        style: customTextStyle(
                            'Arima', Colors.black, 24, FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    greetingMessage(),
                    style: customTextStyle(
                        "FiraSans", Colors.black, 18, FontWeight.bold),
                  ),
                  Expanded(
                      child: SizedBox(
                          child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                      Container(

                        decoration: customBoxDecoration,
                        padding: const EdgeInsets.all(20),
                        child: const Text("Questionnarrie"),
                      ),
                      Container(
                        decoration: customBoxDecoration,
                        padding: const EdgeInsets.all(8),
                        child: const Text(''),
                      ),
                    ],
                  )))
                ],
              ),
            )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.indigo[200],
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              sleep_icon,
              color: Colors.indigo[200],
            ),
            label: 'Sleep',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              cloud,
              color: Colors.indigo[200],
            ),
            label: 'Meditate',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.indigo[200],
            ),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo[200],
        onTap: _onItemTapped,
      ),
    ));
  }
}
