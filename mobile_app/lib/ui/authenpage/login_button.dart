import 'package:flutter/material.dart';

import '../../home_page.dart';

class LoginButton extends StatelessWidget {
  final String title;
  final Function sFunction;

  const LoginButton({
    required this.title,
    required this.sFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                onPressed: () async {
                  sFunction();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
