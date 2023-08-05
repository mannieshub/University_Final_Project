import 'package:flutter/material.dart';
import 'package:mobile_app/chatbot_page.dart';
import 'package:mobile_app/home_page.dart';

class before_Chatbot extends StatefulWidget {
  const before_Chatbot({super.key});

  @override
  State<before_Chatbot> createState() => _before_ChatbotState();
}

class _before_ChatbotState extends State<before_Chatbot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage()), // เปิดหน้า chatbot
                  );
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
                              builder: (context) =>
                                  chatbot()), // เปิดหน้า chatbot
                        );
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
