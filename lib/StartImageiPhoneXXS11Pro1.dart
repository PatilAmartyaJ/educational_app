import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class StartImageiPhoneXXS11Pro1 extends StatelessWidget {
  StartImageiPhoneXXS11Pro1({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 450.2, middle: 0.7135),
            Pin(size: 973.8, middle: 0.7173),
            child:
                // Adobe XD layer: 'PicsArt_05-20-11.08…' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/educational-app-183a5.appspot.com/o/Start.jpg?alt=media&token=d8d59ff2-26cc-4404-ab4d-2597b79cf307"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
