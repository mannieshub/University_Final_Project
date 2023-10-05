import 'package:flutter/material.dart';

class AdviceWidget extends StatelessWidget {
  final String imagePath;
  final String text;
  AdviceWidget({required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            imagePath,
            width: 110,
            height: 110,
          ),
          SizedBox(height: 10), // เพิ่มระยะห่างระหว่างรูปภาพและข้อความ
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Kanit',
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
