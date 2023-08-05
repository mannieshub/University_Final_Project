import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextEditingController _emailcontroller = TextEditingController();
  bool checkErrorEditUsername = false;

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
                        validator: (value) {
                          //ตัวแปร value คือ ค่าที่ input เข้ามาอยากใช้ input(ของแมน) ให้ value = input ส่วนของอีเมลนะ ***
                          //ใส่บรรทัดข้างล่างนี้เลย ใส่ input บรรณทัด 261
                          value = 'Inputของแมน ส่วนของอีเมล';
                        },
                        controller: _emailcontroller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email'.toString(),
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
