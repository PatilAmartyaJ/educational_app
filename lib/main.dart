import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/NTSE%20Screens/NTSEHome.dart';
import 'package:flutter_application_1/PCB%20Screens/PCBHome.dart';
import 'package:flutter_application_1/Screens/HomeScreen.dart';

import 'package:flutter_application_1/Screens/SignInScreen.dart';
import 'package:flutter_application_1/Screens/WelcomeScreen.dart';
import 'package:flutter_application_1/Screens/signupScreen.dart';
import 'package:flutter_application_1/SearchEngine.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(EducationalApp());
}

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class EducationalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        SignInScreen.id: (context) => SignInScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        SearchEngine.id: (context) => SearchEngine(),
        NTSEHome.id: (context) => NTSEHome(),
        PCBHome.id: (context) => PCBHome(),
      },
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
    );
  }
}
