import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//firebase authentication
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_app/authentication/auth.dart';
import 'package:mobile_app/models/user_models.dart';

//UI
import 'package:mobile_app/templates/authenpage/appname.dart';
import 'package:mobile_app/templates/authenpage/createAcc_text.dart';
import 'package:mobile_app/templates/authenpage/input.dart';
import 'package:mobile_app/templates/authenpage/password.dart';
import 'package:mobile_app/templates/authenpage/welcome_text.dart';
import '../routes/home_page.dart';
import '../templates/authenpage/heart_icon.dart';
import '../templates/authenpage/robot.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';

  //user state
  bool isLogin = true;

  //Email and Password from input
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth()
          .createUserWithEmailAndPassword(
              email: _controllerEmail.text, password: _controllerPassword.text)
          .then((value) => {postDetailToFireStore()});
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  postDetailToFireStore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = Auth().currentUser;
    UserModel userModel = UserModel();

    userModel.uid = user!.uid;
    userModel.email = user!.email;
    userModel.username = null;

    await firebaseFirestore
        .collection("Users")
        .doc(user.uid)
        .set(userModel.toMap());
    //Fluttertoast.showToast(msg: "Create Account Successfully");

    //go to homeplace
    Navigator.pushReplacement(
      context as BuildContext,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  //when Input wrong format
  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  //when pressed do function signIn/signUp
  Widget _submitButton() {
    return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF24B6A4),
                  padding: EdgeInsetsDirectional.fromSTEB(65, 13, 65, 13),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30), // กำหนดความโค้งของมุมปุ่ม
                  ),
                  textStyle: TextStyle(fontSize: 15), // เปลี่ยนสีปุ่มเป็นสีแดง
                ),
                onPressed: isLogin
                    ? signInWithEmailAndPassword
                    : createUserWithEmailAndPassword,
                child: Text(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                    isLogin ? 'Login' : 'Register'))
          ])
        ]));
  }

  //when pressed switch text from Login to Register and Register to Login position under _submitButton
  Widget _loginOrRegisterButton() {
    return TextButton(
        onPressed: () {
          setState(() {
            isLogin = !isLogin;
          });
        },
        child: Text(isLogin ? 'Register instead' : 'Login instead'));
  }

  //Display text under toggle
  Widget _createOrSignInText() {
    return isLogin ? WelcomeScreen() : createAccText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Color(0xFF4FD0C1), //4FD0C1
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
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
                                  color: Color.fromARGB(
                                      255, 235, 236, 233), // สีนี้ FFFBFB
                                  elevation:
                                      4, // เพิ่มค่า elevation เพื่อเพิ่ม drop shadow
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        25), // กำหนดความโค้งของมุมปุ่ม
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        _createOrSignInText(),
                                        Input('Email', _controllerEmail),
                                        PasswordInput(
                                            'Password', _controllerPassword),
                                        SizedBox(height: 10),
                                        _errorMessage(),
                                        SizedBox(height: 10),
                                        _submitButton(),
                                        _loginOrRegisterButton(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
