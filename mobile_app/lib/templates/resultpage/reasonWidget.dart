import 'package:flutter/material.dart';

class ReasonWidget extends StatelessWidget {
  final String imagePath;
  final String message1;
  final String message2;
  final Color color;

  ReasonWidget(
      {required this.imagePath,
      required this.message1,
      required this.message2,
      required this.color});

  @override
  Widget build(BuildContext context) {
    // ดึงขนาดหน้าจอปัจจุบัน
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: color,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                    imagePath,
                                    width: screenWidth * 0.125, // กำหนดความกว้างของไอคอนตามขนาดหน้าจอ
                                    height: screenWidth * 0.13, // กำหนดความสูงของไอคอนตามขนาดหน้าจอ
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        message1,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: 'Kanit',
                                            fontSize: screenWidth * 0.035, // กำหนดขนาดตัวอักษรตามขนาดหน้าจอ
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        message2,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: 'Kanit',
                                          fontSize: screenWidth * 0.032, // กำหนดขนาดตัวอักษรตามขนาดหน้าจอ
                                        ),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
