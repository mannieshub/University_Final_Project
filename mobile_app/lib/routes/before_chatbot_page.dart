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
        backgroundColor: Color(0xFF4FCCBD),
        title: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF7EDCD1),
                  textStyle: TextStyle(fontSize: 15), // เปลี่ยนสีปุ่มเป็นสีแดง
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
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Inter'),
              ),
              Text(
                "     ",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: Container(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          margin: EdgeInsetsDirectional.fromSTEB(30, 10, 30, 0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset('images/DocPics1.png')],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: Wrap(
                  children: [
                    Text(
                      "สอบถามสิ่งที่คุณสงสัยเกี่ยวกับโรคหลอดเลือดหัวใจ ?",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        fontFamily: 'Kanit',
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Wrap(
                  children: <Widget>[
                    Text(
                      'นี่คือสิ่งที่คุณสามารถสอบถามเราได้ โดยจะตอบกลับโดยแชทบอทที่เราได้สร้างขึ้นมา และนี่คือสิ่งที่คุณสามารถถามแชทบอทของเราได้',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        color: Color(0XFF5A5959),
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Wrap(
                  children: <Widget>[
                    Text(
                      '● โรคหลอดเลือดหัวใจ คืออะไร ?',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        color: Color(0XFF5A5959),
                      ),
                    ),
                    Text(
                      '● อาการของโรคหลอดเลือดหัวใจ มีอะไรบ้าง ?',
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        color: Color(0XFF5A5959),
                      ),
                    ),
                    Text(
                      '● โรคหลอดเลือดหัวใจ เกิดจากอะไร ?',
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        color: Color(0XFF5A5959),
                      ),
                    ),
                    Text(
                      '● ปัจจัยเสี่ยงโรคหลอดเลือดหัวใจ มีอะไรบ้าง ?',
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        color: Color(0XFF5A5959),
                      ),
                    ),
                    Text(
                      '● ทำไมฉันจึงเสี่ยงเป็นโรคหลอดเลือดหัวใจ ?',
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        color: Color(0XFF5A5959),
                      ),
                    ),
                    Text(
                      '● วิธีการดูแลตัวเองเพื่อเลี่ยงการเป็นโรคหลอดเลือดหัวใจ',
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        color: Color(0XFF5A5959),
                      ),
                    ),
                    Text(
                      '● วิธีการดูแลตัวเองเมื่อเป็นโรคหลอดเลือดหัวใจ',
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        color: Color(0XFF5A5959),
                      ),
                    ),
                    Text(
                      '● คำถามทั้งหมดที่สามารถถามได้',
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        color: Color(0XFF5A5959),
                      ),
                    ),
                    Text(
                      '● ทีมพัฒนาใช้อะไรในการประเมินความเสี่ยงของผู้ใช้',
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        color: Color(0XFF5A5959),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          'หมายเหตุ : ไม่ได้ตอบคำถามโดยแพทย์',
                          style: TextStyle(
                            fontFamily: 'Kanit',
                            color: Color(0XFF5A5959),
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF4FCCBD),
                        padding: EdgeInsetsDirectional.fromSTEB(45, 15, 45, 15),
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
                            builder: (context) => chatbot(),
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
    );
  }
}
