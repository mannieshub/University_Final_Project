import 'package:flutter/material.dart';

//firebase authentication
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_app/authentication/auth.dart';
import 'package:mobile_app/routes/BMI.dart';
import 'package:mobile_app/routes/advice.dart';
import 'package:mobile_app/routes/userManualPage.dart';
import 'package:mobile_app/templates/homepage/card.dart';
import 'package:mobile_app/templates/homepage/signOutBTN.dart';
import 'package:mobile_app/templates/homepage/userManual.dart';

//routes
import '/routes/before_chatbot_page.dart';
import 'package:mobile_app/routes/before_assessment_page.dart';

//UI
import 'package:mobile_app/templates/homepage/navigatePush.dart';
import 'package:mobile_app/templates/homepage/user_info_card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    //Navigator.pushReplacement(context, LoginPage());
  }

  Widget _title() {
    return const Text(
      'HeartRisk Assessment',
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
    return Scaffold(
        //Display AppName with green background
        appBar: AppBar(
          title: _title(),
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFFEBA37A),
          centerTitle: true,
        ),

        //Display Content
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                          minHeight: constraints.maxHeight * 1.1,
                          //minWidth: constraints.maxWidth,
                        ),
              child: IntrinsicHeight(
                child: Container(
                  color: Color(0XFFFFEEDD),
                  child: Container(
                    color: Color(0x000000),
                    margin: EdgeInsetsDirectional.fromSTEB(10, 30, 10, 30),
                    child: Column(
                      children: <Widget>[
                        UserInfoCard(),
                        const SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              CardWidget(
                                destinationPage: advicePage(),
                                imagePath: 'images/Icon_HandHeart.png',
                                text: 'คำแนะนำ',
                              ),
                              CardWidget(
                                  destinationPage: BMI_Page(),
                                  imagePath: 'images/Bmi_P.png',
                                  text: "ดัชนีมวลกาย")
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
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
                        //Button
                        NextPageButton(
                          imgPath: 'images/icon.png',
                          message1: 'CHD 10 years risk score',
                          message2: 'ประเมินความเสี่ยงการเป็นโรคหลอดเลือดหัวใจ',
                          destination:
                              beforeAs(), // Replace with your desired destination widget.
                        ),
          
                        NextPageButton(
                          imgPath: 'images/icon1.png',
                          message1: 'Q&A',
                          message2: 'สอบถามเกี่ยวกับโรคหลอดเลือดหัวใจ',
                          destination:
                              beforeChat(), // Replace with your desired destination widget.
                        ),
                        Container(
                            //เพิ่มนะ
                            width: constraints.maxWidth * 0.7,
                            child: FittedBox(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 10, 0, 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "ต้องการออกจากระบบ? ",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: 'Kanit',
                                      ),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          _showAlertDialogExit(context);
                                        },
                                        child: Text(
                                          "ออกจากระบบ",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontFamily: 'Kanit',
                                            decoration: TextDecoration
                                                .underline, // เพิ่มเส้นใต้
                                            decorationColor: Colors
                                                .red, // เปลี่ยนสีของเส้นใต้เป็นสีแดง
                                            decorationThickness:
                                                1.5, // กำหนดความหนาของเส้นใต้
                                                fontWeight: FontWeight.bold
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            )),
          
                        // _userUid(),
                        // _signOutButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
