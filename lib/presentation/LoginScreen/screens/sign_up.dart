import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../services/auth.dart';
import '../screens/details/painter.dart';
import 'details/behavior.dart';


class LogupPage extends StatefulWidget {
  const LogupPage({Key? key}) : super(key: key);

  @override
  _LogupPageState createState() => _LogupPageState();
}

class _LogupPageState extends State<LogupPage> with TickerProviderStateMixin {
  late String _email, _password;

  final _formKey = GlobalKey<FormState>();

  late AnimationController controller_1;
  late AnimationController controller_2;
  late Animation<double> animation_1;
  late Animation<double> animation_2;
  late Animation<double> animation_3;
  late Animation<double> animation_4;

  @override
  void initState() {
    super.initState();

    controller_1 = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 5,
      ),
    );
    animation_1 = Tween<double>(begin: .1, end: .15).animate(
      CurvedAnimation(
        parent: controller_1,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller_1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller_1.forward();
        }
      });
    animation_2 = Tween<double>(begin: .02, end: .04).animate(
      CurvedAnimation(
        parent: controller_1,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
      setState(() {});
    });

    controller_2 = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 5,
      ),
    );
    animation_3 = Tween<double>(begin: .41, end: .38).animate(CurvedAnimation(
      parent: controller_2,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller_2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller_2.forward();
        }
      });
    animation_4 = Tween<double>(begin: 170, end: 190).animate(
      CurvedAnimation(
        parent: controller_2,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
      setState(() {});
    });

    Timer(Duration(milliseconds: 2500), () {
      controller_1.forward();
    });

    controller_2.forward();
  }

  @override
  void dispose() {
    controller_1.dispose();
    controller_2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff192028),
      body: ScrollConfiguration(
        behavior: Behavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: heightScreen,
            child: Stack(
              children: [
                Positioned(
                  top: heightScreen * (animation_2.value + .58),
                  left: widthScreen * .21,
                  child: CustomPaint(
                    painter: MyPainter(50),
                  ),
                ),
                Positioned(
                  top: heightScreen * .98,
                  left: widthScreen * .1,
                  child: CustomPaint(
                    painter: MyPainter(animation_4.value - 50),
                  ),
                ),
                Positioned(
                  top: heightScreen * .5,
                  left: widthScreen * (animation_2.value + .8),
                  child: CustomPaint(
                    painter: MyPainter(30),
                  ),
                ),
                Positioned(
                  top: heightScreen * animation_3.value,
                  left: widthScreen * (animation_1.value + .1),
                  child: CustomPaint(
                    painter: MyPainter(60),
                  ),
                ),
                Positioned(
                  top: heightScreen * .1,
                  left: widthScreen * .8,
                  child: CustomPaint(
                    painter: MyPainter(animation_4.value),
                  ),
                ),
                Column(
                  children: [
                    Expanded(
                        flex: 4,
                        child: Padding(
                          padding: EdgeInsets.only(top: heightScreen * .1),
                          child: Text(
                            'WARRIORS OF WELLNESS',
                            style: TextStyle(
                                color: Colors.white.withOpacity(.7),
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                wordSpacing: 4),
                          ),
                        )),
                    Expanded(
                        flex: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    _formNameElement(heightScreen, widthScreen),
                                    SizedBox(height: heightScreen / 49,),
                                    _formEmailElement(heightScreen, widthScreen),
                                    SizedBox(height: heightScreen / 49,),
                                    _formPasswordElement(heightScreen, widthScreen),
                                    SizedBox(height: heightScreen / 49,),
                                   _formConfirmPasswordElement(heightScreen, widthScreen),
                                  ],
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buttonUpElement(widthScreen, heightScreen)
                              ],
                            ),
                            _textButton()
                          ],
                        )),
                    Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _withoutAuthButtonElement(widthScreen, heightScreen),
                            SizedBox(
                              height: heightScreen * .05,
                            )
                          ],
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _formNameElement(double height, double width) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15,
          sigmaY: 15,
        ),
        child: Container(
          height: width / 7,
          width: width / 1.2,
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: width / 10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.05),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) return 'enter name';
              return null;
            },
            style: TextStyle(
              color: Colors.white.withOpacity(.8),
            ),
            cursorColor: Colors.white,
            obscureText: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.account_circle_outlined,
                color: Colors.white.withOpacity(.7),
              ),
              border: InputBorder.none,
              hintMaxLines: 1,
              hintText: 'name',
              hintStyle: TextStyle(
                  fontSize: 14, color: Colors.white.withOpacity(.5)),
              errorStyle: TextStyle(
                height: 12,
                color: Colors.red[400],
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _formEmailElement(double height, double width) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15,
          sigmaY: 15,
        ),
        child: Container(
          height: width / 7,
          width: width / 1.2,
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: width / 10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.05),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextFormField(
            //controller: controller,
            onChanged: (value) {
              setState(() {
                _email = value.trim();
              });
            },
            validator: (value) {
              if (value!.isEmpty) return "isn't e-mail";
              return null;
            },
            style: TextStyle(
              color: Colors.white.withOpacity(.8),
            ),
            cursorColor: Colors.white,
            obscureText: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.email_outlined,
                color: Colors.white.withOpacity(.7),
              ),
              border: InputBorder.none,
              hintMaxLines: 1,
              hintText: 'e-mail',
              hintStyle: TextStyle(
                  fontSize: 14, color: Colors.white.withOpacity(.5)),
              errorStyle: TextStyle(
                height: 14,
                color: Colors.red[400],
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _formPasswordElement(double height, double width) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15,
          sigmaY: 15,
        ),
        child: Container(
          height: width / 7,
          width: width / 1.2,
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: width / 10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.05),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextFormField(
            //controller: controller,
            onChanged: (value) {
              setState(() {
                _password = value.trim();
              });
            },
            validator: (value) {
              if (value!.isEmpty) return "isn't password";
              return null;
            },
            style: TextStyle(
              color: Colors.white.withOpacity(.8),
            ),
            cursorColor: Colors.white,
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock_outlined,
                color: Colors.white.withOpacity(.7),
              ),
              border: InputBorder.none,
              hintMaxLines: 1,
              hintText: 'password',
              hintStyle: TextStyle(
                  fontSize: 14, color: Colors.white.withOpacity(.5)),
              errorStyle: TextStyle(
                height: 14,
                color: Colors.red[400],
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _formConfirmPasswordElement(double height, double width) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15,
          sigmaY: 15,
        ),
        child: Container(
          height: width / 7,
          width: width / 1.2,
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: width / 10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.05),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextFormField(
            //controller: controller,
            validator: (value) {
              if (value!.isEmpty) return "isn't password";
              return null;
            },
            style: TextStyle(
              color: Colors.white.withOpacity(.8),
            ),
            cursorColor: Colors.white,
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock_outlined,
                color: Colors.white.withOpacity(.7),
              ),
              border: InputBorder.none,
              hintMaxLines: 1,
              hintText: 'confirm password',
              hintStyle: TextStyle(
                  fontSize: 14, color: Colors.white.withOpacity(.5)),
              errorStyle: TextStyle(
                height: 14,
                color: Colors.red[400],
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _buttonUpElement(double width, double height) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap:  () {
            //sign up with email
            Authentication.signup(context, _email, _password);

          },
          child: Container(
            height: width / 8,
            width: width / 1.9,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.05),
                borderRadius: BorderRadius.circular(15)),
            child: Text(
              'Зарегистироваться',
              style: TextStyle(color: Colors.white.withOpacity(.8), letterSpacing: 1.5),
            ),
          ),
        ),
      ),
    );
  }


  Widget _withoutAuthButtonElement(double width, double height) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap:  () {
            HapticFeedback.lightImpact();
            Fluttertoast.showToast(
                msg: 'Create new account pressed');
          },
          child: Container(
            height: width / 8,
            width: width / 2,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.05),
                borderRadius: BorderRadius.circular(15)),
            child: Text(
              'Без авторизации',
              style: TextStyle(color: Colors.white.withOpacity(.8), letterSpacing: 1.5),
            ),
          ),
        ),
      ),
    );
  }


  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK", style: TextStyle(color: Color(0xff192028))),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Пользовательское соглашение",
          style: TextStyle(color: Color(0xff192028), fontSize: 14)),
      content:
      Text("Соглашаюсь на все", style: TextStyle(color: Color(0xff192028), fontSize: 12)),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  Widget _textButton() {
    return Column(
      children: [
        Text(
          'Нажимая кнопку, вы соглашаетесь с ',
          style: TextStyle(
              color: Colors.white.withOpacity(.7),
              fontSize: 13,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              wordSpacing: 4),
        ),
        TextButton(
            onPressed: () => {showAlertDialog(context)},
            child: Container(
              padding: EdgeInsets.only(
                bottom: 5, // Space between underline and text
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                        color: Colors.white.withOpacity(.7),
                        width: 1.0, // Underline thickness
                      ))),
              child: Text(
                'политикой конфиденциальности',
                style: TextStyle(
                    color: Colors.white.withOpacity(.7),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    wordSpacing: 4),
              ),
            ))
      ],
    );
  }
}
