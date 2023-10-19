import 'package:flutter/material.dart';

//firebase authentication
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_app/authentication/auth.dart';
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
        //Display AppName with green background
        appBar: AppBar(
          title: _title(),
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFFEBA37A),
          centerTitle: true,
        ),

        //Display Content
        body: Container(
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
                      userManualWidget(
                        imagePath: 'images/book2.png',
                        text: 'คู่มือ',
                        color: Colors.white,
                      ),
                      signOutWidget(
                        imagePath: "images/Icon_Exit.png",
                        text: "ออกจากระบบ",
                        color: Color(0xFFFF4D4D),
                      ),
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

                // _userUid(),
                // _signOutButton(),
              ],
            ),
          ),
        ));
  }
}
