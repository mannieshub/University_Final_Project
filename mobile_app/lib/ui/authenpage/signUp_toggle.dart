import 'package:flutter/material.dart';

class signUpToggle extends StatefulWidget {
  final Function(bool) callbackFunction;
  final Function(bool) isLoginState;

  signUpToggle({required this.callbackFunction, required this.isLoginState});

  @override
  _signUpToggleState createState() => _signUpToggleState();
}

class _signUpToggleState extends State<signUpToggle> {
  List<bool> _selectSign_Up = [false, true];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 10),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: ToggleButtons(
                constraints: BoxConstraints(
                    maxWidth: 110, minWidth: 110, minHeight: 37, maxHeight: 37),
                isSelected: _selectSign_Up,
                children: <Widget>[
                  Text(
                    "Sign In",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < _selectSign_Up.length; i++) {
                      _selectSign_Up[i] = i == index;
                    }
                  });
                  if (_selectSign_Up[0]) {
                    widget.isLoginState(false); // ตั้งค่า isLogin เป็น false
                    widget.callbackFunction(
                        false); // เรียกใช้งาน callback function ใน LoginPage
                  }
                },
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                fillColor: Colors.white,
                renderBorder: false,
              ))
        ]));
  }
}
