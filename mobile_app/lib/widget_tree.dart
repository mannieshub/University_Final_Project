import 'package:mobile_app/auth.dart';
import 'package:mobile_app/home_page.dart';
import 'package:mobile_app/login_register_page.dart';
import 'package:flutter/material.dart';

import 'last/signIn.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return signIn();
        }
      },
    );
  }
}
