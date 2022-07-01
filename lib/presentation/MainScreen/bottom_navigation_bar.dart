import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/presentation/MainScreen/custom_style/custom_icons/custom_icons.dart';

class BottomNavigationBar extends StatefulWidget {
  const BottomNavigationBar({Key? key, required int currentIndex, Color? selectedItemColor, required void Function(int index) onTap, required List<BottomNavigationBarItem> items}) : super(key: key);

  @override
  State<BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  int _selectedIndex = 0;
  static final TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.indigo[200],);
  static final List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Sleep',
      style: optionStyle,
    ),
    Text(
      'Index 2: Meditate',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(sleep_icon),
            label: 'Sleep',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Meditate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo[200],
        onTap: _onItemTapped,
      ),
    );
  }
}