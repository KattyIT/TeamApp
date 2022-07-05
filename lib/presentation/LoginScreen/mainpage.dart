import 'package:flutter/material.dart';
import 'package:meditation_app/presentation/SplashScreen/splash.dart';

import '../../services/auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Authentication.initializeFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Authentication.initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Что-то пошло не так');
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                backgroundColor: Color(0xff192028),
                primarySwatch: Colors.blue,
              ),
              home: MyCustomSplashScreen(),
            );
          }
          return CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xffA9DED8).withOpacity(.8)));
        });
  }
}
