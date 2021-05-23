import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_application_1/Components/RoundedButton.dart';
import 'package:flutter_application_1/Screens/SignInScreen.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = 'signup_screen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
  bool showSpinner = false;
  String email;
  String password;
  bool _passwordVisible = false;
  String grade;
  String name;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sign Up"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(0.5, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                  colors: <Color>[Colors.pink, Colors.blue])),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFF06292), width: 2.0),
                    ),
                    hintText: 'Enter your email',
                    prefixIcon: Opacity(
                      opacity: 0.70,
                      child: Icon(FontAwesomeIcons.envelope,
                          size: 25, color: Colors.white),
                    ),
                    suffixIcon: Opacity(
                      opacity: 0.0,
                      child: Icon(FontAwesomeIcons.envelope,
                          size: 25, color: Colors.black),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    if (!EmailValidator.validate(value)) {
                      return "Please Enter a Valid Email Address ";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  obscureText: !_passwordVisible,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFF06292), width: 2.0),
                      ),
                      hintText: 'Enter your password',
                      prefixIcon: Opacity(
                        opacity: 0.80,
                        child: Icon(FontAwesomeIcons.lock,
                            size: 25, color: Colors.white),
                      ),
                      suffix: SizedBox(
                        height: 25,
                        child: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            }),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    if (value.length < 6) {
                      return "Password must have a minimum of 6 characters";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFF06292), width: 2.0),
                    ),
                    hintText: 'Enter your name',
                    prefixIcon: Opacity(
                      opacity: 0.70,
                      child: Icon(FontAwesomeIcons.userCircle,
                          size: 25, color: Colors.white),
                    ),
                    suffixIcon: Opacity(
                      opacity: 0.0,
                      child: Icon(FontAwesomeIcons.userCircle,
                          size: 25, color: Colors.white),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                DropdownButtonFormField<String>(
                  value: grade,
                  isExpanded: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFF06292), width: 2.0),
                    ),
                    prefixIcon: Opacity(
                      opacity: 0.70,
                      child: Icon(
                        FontAwesomeIcons.graduationCap,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  iconSize: 20,
                  elevation: 16,
                  items: <String>[
                    '10Th NTSE',
                    '+1,+2 IIT JEE (PCM)',
                    '+1,+2 NEET,AIIMS (PCB)',
                    '+1,+2 PCMB',
                  ].map<DropdownMenuItem<String>>((grade) {
                    return DropdownMenuItem<String>(
                      value: grade,
                      child: Center(child: Text(grade)),
                    );
                  }).toList(),
                  onChanged: (value) async {
                    setState(() {
                      grade = value;
                    });
                  },
                  hint: Center(
                    child: Text(
                      "select Grade",
                      style: TextStyle(),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select grade';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                RoundedButton(
                  title: 'Sign Up',
                  colour: Colors.white,
                  onpressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        showSpinner = true;
                      });
                      await signUp(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signUp(BuildContext context) async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (newUser != null) {
        Alert(
          context: context,
          title: 'Success',
          desc: 'Account created successfully',
          buttons: [
            DialogButton(
              child: Text('Log In'),
              onPressed: () {
                Navigator.pushNamed(context, SignInScreen.id);
                var firebaseUser = FirebaseAuth.instance.currentUser;
                _db.collection("users").doc(firebaseUser.uid).set({
                  "Full Name": name,
                  "Standard": grade,
                  "Email": email,
                  "uid": firebaseUser.uid
                }).then((_) {
                  print("success!");
                });
                _db.collection("users").get().then((querySnapshot) {
                  querySnapshot.docs.forEach((result) {
                    print(result.data());
                  });
                });
              },
              width: 100,
            )
          ],
        ).show();
      }
      setState(() {
        showSpinner = false;
      });
    } on FirebaseAuthException catch (error) {
      setState(() {
        showSpinner = false;
      });
      print(error.message);
      // print(getMessageFromErrorCode(error));
      Alert(
        context: context,
        title: 'Error',
        desc: error.message,
        buttons: [
          DialogButton(
            color: Colors.blue,
            child: Text('Try Again'),
            onPressed: () => setState(() {}),
            width: 100,
          ),
        ],
      ).show();
    }
  }
}
