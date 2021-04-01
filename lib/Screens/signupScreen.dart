import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_application_1/Screens/SignInScreen.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _db = FirebaseFirestore.instance;

class SignUpScreen extends StatefulWidget {
  static String id = "SignUp";
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String full_name;
  String selectStandard;
  String email;
  String password;
  bool _passwordVisible = false;
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;

  bool isEmptyEmail = false;
  bool isEmptyPassword = false;
  bool isEmptyName = false;
  bool isStandardSelected = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool standardSelected;
  @override
  void initState() {
    _passwordVisible = false;
  }

  Widget _buildName() {
    return TextFormField(
      // controller:TextEditingController.name,
      cursorColor: Colors.black,
      cursorHeight: 20,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20),
      decoration: kTextFormfielddecoration.copyWith(
        prefix: Opacity(
            opacity: 0.80,
            child: Icon(Icons.account_circle, size: 40, color: Colors.black)),
        suffix: Opacity(
            opacity: 0.0,
            child: Icon(FontAwesomeIcons.userCircle, color: Colors.black)),
        hintText: 'Full Name',
        hintStyle: TextStyle(fontSize: 20),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Name is Required";
        }
        if (value.length > 100) {
          return "Try to enter your Full name in 100 characters ";
        }
      },
      onSaved: (String value) {
        full_name = value;
      },
    );
  }

  Widget _buildStandard() {
    return FutureBuilder(
        future: GetStd(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return spinkit;
          } else {
            List<String> standards = snapshot.data;
            return DropdownButtonFormField(
              style: TextStyle(fontSize: 20),
              decoration: kTextFormfielddecoration.copyWith(
                hintText: 'Select your Standard',
                hintStyle: TextStyle(fontSize: 20),
                prefix: Opacity(
                    opacity: 0.80,
                    child: Icon(FontAwesomeIcons.graduationCap,
                        size: 40, color: Colors.black)),
              ),
              items: standards
                  .map((value) => DropdownMenuItem(
                        child: Center(
                          child: Text(
                            value,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        value: value,
                      ))
                  .toList(),
              onChanged: (selectedStandard) {
                setState(() {
                  selectStandard = selectedStandard;
                  standardSelected = true;
                });
              },
              value: selectStandard,
              validator: (value) {
                if (value == null) {
                  return "Select your standard";
                }
              },
            );
          }
        });
  }

  Widget _buildEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.black,
      cursorHeight: 20,
      style: TextStyle(fontSize: 20),
      textAlign: TextAlign.center,
      decoration: kTextFormfielddecoration.copyWith(
        hintText: 'Email',
        hintStyle: TextStyle(fontSize: 20),
        prefix: Opacity(
            opacity: 0.80,
            child:
                Icon(FontAwesomeIcons.envelope, size: 40, color: Colors.black)),
        suffix: Opacity(
            opacity: 0.0,
            child: Icon(FontAwesomeIcons.envelope, color: Colors.black)),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Email is Required";
        }
        if (value.length > 230) {
          return "Your email is too long ";
        }
        if (!EmailValidator.validate(value)) {
          return "Please Enter the Valid E-MAIL Address ";
        }
        return null;
      },
      onChanged: (String value) {
        email = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      cursorColor: Colors.black,
      cursorHeight: 20,
      style: TextStyle(fontSize: 20),
      textAlign: TextAlign.center,
      obscureText: !_passwordVisible,
      decoration: kTextFormfielddecoration.copyWith(
          hintText: 'Password',
          hintStyle: TextStyle(fontSize: 20),
          prefix: Opacity(
              opacity: 0.80,
              child: Icon(
                Icons.lock,
                size: 32,
              )),
          suffix: IconButton(
              icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              })),
      validator: (String value) {
        if (value.isEmpty) {
          return "Password is Required";
        }
        if (value.length < 6) {
          return "Your password is too short";
        }
      },
      onChanged: (String value) {
        password = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Sign Up")),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(25),
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildName(),
                      SizedBox(
                        height: 30,
                      ),
                      _buildStandard(),
                      SizedBox(
                        height: 30,
                      ),
                      _buildEmail(),
                      SizedBox(
                        height: 30,
                      ),
                      _buildPassword(),
                      SizedBox(
                        height: 100,
                      ),
                      ElevatedButton(
                          child: Text(
                            "Sign up",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blue[600])),
                          onPressed: () async {
                            if (!_formKey.currentState.validate()) {
                              return;
                            } else {
                              _formKey.currentState.save();
                            }
                            if (email == null) {
                              setState(() {
                                isEmptyEmail = true;
                              });
                            }
                            if (password == null) {
                              setState(() {
                                isEmptyPassword = true;
                              });
                            }
                            if (full_name == null) {
                              setState(() {
                                isEmptyName = true;
                              });
                            } else {
                              setState(() {
                                showSpinner = true;
                              });
                              await signUp(context);
                            }
                          }),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }

  Future<List<String>> GetStd() async {
    print("GetStd called");
    List<String> st = [];
    var s = await _db
        .collection('Starting DropDown List')
        .doc('StandardList')
        .get()
        .then((DocumentSnapshot ds) {
      return ds.data;
    }).catchError((e) {
      print(e);
    });
    print(s().toString());
    s().forEach((k, v) => st.add((v)));
    print(st);

    return st;
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
                var firebaseUser = _auth.currentUser;
                _db.collection("users").doc(firebaseUser.uid).set({
                  "Full Name": full_name,
                  "Standard": selectStandard,
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
            child: Text('Try Again'),
            onPressed: () => setState(() {}),
            width: 100,
          ),
        ],
      ).show();
    }
  }
}
