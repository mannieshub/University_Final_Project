import 'package:flutter/material.dart';
import '/routes/home_page.dart';

class signUpButton extends StatelessWidget {
  const signUpButton({super.key});

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                child: Text(
                  'Sign Up',
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
