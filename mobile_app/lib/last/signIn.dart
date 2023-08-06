import 'package:flutter/material.dart';
import 'package:mobile_app/home_page.dart';
import 'package:mobile_app/login_register_page.dart';
import 'package:mobile_app/ui/authenpage/appname.dart';
import 'package:mobile_app/ui/authenpage/login_button.dart';
import 'package:mobile_app/ui/authenpage/toggle_in.dart';
import 'package:mobile_app/ui/authenpage/heart_icon.dart';
import 'package:mobile_app/ui/authenpage/input.dart';
import 'package:mobile_app/ui/authenpage/robot.dart';
import 'package:mobile_app/ui/authenpage/welcome_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_app/auth.dart';

class signIn extends StatefulWidget {
  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<signIn> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  String? errorMessage = '';

  List<bool> _SelectSign_Up = <bool>[true, false];
  Color color = Color(0xFFD9D9D9);

  final _formKey = GlobalKey<FormState>();
  Icon Eyes = Icon(
    Icons.visibility_off,
    color: Colors.grey,
  );
  bool CheckEye = true;

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Color(0xFF24B6A4),
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              //
              Container(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                margin: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                    ),
                  ],
                ),
              ),

              //ชื่อแอพ
              Appname(description: 'HeartRisk Assessment'),

              Positioned(
                  child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 140, 30, 0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Card(
                                  color: Color.fromARGB(255, 232, 236, 233),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 20, 20, 20),
                                    child: Column(
                                      children: [
                                        //ปุ่ม
                                        AuthenticationToggle(),

                                        //welcome screen
                                        WelcomeScreen(),

                                        //input
                                        Input('email', _controllerEmail),
                                        Input('password', _controllerPassword),

                                        //signin button
                                        LoginButton(
                                            title: 'sign in',
                                            sFunction:
                                                signInWithEmailAndPassword)
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    HeartIcon(),
                  ],
                ),
              )),
              RobotIcon(),
            ],
          ),
        ),
      ),
    );
  }
}
