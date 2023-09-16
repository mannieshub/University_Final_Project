import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController controller;
  final String title;

  PasswordInput(this.title, this.controller);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.zero,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFD9D9D9), // สีขอบ
                          width: 1.5, // ความกว้างของเส้นขอบ
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      height: 63,
                      width: 290,
                      child: TextFormField(
                        controller: widget.controller,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: widget.title,
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(20, 14, 0, 14),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // ส่วนอื่น ๆ ที่คุณต้องการเพิ่มลงไป
        ],
      ),
    );
  }
}
