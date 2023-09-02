import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String text;
  final Widget destination;
  final String imgPath;
  final Color color;

  const MenuButton({
    required this.text,
    required this.destination,
    required this.imgPath,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => destination,
                          //ตรงนี้ส่วนของลิ้งไปหน้าผลการประเมิน
                          //ตอนนี้ยังไม่มีหน้านั้นเลยลิ้งหน้าเดิมไปก่อน
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(
                            color:
                                Colors.grey.withOpacity(0.2), //ปรับความเข้มขอบ
                            width: 1.0), // เพิ่มเส้นขอบ
                      ),
                      color: color,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        imgPath,
                                        // ระบุเส้นทางของไอคอนภาพ
                                        width: 40, // กำหนดความกว้างของไอคอน
                                        height: 40, // กำหนดความสูงของไอคอน
                                      ),
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
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      fontFamily: 'Kanit',
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
