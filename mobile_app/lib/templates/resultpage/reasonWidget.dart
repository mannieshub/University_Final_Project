import 'package:flutter/material.dart';

class reasonWidget extends StatelessWidget {
  final String imagePath;
  final String message1;
  final String message2;
  final Color color;

  reasonWidget(
      {required this.imagePath,
      required this.message1,
      required this.message2,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // เพิ่มเส้นขอบ
              ),
              color: color, //0xFFFD7272
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
                                    borderRadius: BorderRadius.circular(
                                        10), // เพิ่มเส้นขอบ
                                  ),
                                  child: Image.asset(
                                    imagePath,
                                    // ระบุเส้นทางของไอคอนภาพ
                                    width: 50, // กำหนดความกว้างของไอคอน
                                    height: 50, // กำหนดความสูงของไอคอน
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
                                            fontSize: 13.5,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        message2,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: 'Kanit',
                                          fontSize: 12.5,
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
