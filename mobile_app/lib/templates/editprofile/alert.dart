import 'package:flutter/material.dart';
import 'package:mobile_app/routes/home_page.dart';

class AlertDialogs {
  static void showSaveDataAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ... รายละเอียดการแสดง AlertDialog สำหรับบันทึกข้อมูล
            AlertDialog(
              backgroundColor: Color(0XFFD9D9D9),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              titlePadding: const EdgeInsets.all(0),
              title: Container(
                padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
              ),
              content: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Wrap(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 32,
                          backgroundImage: AssetImage('images/Icon_True.png'),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Text(
                        "บันทึกข้อมูลเรียบร้อยแล้ว", //ส่วนของ ข้อความ title ที่พิ้นหลังสีแดงๆ
                        style: TextStyle(
                            fontFamily: 'kanit',
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD9D9D9),
                      padding: EdgeInsetsDirectional.fromSTEB(35, 10, 35, 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // กำหนดความโค้งของมุมปุ่ม
                      ),

                      textStyle:
                          TextStyle(fontSize: 15), // เปลี่ยนสีปุ่มเป็นสีแดง
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                          //ลิ้งไปหน้า home page
                        ),
                      );
                      // เอาไว้ลิ้งไปหน้าอื่นอันนี้จะเป็นแบบย้อนกลับไปหน้าก่อนหน้านี้
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Kanit',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  static void showErrorSaveDataAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ... รายละเอียดการแสดง AlertDialog สำหรับแจ้งเตือนข้อผิดพลาดในการบันทึกข้อมูล
            AlertDialog(
              backgroundColor: Color(0XFFD9D9D9),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              titlePadding: const EdgeInsets.all(0),
              title: Container(
                  padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "แจ้งเตือนผู้ใช้", //ส่วนของ ข้อความ title ที่พิ้นหลังสีแดงๆ
                        style: TextStyle(
                            fontFamily: 'kanit',
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              content: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Wrap(
                      children: <Widget>[
                        Text(
                          "เนื่องจากผู้ใช้ทำการทำการเปลี่ยนแปลงข้อมูล กรุณาบันทึกข้อมูลเพื่อบันทึกข้อมูล",
                          textAlign: TextAlign
                              .center, //ส่วนของ ข้อความ title ที่พิ้นหลังสีแดงๆ
                          style: TextStyle(
                              fontFamily: 'kanit',
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /*actions: [
            TextButton(onPressed: () {}, child: Text("yes")),
            TextButton(onPressed: () {}, child: Text("no"))
          ],*/

              //elevation: 24,
              //backgroundColor: Colors.blue,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD9D9D9),
                      padding: EdgeInsetsDirectional.fromSTEB(35, 10, 35, 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // กำหนดความโค้งของมุมปุ่ม
                      ),

                      textStyle:
                          TextStyle(fontSize: 15), // เปลี่ยนสีปุ่มเป็นสีแดง
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      // เอาไว้ลิ้งไปหน้าอื่นอันนี้จะเป็นแบบย้อนกลับไปหน้าก่อนหน้านี้
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Kanit',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
