import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final String title;

  bool checkErrorEditUsername = false;

  Input(this.title, this.controller);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
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
                          color: checkErrorEditUsername
                              ? Colors.red
                              : Color(0xFFD9D9D9), // สีขอบ
                          width: 1.5, // ความกว้างของเส้นขอบ
                        ),
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      width: 270,
                      child: TextFormField(
                        controller: controller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: title,
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(20, 14, 0, 14),
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
