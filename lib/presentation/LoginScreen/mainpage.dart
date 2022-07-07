import 'package:flutter/material.dart';
import 'package:meditation_app/presentation/SplashScreen/splash.dart';

import '../../const/colors.dart';
import '../../const/strings.dart';
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
            return const Text(Strings.brokenConnection);
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                backgroundColor: backgroundColor,
               // primarySwatch: Colors.blue,
              ),
              home: const MyCustomSplashScreen(),
            );
          }
          return CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(aquamarineColor));
        });
  }
}
