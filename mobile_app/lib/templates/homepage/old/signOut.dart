import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signOutButton extends StatelessWidget {
  final String text;
  final String imgPath;
  final Color color;

  const signOutButton({
    required this.text,
    required this.imgPath,
    required this.color,
  });

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

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
                      signOut();
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(
                            color: Colors.grey, width: 1.0), // เพิ่มเส้นขอบ
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
