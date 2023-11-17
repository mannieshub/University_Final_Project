import 'package:flutter/material.dart';
import 'package:mobile_app/routes/chatbot_page.dart';

class beforeChat extends StatefulWidget {
  @override
  _beforeChatState createState() => _beforeChatState();
}

class _beforeChatState extends State<beforeChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                    backgroundColor: Color(0xFFFEBE9A),
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
                  "Q&A",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontFamily: 'Inter'),
                ),
                Text(
                  "     ",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        body: LayoutBuilder(
            //เพิ่ม
            builder: (context, constraints) => SingleChildScrollView(
                //เพิ่ม
                child: ConstrainedBox(
                    //เพิ่ม
                    constraints: BoxConstraints(
                      //เพิ่ม
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      //เพิ่ม
                      child: Container(
                        color: Color(0XFFFFEEDD),
                        child: Container(
                          color: Color(0XFFFFEEDD),
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          margin: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 0),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center, //เพิ่ม
                                  children: [
                                    //เพิ่ม
                                    Container(
                                      //เพิ่ม
                                      width: constraints.maxWidth * 0.8, //เพิ่ม
                                      child: Image.asset(
                                        'images/DocPics1.png',
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                child: Wrap(
                                  children: [
                                    Container(
                                      //เพิ่ม
                                      width: constraints.maxWidth, //เพิ่ม
                                      child: Text(
                                        "สอบถามสิ่งที่คุณสงสัยเกี่ยวกับโรคหลอดเลือดหัวใจ ?",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          fontFamily: 'Kanit',
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Wrap(
                                  children: <Widget>[
                                    Container(
                                        width: constraints.maxWidth,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'ตอบคำถามที่คุณสงสัย โดยแชทบอทที่พัฒนาขึ้น สามารถถามคำถามได้ดังต่อไปนี้',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontFamily: 'Kanit',
                                                color: Color(0XFF5A5959),
                                                fontSize: 17,
                                              ),
                                            ),
                                            Text(
                                              '     1. ปัจจัยเสี่ยงแต่ละด้านของโรคหลอดเลือดหัวใจ',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontFamily: 'Kanit',
                                                color: Color(0XFF5A5959),
                                                fontSize: 17,
                                              ),
                                            ),
                                            Text(
                                              '     2. วิธีการดูแลตัวเองเพื่อหลีกเลี่ยงการเกิดโรค',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontFamily: 'Kanit',
                                                color: Color(0XFF5A5959),
                                                fontSize: 17,
                                              ),
                                            ),
                                            Text(
                                              '     3. อาการของโรคหลอดเลือดหัวใจ',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontFamily: 'Kanit',
                                                color: Color(0XFF5A5959),
                                                fontSize: 17,
                                              ),
                                            ),
                                            Text(
                                              '     4. โรคหลอดเลือดหัวใจคืออะไร',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontFamily: 'Kanit',
                                                color: Color(0XFF5A5959),
                                                fontSize: 17,
                                              ),
                                            ),
                                            Text(
                                              '     5. โรคหลอดเลือดหัวใจเกิดจากอะไร',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontFamily: 'Kanit',
                                                color: Color(0XFF5A5959),
                                                fontSize: 17,
                                              ),
                                            ),
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                child: Column(
                                  children: <Widget>[
                                    Wrap(
                                      children: [
                                        Container(
                                          width: constraints.maxWidth * 1,
                                          child: Text(
                                            'หมายเหตุ : ไม่ได้ตอบคำถามโดยแพทย์',
                                            style: TextStyle(
                                              fontFamily: 'Kanit',
                                              color: Color(0XFF5A5959),
                                              fontSize: 17,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 50, 0, 50),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFFEBA37A),
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            45, 15, 45, 15),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20), // กำหนดความโค้งของมุมปุ่ม
                                        ),

                                        textStyle: TextStyle(
                                            fontSize:
                                                15), // เปลี่ยนสีปุ่มเป็นสีแดง
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => chatUI(),
                                          ),
                                        );
                                        // รหัสที่ต้องการให้ทำเมื่อปุ่มถูกกด
                                      },
                                      child: Text(
                                        'เริ่มสอบถาม',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Kanit',
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
                    )))));
  }
}
