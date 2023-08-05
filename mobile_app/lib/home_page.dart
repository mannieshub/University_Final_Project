import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_app/auth.dart';
import 'package:mobile_app/before_assessment_page.dart';
import 'package:mobile_app/before_chatbot_page.dart';
import 'package:mobile_app/ui/goTobefore.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text(
      'Mobile Assessing for likelihood of CHD',
      style: TextStyle(
        color: Colors.white, // กำหนดสีของ Text เป็นสีขาว
      ),
    );
  }

  Widget _userUid() {
    return Text(user?.email ?? 'user email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      style: ElevatedButton.styleFrom(
        primary: Color(0xFFCC4F4F), // กำหนดสีพื้นหลังเป็นสีแดง
      ),
      child: Text(
        'Sign Out',
        style: TextStyle(color: Colors.white), // กำหนดสีของ Text เป็นสีขาว
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: _title(),
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF4FCCBD),
        ),
        body: Container(
          color: Color(0XFFF1F4F8),
          child: Container(
            color: Color(0XFFF1F4F8),
            margin: EdgeInsetsDirectional.fromSTEB(10, 30, 10, 30),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                  child: Column(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Card(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "WELCOME BACK",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Inter'),
                                        ),
                                        Text(
                                          "ชิมมินกยู",
                                          style: TextStyle(
                                            fontFamily: 'Kanit',
                                            fontSize: 17,
                                          ),
                                        )
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 30, 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "คำแนะนำเพื่อลดความเสี่ยงของตัวเอง",
                                          style: TextStyle(
                                            fontFamily: 'Kanit',
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 10, 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                  ]),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 10, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "* กรุณาเลือกเมนูที่คุณต้องการตรวจเกี่ยวกับโรคหลอดเลือดหัวใจ",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Kanit',
                        ),
                      )
                    ],
                  ),
                ),
                NextPageButton(
                  imgPath: 'images/icon.png',
                  message1: 'CHD 10 years risk score',
                  message2:
                      'ประเมินความเสี่ยงการเป็นโรคหลอดเลือดหัวใจภายใน 10 ปี',
                  destination:
                      before_As(), // Replace with your desired destination widget.
                ),
                NextPageButton(
                  imgPath: 'images/icon1.png',
                  message1: 'CHD 10 years risk score',
                  message2: 'สอบถามเกี่ยวกับโรคหลอดเลือดหัวใจ',
                  destination:
                      before_Chatbot(), // Replace with your desired destination widget.
                ),
                // _userUid(),
                _signOutButton(),
              ],
            ),
          ),
        ));
  }
}
