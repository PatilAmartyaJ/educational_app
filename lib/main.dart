import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/NTSE%20Screens/NTSEHome.dart';
import 'package:flutter_application_1/PCB%20Screens/PCBHome.dart';
import 'package:flutter_application_1/PCM%20Screens/PCMHome.dart';
import 'package:flutter_application_1/PCMB%20Screens/PCMBHome.dart';
import 'package:flutter_application_1/Screens/HomeScreen.dart';

import 'package:flutter_application_1/Screens/SignInScreen.dart';
import 'package:flutter_application_1/Screens/WelcomeScreen.dart';
import 'package:flutter_application_1/Screens/signupScreen.dart';
import 'package:flutter_application_1/SearchEngine.dart';

import 'Components/Screens/drawer_redirect_screens/advanced_challenges_screen.dart';
import 'Components/Screens/drawer_redirect_screens/books_screen.dart';
import 'Components/Screens/drawer_redirect_screens/features_screen.dart';
import 'Components/Screens/drawer_redirect_screens/take_test_screen.dart';
import 'Components/Screens/drawer_redirect_screens/video_lectures_screen.dart';

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
        FeaturesScreen.id: (context) => FeaturesScreen(),
        TakeTestScreen.id: (context) => TakeTestScreen(),
        BooksScreen.id: (context) => BooksScreen(),
        VideoLecturesScreen.id: (context) => VideoLecturesScreen(),
        AdvancedChallengesScreen.id: (context) => AdvancedChallengesScreen(),
      },
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
    );
  }
}
