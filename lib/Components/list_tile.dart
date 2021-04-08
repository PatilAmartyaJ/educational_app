import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListTileWidget extends StatelessWidget {
  ListTileWidget(
      {@required this.iconData, @required this.routeName, @required this.text});
  final IconData iconData;
  final String routeName;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 18.0,
        color: Colors.black,
      ),
      title: Text(
        text,
        style: TextStyle(fontSize: 18.0),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, routeName);
      },
    );
  }
}
