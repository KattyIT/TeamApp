import 'dart:async';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meditation_app/presentation/LoginScreen/screens/sign_up.dart';

import 'package:meditation_app/services/auth.dart';
import '../../../const/colors.dart';

import '../../../const/strings.dart';
import '../screens/details/painter.dart';
import '../screens/details/social_network_button.dart';
import 'details/behavior.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
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
    Authentication.initializeFirebase();
    Authentication.checkSignedIn(context);

    controller_1 = AnimationController(
      vsync: this,
      duration: const Duration(
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
      duration: const Duration(
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

    Timer(const Duration(milliseconds: 2500), () {
      controller_1.forward();
    });

    controller_2.forward();

    super.initState();
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
      backgroundColor: backgroundColor,
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
                        flex: 5,
                        child: Padding(
                          padding: EdgeInsets.only(top: heightScreen * .15),
                          child: Text(
                            Strings.appTitle,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                fontFamily: Strings.listOfFonts.mainFont,
                                letterSpacing: 1,
                                wordSpacing: 4),
                          ),
                        )),
                    Expanded(
                        flex: 7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // _formElement(heightScreen, widthScreen,
                            //     Icons.account_circle_outlined,
                            //     'User name...', false, false),
                            Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    _formEmailElement(
                                        heightScreen, widthScreen),
                                    SizedBox(
                                      height: heightScreen / 49,
                                    ),
                                    _formPasswordElement(
                                        heightScreen, widthScreen),
                                  ],
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buttonInElement(widthScreen, heightScreen),
                                SizedBox(
                                  width: widthScreen / 20,
                                ),
                                _buttonUpElement(widthScreen, heightScreen),
                              ],
                            ),
                            _textButton()
                          ],
                        )),
                    Expanded(
                        flex: 3,
                        child: _socialCircles()),
                    Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _withoutAuthButtonElement(
                                widthScreen, heightScreen),
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
              if (value!.isEmpty) return Strings.msgEmailIsEmpty;
              return null;
            },
            style: TextStyle(
              fontSize: 16,
              color: titleColor,
            ),
            cursorColor: Colors.white,
            obscureText: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email_outlined,
                color: titleColor,),
              border: InputBorder.none,
              hintMaxLines: 1,
              hintText: Strings.hintEmail,
              hintStyle: TextStyle(
                fontSize: 16,
                letterSpacing: 1,
                color: titleColor,
                fontFamily: Strings.listOfFonts.mainFont,
              ),
              errorStyle: const TextStyle(
                height: 14,
                color: Colors.red,
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
              if (value!.isEmpty) return Strings.msgPasswordIsEmpty;
              return null;
            },
            style: TextStyle(
              fontSize: 16,
              color: titleColor,
            ),
            cursorColor: Colors.white,
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock_outlined,
                color: titleColor,
              ),
              border: InputBorder.none,
              hintMaxLines: 1,
              hintText: Strings.hintPassword,
              hintStyle: TextStyle(
                fontSize: 16,
                letterSpacing: 1,
                color: titleColor,
                fontFamily: Strings.listOfFonts.mainFont,
              ),
              errorStyle: const TextStyle(
                height: 14,
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonInElement(double width, double height) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            Authentication.signin(context, _email, _password);
          },
          child: Container(
            height: width / 8,
            width: width / 2.58,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.05),
                borderRadius: BorderRadius.circular(15)),
            child: Text(
              Strings.hintSignIn,
              style: TextStyle(
                color: titleColor,
                letterSpacing: 1.5,
                fontFamily: Strings.listOfFonts.mainFont,
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
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LogupPage()));
          },
          child: Container(
            height: width / 8,
            width: width / 2.58,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.05),
                borderRadius: BorderRadius.circular(15)),
            child: Text(
              Strings.hintSignUp,
              style: TextStyle(
                color: titleColor,
                letterSpacing: 1.5,
                fontFamily: Strings.listOfFonts.mainFont,
              ),
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child:
          Text(Strings.hintOkButton, style: TextStyle(color: backgroundColor)),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white,
      title: Text(Strings.termsTitle,
          style: TextStyle(
            color: backgroundColor,
            fontSize: 16,
            fontFamily: Strings.listOfFonts.mainFont,
          )),
      content: Text(Strings.termsContent,
          style: TextStyle(
            color: backgroundColor,
            fontSize: 14,
            fontFamily: Strings.listOfFonts.mainFont,
          )),
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
          Strings.termsLine,
          style: TextStyle(
              color: titleColor,
              fontSize: 13,
              fontWeight: FontWeight.bold,
              fontFamily: Strings.listOfFonts.mainFont,
              letterSpacing: 1,
              wordSpacing: 4),
        ),
        TextButton(
            onPressed: () => {showAlertDialog(context)},
            child: Container(
              padding: const EdgeInsets.only(
                bottom: 5, // Space between underline and text
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: titleColor,
                width: 1.0, // Underline thickness
              ))),
              child: Text(
                Strings.termsButton,
                style: TextStyle(
                    color: titleColor,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    fontFamily: Strings.listOfFonts.mainFont,
                    letterSpacing: 1,
                    wordSpacing: 4),
              ),
            ))
      ],
    );
  }

  Widget _socialCircles() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomWidgets.socialButtonCircle(
            facebookColor,
            FontAwesomeIcons.facebookF,
            iconColor: Colors.white,
            onTap: () {}),
        const SizedBox(
          width: 20,
        ),
        CustomWidgets.socialButtonCircle(
            googleColor, FontAwesomeIcons.googlePlusG,
            iconColor: Colors.white,
            onTap: () {
          Authentication.signinWithGoogle(context: context);
          print('logged in with google');
        }),
        const SizedBox(
          width: 20,
        ),
        CustomWidgets.socialButtonCircle(
            appleColor,
            FontAwesomeIcons.apple,
            iconColor: Colors.black,
            onTap: () {}),
      ],
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
          onTap: () {},
          child: Container(
            height: width / 8,
            width: width / 1.7,
            padding: const EdgeInsets.all(2),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.05),
                borderRadius: BorderRadius.circular(15)),
            child: Text(
              Strings.hintWithoutLogin,
              style: TextStyle(
                color: titleColor,
                fontSize: 16,
                letterSpacing: 1.5,
                fontFamily: Strings.listOfFonts.mainFont,
              ),
            ),
          ),
        ),
      ),
    );
  }

}
