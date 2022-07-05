import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'details/behavior.dart';
import 'homepage.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth = FirebaseAuth.instance;
  User? user;
  late Timer timer;

  @override
  void initState() {
    user = auth.currentUser;
    user!.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery
        .of(context)
        .size
        .height;
    double widthScreen = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: Color(0xff192028),
      body: ScrollConfiguration(
        behavior: Behavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: heightScreen,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 2,
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
                        flex: 3,
                        child:  Center(
                                 child: Text(
                                     'An email has been sent to ${user!.email} please verify', style: TextStyle(
                                     color: Colors.white.withOpacity(.7),
                                     fontSize: 20,
                                     fontWeight: FontWeight.bold,
                                     letterSpacing: 1,
                                     wordSpacing: 4),),
                               ),

                             )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user!.reload();
    if (user!.emailVerified) {
      timer.cancel();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}
