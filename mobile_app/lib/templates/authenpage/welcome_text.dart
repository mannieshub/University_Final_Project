import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 10),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
            child: Row(
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Wrap(
            children: [
              Text(
                'Fill out the information below in the order to access your account.',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          // ส่วนอื่น ๆ ที่คุณต้องการเพิ่มลงไป
        ],
      ),
    );
  }
}
