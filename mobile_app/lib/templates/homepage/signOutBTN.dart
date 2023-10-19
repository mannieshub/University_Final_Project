import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/authentication/login_register_page.dart';

class signOutWidget extends StatelessWidget {
  final String imagePath;
  final String text;
  final Color color;

  signOutWidget(
      {required this.imagePath, required this.text, required this.color});

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  void _showAlertDialogExit(BuildContext context) {
    //ฟังก์ชันแสดงตัวAlert
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return (Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AlertDialog(
              backgroundColor: Color(0XFFD9D9D9),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              titlePadding: const EdgeInsets.all(0),

              content: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "ต้องการออกจากระบบใช่หรือไม่",
                            style: TextStyle(fontFamily: 'Kanit', fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFEBA37A),
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(35, 8, 35, 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    15), // กำหนดความโค้งของมุมปุ่ม
                              ),

                              textStyle: TextStyle(
                                  fontSize: 15), // เปลี่ยนสีปุ่มเป็นสีแดง
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              // เอาไว้ลิ้งไปหน้าอื่นอันนี้จะเป็นแบบย้อนกลับไปหน้าก่อนหน้านี้
                            },
                            child: Text(
                              'ไม่',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: 'Kanit',
                                fontSize: 18,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFF0000),
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(35, 8, 35, 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    15), // กำหนดความโค้งของมุมปุ่ม
                              ),

                              textStyle: TextStyle(
                                  fontSize: 15), // เปลี่ยนสีปุ่มเป็นสีแดง
                            ),
                            onPressed: () {
                              signOut();
                              Navigator.of(context).pop();
                              // เอาไว้ลิ้งไปหน้าอื่นอันนี้จะเป็นแบบย้อนกลับไปหน้าก่อนหน้านี้
                            },
                            child: Text(
                              'ใช่',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: 'Kanit',
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
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
          ],
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _showAlertDialogExit(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(15), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.25),
                            spreadRadius: 0,
                            blurRadius: 6,
                            offset: Offset(1, 1), // X and Y offset
                          ),
                        ],
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Color(0xFFFF4D4D),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30, 17.5, 30, 17.5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              'images/Icon_Exit.png',
                                              width: 25,
                                              height: 25,
                                            ),
                                          ],
                                        )
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
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );

    // return Column(
    //   children: [
    //     Padding(
    //       padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
    //       child: Column(
    //         children: [
    //           GestureDetector(
    //             onTap: () {
    //               signOut();
    //             },
    //             child: ClipRRect(
    //               borderRadius: BorderRadius.circular(25),
    //               child: Card(
    //                 shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(15), // เพิ่มเส้นขอบ
    //                 ),
    //                 color: color,
    //                 child: Column(
    //                   children: [
    //                     Padding(
    //                       padding:
    //                           EdgeInsetsDirectional.fromSTEB(6, 7.5, 6, 7.5),
    //                       child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Padding(
    //                             padding:
    //                                 EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
    //                             child: Column(
    //                               children: [
    //                                 Row(
    //                                   children: [
    //                                     Image.asset(
    //                                       imagePath, // Specify the image path here
    //                                       width: 25,
    //                                       height: 45,
    //                                     ),
    //                                     Padding(
    //                                       padding:
    //                                           EdgeInsetsDirectional.fromSTEB(
    //                                               10, 0, 5, 0),
    //                                       child: Text(
    //                                         text, // Specify the text here
    //                                         style: TextStyle(
    //                                           fontSize: 13,
    //                                           fontFamily: 'Kanit',
    //                                         ),
    //                                       ),
    //                                     )
    //                                   ],
    //                                 )
    //                               ],
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }
}
