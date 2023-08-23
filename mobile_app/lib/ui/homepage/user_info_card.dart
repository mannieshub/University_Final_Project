import 'package:flutter/material.dart';

//firebase authentication
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_app/authentication/auth.dart';

class UserInfoCard extends StatelessWidget {
  final User? user = Auth().currentUser;

  Widget _userUid() {
    return Text(
      user?.email ?? 'user email',
      style: TextStyle(
        fontFamily: 'Kanit',
        fontSize: 17,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "WELCOME BACK",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Inter'),
                              ),
                              //display user email
                              _userUid(),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 35.0,
                              backgroundImage:
                                  AssetImage('images/user-icon.png'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 0, 30, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "คำแนะนำเพื่อลดความเสี่ยงของตัวเอง",
                                style: TextStyle(
                                  fontFamily: 'Kanit',
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '● นอนให้เพียงพอ',
                                        style: TextStyle(
                                          fontFamily: 'Kanit',
                                          color: Color(0XFF5A5959),
                                        ),
                                      ),
                                      Text(
                                        '● ลดการกินของทอด',
                                        style: TextStyle(
                                          fontFamily: 'Kanit',
                                          color: Color(0XFF5A5959),
                                        ),
                                      ),
                                      Text(
                                        '● ออกกำลังกายสม่ำเสมอ',
                                        style: TextStyle(
                                          fontFamily: 'Kanit',
                                          color: Color(0XFF5A5959),
                                        ),
                                      ),
                                      Text(
                                        '● งดสูบบุหรี่',
                                        style: TextStyle(
                                          fontFamily: 'Kanit',
                                          color: Color(0XFF5A5959),
                                        ),
                                      ),
                                    ]),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "ความเสี่ยง",
                                style: TextStyle(fontFamily: 'Kanit'),
                              ),
                              Text(
                                "40%",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
