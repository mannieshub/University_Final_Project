import 'package:flutter/material.dart';

class userManualPage extends StatefulWidget {
  @override
  userManualPageState createState() => userManualPageState();
}

class userManualPageState extends State<userManualPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFFEBA37A),
          title: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 236, 178, 145),
                    textStyle:
                        TextStyle(fontSize: 15), // เปลี่ยนสีปุ่มเป็นสีแดง
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    // รหัสที่ต้องการให้ทำเมื่อปุ่มถูกกด
                  },
                  child: Text(
                    'Back',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: 'Inter'),
                  ),
                ),
                Text(
                  "คู่มือการใช้งาน",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontFamily: 'Kanit'),
                ),
                Text("           ")
              ],
            ),
          ),
        ),
        body: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Container(
                        color: Color(0XFFFFEEDD),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: Column(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Card(
                                  color: Color(0xFFEBA37A),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 20, 10, 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              "คู่มือการใช้งาน",
                                              style: TextStyle(
                                                fontFamily: 'Kanit',
                                                fontSize: 20,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 10),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(
                                                'เมือผู้ใช้เข้ามาสู่ในระบบผู้ใช้จะพบกับหน้าหลักที่มีระบบดั้งนี้',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontFamily: 'Kanit',
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 10),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(
                                                '1.ในแถบด้านบนสุดผู้ใช้จะพบกับเปอร์เซนต์ที่เป็น 0% ก่อน เนื่องจากผู้ใช้ยังไม่ได้เข้าไปประเมินในระบบของเราและผู้ใช้สามารถสามารถกด "คลิกเพื่อดูรายละเอียด" เพื่อไปดูว่าผู้ใช้มีความเสี่ยงอะไรบ้าง',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontFamily: 'Kanit',
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 10),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(
                                                '2.ในแถบที่อยู่ตรงกลางจะมี 3 ปุ่มให้ผู้ใช้ได้เลือกใช้',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontFamily: 'Kanit',
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 10, 10),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(
                                                '2.1 ปุ่มให้คำแนะนำ เมื่อผู้ใช้กดเข้าไปผู้ใช้จะพบกับคำแนะนำที่ช่วยลดความเสี่ยงการเป็นโรคหลอดเลือดหัวใจ',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontFamily: 'Kanit',
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 10, 10),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(
                                                '2.2 ปุ่มคู่มือการใช้งาน เมื่อผู้ใช้กดเข้าไปผู้ใช้จะพบกับรายละเอียดของระบบว่ามีอะไรยังไงบ้าง',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontFamily: 'Kanit',
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 10, 10),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(
                                                '2.3 ปุ่มกดออกจากระบบ เมื่อผู้ใช้กดระบบจะนำผู้ใช้ออกจากระบบไปยังหน้า sign in',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontFamily: 'Kanit',
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 10),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(
                                                '3.ในแถบที่อยู่ตรงล่างจะมี 2 แถบให้ผู้ใช้ได้เลือกใช้',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontFamily: 'Kanit',
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 10, 10),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(
                                                '3.1 ในแถบ CHD 10 years risk score เมื่อผู้ใช้กด "คลิกเพื่อดูรายละเอียด" เมื่อผู้ใช้กดระบบส่งผู้ใช้ไปหน้าแนะนำก่อนประเมิน และเมื่อผู้ใช้อ่านรายละเอียดคำแนะนำเรียบร้อยแล้ว จึงจะกดปุ่ม "เริ่มประเมินความเสี่ยง" ระบบจะส่งผู้ใช้ไปหน้าประเมินเพื่อไปหน้าประเมินโรคหลอดเลือดหัวใจ และเมื่อผู้ใช้กรอกแบบประเมินในหน้าประเมินเรียบร้อยแล้ว จึงจะกดปุ่ม "ประเมินความเสี่ยง" พอกดประเมินจะมีหน้า Pop up แจ้งผลการประเมินให้ผู้ใช้ได้ทราบ และ จะอัปเดตค่าไปยังหน้าหลักให้ผู้ใช้ได้ทราบหลังประเมินเสร็จ',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontFamily: 'Kanit',
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 10, 10),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(
                                                '3.1 ในแถบ Q&A เมื่อผู้ใช้กด "คลิกเพื่อเริ่มสอบถาม" เมื่อผู้ใช้กดระบบส่งผู้ใช้ไปหน้าแนะนำก่อนจะถามแช็ตบอทและเมื่อผู้ใช้อ่านรายละเอียดคำแนะนำเรียบร้อยแล้ว จึงจะกดปุ่ม "เริ่มสอบถาม" ระบบจะส่งผู้ใช้ไปหน้าแช็ตบอทเพื่อเริ่มสอบถามเกี่ยวกับโรคหลอดเลือดหัวใจ โดยคำถามที่ผู้ใช้สามารถสอบถามได้จะมีแค่คำถามเกี่ยวกับโรคหลอดเลือดหัวใจเท่านั้น',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontFamily: 'Kanit',
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )))));
  }
}
