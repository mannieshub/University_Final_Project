import 'package:flutter/material.dart';
import 'package:mobile_app/routes/assessmentPage.dart';

class beforeAs extends StatefulWidget {
  @override
  _beforeAsState createState() => _beforeAsState();
}

class _beforeAsState extends State<beforeAs> {
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
                        fontFamily: 'Inter', fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "CHD 10 years risk score",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Inter', fontWeight: FontWeight.bold),
                ),
                Text(
                  "",
                  textAlign: TextAlign.center,
                ),
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
                        child: Container(
                          color: Color(0XFFFFEEDD),
                          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                          margin:
                              EdgeInsetsDirectional.fromSTEB(30, 30, 30, 30),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'images/DocPics.png',
                                      width:
                                          constraints.maxWidth * 0.8, // เพิ่มม
                                      height: 200,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "คุณเสี่ยงหรือไม่ ?",
                                      textAlign: TextAlign.center,
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Wrap(
                                  children: <Widget>[
                                    Text(
                                      'AI ประเมินความเสี่ยงเกี่ยวกับโรคหลอดเลือดหัวใจใน 10 ปี จากข้อมูลผู้ป่วยและปัจจัยเสี่ยง ทำให้สามารถระบุกลุ่มผู้ที่มีความเสี่ยงสูงและนำไปใช้ในการป้องกันและรักษาโรคได้อย่างมีประสิทธิภาพ',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Color(0XFF5A5959),
                                        fontFamily: 'Kanit',
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Column(
                                  children: <Widget>[
                                    Wrap(
                                      //แต่ก่อนเคย เป็น Row
                                      children: [
                                        Container(
                                          //เพิ่ม
                                          width: constraints.maxWidth, //เพิ่ม
                                          child: Text(
                                            'หมายเหตุ : ไม่ได้มีแพทย์ในการประเมินความเสี่ยง',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: Color(0XFF5A5959),
                                              fontFamily: 'Kanit',
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFFEBA37A),
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            25, 15, 25, 15),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20), // กำหนดความโค้งของมุมปุ่ม
                                        ),

                                        textStyle: TextStyle(
                                            fontSize:
                                                15), // เปลี่ยนสีปุ่มเป็นสีแดง
                                      ),
                                      onPressed: () {
                                        // รหัสที่ต้องการให้ทำเมื่อปุ่มถูกกด
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => assessmentPage(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'เริ่มประเมินความเสี่ยง',
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
