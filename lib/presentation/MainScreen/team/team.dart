import 'package:flutter/material.dart';

import 'package:avatar_view/avatar_view.dart';

import '../../../const/colors.dart';
import '../../../const/strings.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;


  // Widget _logo() {
  //   return Container(
  //     margin: const EdgeInsets.all(10),
  //     width: 100,
  //     height: 100,
  //     child: Image.asset('assets/images/IMG_0139.PNG', fit:BoxFit.scaleDown),
  //   );
  // }

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(scaffoldBackgroundColor: const Color(0xff81acac)),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 0,
                    maxHeight: double.infinity,
                    minWidth: 0,
                    maxWidth: double.infinity,
                  ),
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              color: const Color(0xff81acac),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                  children: [

                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    width: 150,
                                    height: 150,
                                    child: Image.asset(
                                      'assets/images/logo.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Column(
                                    // mainAxisSize: MainAxisSize.max,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      //logo(),
                                      SizedBox(
                                        child: Text(
                                          'Meet Our Team',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: titleColor,
                                              fontSize: 60,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: Strings.listOfFonts.mainFont,
                                              letterSpacing: 1,
                                              wordSpacing: 4
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),


                            Column(children: [
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                  child: Container(
                                    //decoration: BoxDecoration,
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                              width: 10,
                                            ),
                                            Column(
                                                children: [
                                                  const AvatarView(
                                                    radius: 150,
                                                    borderWidth: 12,
                                                    borderColor: Color(0xff81acac),
                                                    avatarType: AvatarType.CIRCLE,
                                                    //backgroundColor: Colors.red,
                                                    imagePath:
                                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxWV-RzEWJTssn0G4__6itZGAj123i1p5obA&usqp=CAU",
                                                    placeHolder: Icon(
                                                      Icons.person,
                                                      size: 120,
                                                    ),
                                                    errorWidget: Icon(
                                                      Icons.error,
                                                      size: 70,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                    width: 10,
                                                  ),
                                                  SizedBox(
                                                    height: 50,
                                                    width: 250,
                                                    child: Text(
                                                      'Olga Peskova', textAlign:
                                                    TextAlign.center,
                                                      style: TextStyle(
                                                          color: const Color(0xff81acac),
                                                          fontSize: 40,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          fontFamily: Strings.listOfFonts.mainFont,
                                                          letterSpacing: 1,
                                                          wordSpacing: 4),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                    width: 10,
                                                  ),
                                                  SizedBox(
                                                    height: 120,
                                                    width: 300,
                                                    child: Text(
                                                        "Ph.D. candidate Department of Behavioral and Brain Sciences, 200RYT",
                                                        textAlign:
                                                        TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 25,
                                                            fontWeight: FontWeight.normal,
                                                            fontFamily: Strings.listOfFonts.mainFont,
                                                            letterSpacing: 1,
                                                            wordSpacing: 2),
                                                        overflow: TextOverflow.clip,
                                                        softWrap: true),
                                                  ),

                                                  const SizedBox(
                                                    height: 10,
                                                    width: 10,
                                                  ),

                                                  Container(
                                                    width: 350,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      //color: const Color(0xff7c94b6),
                                                      image: const DecorationImage(
                                                        image: AssetImage(
                                                            "assets/images/utdallas.png"),
                                                        fit: BoxFit.cover,
                                                      ),
                                                      border: Border.all(
                                                        color: const Color(0xff81acac),
                                                        width: 8,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(12),
                                                    ),
                                                  ),


                                                  Column(children: [
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    SizedBox(
                                                        child: Container(
                                                          //decoration: BoxDecoration,
                                                            padding:
                                                            const EdgeInsets.all(10),
                                                            child: Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                children: [
                                                                  const SizedBox(
                                                                    height: 10,
                                                                    width: 10,
                                                                  ),
                                                                  Column(
                                                                      children: [
                                                                        const AvatarView(
                                                                          radius: 150,
                                                                          borderWidth: 15,
                                                                          borderColor:Color(0xff81acac),
                                                                          avatarType: AvatarType.CIRCLE,
                                                                          backgroundColor: Colors.red,
                                                                          imagePath:
                                                                          "assets/images/girl.png",
                                                                          placeHolder:
                                                                          Icon(Icons.person,
                                                                              size: 70,
                                                                            ),
                                                                          errorWidget:
                                                                          Icon(Icons.error,
                                                                            size: 70,
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                          height: 15,
                                                                          width: 10,
                                                                        ),
                                                                        SizedBox(
                                                                          height: 50,
                                                                          width: 350,
                                                                          child: Text(
                                                                            'Amanda Johnson',
                                                                            textAlign: TextAlign
                                                                                .center,
                                                                            style: TextStyle(
                                                                                color: const Color(
                                                                                    0xff81acac),
                                                                                fontSize: 40,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontFamily: Strings.listOfFonts.mainFont,
                                                                                letterSpacing: 1,
                                                                                wordSpacing: 4),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                          height: 10,
                                                                          width: 10,
                                                                        ),
                                                                        SizedBox(
                                                                          height: 120,
                                                                          width: 350,
                                                                          child: Text(
                                                                              "200 E-RYT, Yoga/Meditation/Mindfulness Instructor. Nutrition, Ayurvedic and Aromatherapy Specialist",
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(
                                                                                  color: Colors.black,
                                                                                  fontSize: 25,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontFamily: Strings.listOfFonts.mainFont,
                                                                                  letterSpacing: 1,
                                                                                  wordSpacing: 2),
                                                                              overflow: TextOverflow.clip,
                                                                              softWrap: true),
                                                                        ),
                                                                        const SizedBox(
                                                                          height: 10,
                                                                          width: 10,
                                                                        ),
                                                                        Container(
                                                                          width: 350,
                                                                          height: 100,
                                                                          decoration:
                                                                          BoxDecoration(
                                                                            //color: const Color(0xff7c94b6),
                                                                            image: const DecorationImage(
                                                                              image: AssetImage(
                                                                                  'assets/images/Equinox.png'),
                                                                              fit: BoxFit.fill,
                                                                            ),
                                                                            border: Border.all(
                                                                              color: const Color(0xff81acac),
                                                                              width: 8,
                                                                            ),
                                                                            borderRadius: BorderRadius.circular(12),
                                                                          ),
                                                                        ),


                                                                        Column(
                                                                            children: [
                                                                              const SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                              SizedBox(
                                                                                  child: Container(
                                                                                    //decoration: BoxDecoration,
                                                                                      padding:
                                                                                      const EdgeInsets.all(10),
                                                                                      child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                          children: [
                                                                                            const SizedBox(
                                                                                              height: 10,
                                                                                              width: 10,
                                                                                            ),
                                                                                            Column(
                                                                                                children: [
                                                                                                  const AvatarView(
                                                                                                    radius: 150,
                                                                                                    borderWidth: 15,
                                                                                                    borderColor: Color(0xff81acac),
                                                                                                    avatarType: AvatarType.CIRCLE,
                                                                                                    backgroundColor: Colors.red,
                                                                                                    imagePath: "assets/images/man.png",
                                                                                                    placeHolder: Icon(
                                                                                                      Icons.person,
                                                                                                      size: 70,
                                                                                                    ),
                                                                                                    errorWidget: Icon(
                                                                                                      Icons.error,
                                                                                                      size: 70,
                                                                                                    ),
                                                                                                  ),
                                                                                                  const SizedBox(
                                                                                                    height: 15,
                                                                                                    width: 10,
                                                                                                  ),
                                                                                                  SizedBox(
                                                                                                    height: 50,
                                                                                                    width: 350,
                                                                                                    child: Text(
                                                                                                      'Dani Bilkis',
                                                                                                      textAlign: TextAlign.center,
                                                                                                      style: TextStyle(
                                                                                                          color: const Color(
                                                                                                              0xff81acac),
                                                                                                          fontSize: 40,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          fontFamily: Strings.listOfFonts.mainFont,
                                                                                                          letterSpacing: 1,
                                                                                                          wordSpacing: 4),
                                                                                                    ),
                                                                                                  ),
                                                                                                  const SizedBox(
                                                                                                    height: 10,
                                                                                                    width: 10,
                                                                                                  ),
                                                                                                  SizedBox(
                                                                                                    height: 70,
                                                                                                    width: 200,
                                                                                                    child: Text(
                                                                                                        "Developer, Lead Solution Architect",
                                                                                                        textAlign: TextAlign.center,
                                                                                                        style: TextStyle(
                                                                                                            color: Colors.black,
                                                                                                            fontSize: 25,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                            fontFamily: Strings.listOfFonts.mainFont,
                                                                                                            letterSpacing: 1,
                                                                                                            wordSpacing: 2),
                                                                                                        overflow: TextOverflow.clip,
                                                                                                        softWrap: true),
                                                                                                  ),
                                                                                                  //Column(
                                                                                                      // children: <Widget>[
                                                                                                      //   Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Amazon_logo.svg/1200px-Amazon_logo.svg.png"),
                                                                                                  const SizedBox(
                                                                                                    height: 10,
                                                                                                    width: 10,
                                                                                                  ),
                                                                                                  Container(
                                                                                                    color: Colors.white,
                                                                                                    padding: EdgeInsets.all(16),
                                                                                                    child: SizedBox(
                                                                                                      height: 70,
                                                                                                      width: 230,
                                                                                                      child: Image.network(
                                                                                                        "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Amazon_logo.svg/1200px-Amazon_logo.svg.png",
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Column(
                                                                                                      children: <Widget>[
                                                                                                        Image.network("https://labs.utdallas.edu/filbeylab/files/2020/03/utdallas.png",
                                                                                                        ),
                                                                                                ])
                                                                                          ])]))
                                                                              )])
                                                                      ])
                                                                ])))
                                                  ])
                                                ])
                                          ])))
                            ])
                          ])
                  ))),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Color(0xff81acac),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.assignment_turned_in,
                  color: Color(0xff81acac),
                ),
                label: 'Recommendations',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.live_help,
                  color: Color(0xff81acac),
                ),
                label: 'Questionnaire',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: const Color(0xff81acac),
            onTap: _onItemTapped,
          ),
        ));
  }
}