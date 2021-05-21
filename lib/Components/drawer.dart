import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/Screens/WelcomeScreen.dart';

import 'Screens/drawer_redirect_screens/advanced_challenges_screen.dart';
import 'Screens/drawer_redirect_screens/books_screen.dart';
import 'Screens/drawer_redirect_screens/features_screen.dart';
import 'Screens/drawer_redirect_screens/take_test_screen.dart';
import 'Screens/drawer_redirect_screens/video_lectures_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'list_tile.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget(
      {@required this.name, @required this.email, @required this.auth});
  final String name;
  final String email;
  final FirebaseAuth auth;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF83c5be)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  email,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                )
              ],
            ),
          ),
          ListTileWidget(
            iconData: FontAwesomeIcons.tools,
            routeName: FeaturesScreen.id,
            text: 'Features',
          ),
          ListTileWidget(
            iconData: FontAwesomeIcons.pencilAlt,
            routeName: TakeTestScreen.id,
            text: 'Take test',
          ),
          ListTileWidget(
            iconData: FontAwesomeIcons.book,
            routeName: BooksScreen.id,
            text: "Books",
          ),
          ListTileWidget(
            iconData: FontAwesomeIcons.video,
            routeName: VideoLecturesScreen.id,
            text: "Video Lectures",
          ),
          ListTileWidget(
            iconData: FontAwesomeIcons.laptop,
            routeName: AdvancedChallengesScreen.id,
            text: "Advanced Challenges",
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              size: 20.0,
              color: Colors.white,
            ),
            title: Text(
              'Logout',
              style: TextStyle(fontSize: 18.0),
            ),
            onTap: () {
              auth.signOut();
              Navigator.pushNamed(context, WelcomeScreen.id);
            },
          )
        ],
      ),
    );
  }
}
