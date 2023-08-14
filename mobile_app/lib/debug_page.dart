import 'package:flutter/material.dart';
import 'package:mobile_app/chatbot_page.dart';
import 'package:mobile_app/last/signIn.dart';
import 'package:mobile_app/last/signUp.dart';
import 'package:mobile_app/ui/homepage/debug_button.dart';

class debugPage extends StatelessWidget {
  const debugPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('Debug')),
        body: Container(
            child: Container(
                padding: EdgeInsetsDirectional.all(30),
                child: Column(children: [
                  Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0)),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      debugButton(msg: 'SignInPage', destination: signInPage()),
                      debugButton(msg: 'SignUpPage', destination: signUpPage()),
                      debugButton(msg: 'ChatbotPage', destination: chatbot()),
                    ],
                  ),
                ]))));
  }
}
