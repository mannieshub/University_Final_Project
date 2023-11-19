import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BMI_Page extends StatefulWidget {
  @override
  _BMI_PageState createState() => _BMI_PageState();
}

enum SingingCharacter { lafayette, jefferson }

class _BMI_PageState extends State<BMI_Page> {
  //ค่าที่ได้จากตัวแปรใช้จริง จะอยู่ส่วนของท้ายๆโค้ด
  //ตัวแปรไว้รับค่า wiget ต่างๆ ---------------------------------------------------------------------------------
  //set ค่า TextController ของ textfield ส่วนของ อายุ ที่ user จะกรอกให้มีค่าเริ่มต้นที่ 0 บรรณทัด 398

  //set ค่า TextController ของ textfield ส่วนของ Cholesterolในเลือด ที่ user จะกรอกให้มีค่าเริ่มต้นที่ 0 บรรณทัด 1406 ++++++++++++++++++
  TextEditingController textEditingControllerWeight =
      TextEditingController(text: '0');
  //set ค่า TextController ของ textfield ส่วนของ ต่าความดันตัวบน ที่ user จะกรอกให้มีค่าเริ่มต้นที่ 0 บรรณทัด 1483 ++++++++++++++++++++++++
  TextEditingController textEditingControllerHight =
      TextEditingController(text: '0');

  //set ageslider เป็น double เพื่อรับค่า จาก slider (sliderมันรับเฉพาะDoubleเท่านั้น)
  double bmi = 1.0;
  //set smokeperdayslider เป็น double เพื่อรับค่า จาก slider (sliderมันรับเฉพาะDoubleเท่านั้น)

  //----------------------------------------
  //ตัวแปรนี้มีไว้เก็บค่า Cholesterolในเลือด ที่เราเติมใน textfleid จาก textEditingController อีกที
  double Cholesterol = 0;
  //ตัวแปรนี้มีไว้เก็บค่า ค่าความดันตัวบน ที่เราเติมใน textfleid จาก textEditingController อีกที
  double SYS = 0;

  //ตัวแปรนี้มีไว้เก็บค่า ระกับการศึกษา จะมี 4 ค่าตามคือ 1 2 3 4 ของ radio ที่เราเลือก สามารถแก้ค่า ทั้ง 4 ได้ในบรรทัดตามลำดับดังนี้ 542 575 608 641
  int EducationLevel = 0;

  bool BoolCheckCholesterolVisible = false;

  bool BoolCheckSYSVisible = false;

  //---------------------------------------------------------------------------------------------------------------------------
  @override
  void initState() {
    //function มีไว้ set EducationLevel = 1; เมื่อเริ่ม มันจะอยู่ช้อย radio ที่ 1 ก่อน
    super.initState();

    EducationLevel = 1;
  }

  setEducationLevel(int val) {
    //function มีไว้ อัพเดทค่า EducationLevel
    setState(() {
      EducationLevel = val;
    });
  }

  double calculateBMI(double weight, double height) {
    return weight / ((height / 100) * (height / 100));
  }

  void _showAlertDialogsErrorSaveData(BuildContext context) {
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
              title: Container(
                  padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "แจ้งเตือนผู้ใช้", //ส่วนของ ข้อความ title ที่พิ้นหลังสีแดงๆ
                        style: TextStyle(
                            fontFamily: 'kanit',
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              content: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Wrap(
                      children: <Widget>[
                        Text(
                          "กรุณากรอกข้อมูลให้เรียบร้อยและตรงตามเงื่อนไข",
                          textAlign: TextAlign
                              .center, //ส่วนของ ข้อความ title ที่พิ้นหลังสีแดงๆ
                          style: TextStyle(
                              fontFamily: 'kanit',
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD9D9D9),
                      padding: EdgeInsetsDirectional.fromSTEB(35, 10, 35, 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // กำหนดความโค้งของมุมปุ่ม
                      ),

                      textStyle:
                          TextStyle(fontSize: 15), // เปลี่ยนสีปุ่มเป็นสีแดง
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      // เอาไว้ลิ้งไปหน้าอื่นอันนี้จะเป็นแบบย้อนกลับไปหน้าก่อนหน้านี้
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Kanit',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
      },
    );
  }

  void _showAlertDialogsResultData(BuildContext context) {
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
              title: Container(
                  padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "ผลการคำนวณ (BMI)", //ส่วนของ ข้อความ title ที่พิ้นหลังสีแดงๆ
                        style: TextStyle(
                            fontFamily: 'kanit',
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              content: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Wrap(
                      children: <Widget>[
                        Text(
                          "ผลการคำนวณค่าดัชนีมวลกายของท่านคือ $bmi",
                          textAlign: TextAlign
                              .center, //ส่วนของ ข้อความ title ที่พิ้นหลังสีแดงๆ
                          style: TextStyle(
                              fontFamily: 'kanit',
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD9D9D9),
                      padding: EdgeInsetsDirectional.fromSTEB(35, 10, 35, 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // กำหนดความโค้งของมุมปุ่ม
                      ),

                      textStyle:
                          TextStyle(fontSize: 15), // เปลี่ยนสีปุ่มเป็นสีแดง
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      // เอาไว้ลิ้งไปหน้าอื่นอันนี้จะเป็นแบบย้อนกลับไปหน้าก่อนหน้านี้
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Kanit',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
      },
    );
  }

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "คำนวนดัชนีมวลกาย (BMI)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontFamily: 'Kanit'),
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
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    30, 30, 30, 30),
                                child: Container(
                                    //color: Color(0XFFFEBE9A),
                                    width: constraints.maxWidth * 1,
                                    child: FittedBox(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  //color: Color(0XFFFEBE9A),
                                                  width: constraints.maxWidth *
                                                      0.833,
                                                  child: FittedBox(
                                                    child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 0, 0),
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30),
                                                                child: Card(
                                                                    color: Color(
                                                                        0XFFFEBE9A),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              20,
                                                                              0,
                                                                              20),
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          //Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 0,0, 0),)
                                                                          Container(
                                                                              //color: Color(0XFFFEBE9A),
                                                                              width: constraints.maxWidth * 0.833,
                                                                              child: FittedBox(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                  child: Column(
                                                                                    children: [
                                                                                      Row(
                                                                                        children: [
                                                                                          Text(
                                                                                            "น้ำหนัก (Kg.)",
                                                                                            style: TextStyle(fontFamily: 'Kanit', fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
                                                                                          ),
                                                                                          Text(
                                                                                            "                                                       ",
                                                                                            style: TextStyle(fontFamily: 'Kanit', fontSize: 15),
                                                                                          )
                                                                                        ],
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              )),
                                                                          Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                                                                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                                                                                  child: Column(
                                                                                    children: [
                                                                                      ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                        child: Container(
                                                                                            color: Color(0XFFFFFFFF),
                                                                                            height: 50,
                                                                                            width: constraints.maxWidth * 0.75, // กำหนดความกว้างที่คุณต้องการ
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                                                                                              child: TextFormField(
                                                                                                validator: (value) {
                                                                                                  setState(() {
                                                                                                    Cholesterol = double.parse(value.toString());
                                                                                                  });
                                                                                                },
                                                                                                onChanged: (value) => {
                                                                                                  if (value == "" || value[0] == "." || value[0] == "0")
                                                                                                    {
                                                                                                      setState(() {
                                                                                                        BoolCheckCholesterolVisible = true;
                                                                                                      })
                                                                                                    }
                                                                                                  else
                                                                                                    {
                                                                                                      setState(() {
                                                                                                        BoolCheckCholesterolVisible = false;
                                                                                                      })
                                                                                                    }
                                                                                                },
                                                                                                controller: textEditingControllerWeight,
                                                                                                keyboardType: TextInputType.number,
                                                                                                inputFormatters: <TextInputFormatter>[
                                                                                                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                                                                                                ],
                                                                                                decoration: InputDecoration(
                                                                                                  hintText: "$Cholesterol",
                                                                                                  border: InputBorder.none,

                                                                                                  //textEditingControllerAge
                                                                                                ),
                                                                                                // ค่าอื่น ๆ ของ TextField
                                                                                              ),
                                                                                            )),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                  child: Column(
                                                                                    children: [
                                                                                      Text(
                                                                                        "Kg.",
                                                                                        style: TextStyle(fontFamily: 'Inter', fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                )
                                                                              ])),
                                                                          Visibility(
                                                                              visible: BoolCheckCholesterolVisible,
                                                                              child: Container(
                                                                                  //color: Color(0XFFFEBE9A),
                                                                                  width: constraints.maxWidth * 0.7,
                                                                                  child: FittedBox(
                                                                                      child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                    child: Row(
                                                                                      children: [
                                                                                        Text(
                                                                                          "* กรุณาใส่ข้อมูลนํ้าหนักของท่านให้ถูกต้อง",
                                                                                          style: TextStyle(fontFamily: 'Kanit', fontSize: 15, color: Colors.red),
                                                                                        )
                                                                                      ],
                                                                                    ),
                                                                                  )))),
                                                                          Container(
                                                                              //color: Color(0XFFFEBE9A),
                                                                              width: constraints.maxWidth * 0.833,
                                                                              child: FittedBox(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5, 10, 0, 0),
                                                                                  child: Column(
                                                                                    children: [
                                                                                      Row(
                                                                                        children: [
                                                                                          Text(
                                                                                            "ส่วนสูง (cm.)",
                                                                                            style: TextStyle(fontFamily: 'Kanit', fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
                                                                                          ),
                                                                                          Text(
                                                                                            "                                                       ",
                                                                                            style: TextStyle(fontFamily: 'Kanit', fontSize: 15),
                                                                                          )
                                                                                        ],
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              )),

                                                                          Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                                                                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(25, 0, 10, 0),
                                                                                  child: Column(
                                                                                    children: [
                                                                                      ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                        child: Container(
                                                                                            color: Color(0XFFFFFFFF),
                                                                                            height: 50,
                                                                                            width: constraints.maxWidth * 0.75, // กำหนดความกว้างที่คุณต้องการ
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                                                                                              child: TextFormField(
                                                                                                validator: (value) {},
                                                                                                onChanged: (value) => {
                                                                                                  if (value == "" || value[0] == "." || value[0] == "0")
                                                                                                    {
                                                                                                      setState(() {
                                                                                                        BoolCheckSYSVisible = true;
                                                                                                      })
                                                                                                    }
                                                                                                  else
                                                                                                    {
                                                                                                      setState(() {
                                                                                                        BoolCheckSYSVisible = false;
                                                                                                      })
                                                                                                    }
                                                                                                },
                                                                                                controller: textEditingControllerHight,
                                                                                                keyboardType: TextInputType.number,
                                                                                                inputFormatters: <TextInputFormatter>[
                                                                                                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                                                                                                ],
                                                                                                decoration: InputDecoration(
                                                                                                  hintText: "$SYS",
                                                                                                  border: InputBorder.none,

                                                                                                  //textEditingControllerAge
                                                                                                ),
                                                                                                // ค่าอื่น ๆ ของ TextField
                                                                                              ),
                                                                                            )),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                                  child: Column(
                                                                                    children: [
                                                                                      Text(
                                                                                        "cm.",
                                                                                        style: TextStyle(fontFamily: 'Inter', fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                )
                                                                              ])),

                                                                          Visibility(
                                                                              visible: BoolCheckSYSVisible,
                                                                              child: Container(
                                                                                  //color: Color(0XFFFEBE9A),
                                                                                  width: constraints.maxWidth * 0.7,
                                                                                  child: FittedBox(
                                                                                      child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                    child: Row(
                                                                                      children: [
                                                                                        Text(
                                                                                          "* กรุณาใส่ข้อมูลส่วนสูงของท่านให้ถูกต้อง",
                                                                                          style: TextStyle(fontFamily: 'Kanit', fontSize: 15, color: Colors.red),
                                                                                        )
                                                                                      ],
                                                                                    ),
                                                                                  )))),

                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                0,
                                                                                10),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ))),
                                                          ],
                                                        )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                    //color: Color(0XFFFEBE9A),
                                                    width:
                                                        constraints.maxWidth *
                                                            0.86,
                                                    child: FittedBox(
                                                        child: GestureDetector(
                                                            onTap: () {
                                                              if (textEditingControllerWeight
                                                                      .text ==
                                                                  "0") {
                                                                setState(() {
                                                                  BoolCheckCholesterolVisible =
                                                                      true;
                                                                });
                                                              }

                                                              if (textEditingControllerHight
                                                                      .text ==
                                                                  "0") {
                                                                setState(() {
                                                                  BoolCheckSYSVisible =
                                                                      true;
                                                                });
                                                              }
                                                              //แก้เพิ่ม
                                                              if (BoolCheckCholesterolVisible ||
                                                                  BoolCheckSYSVisible) {
                                                                _showAlertDialogsErrorSaveData(
                                                                    context);
                                                              } else {
                                                                setState(() {
                                                                  bmi = calculateBMI(
                                                                      double.parse(
                                                                          textEditingControllerWeight
                                                                              .text),
                                                                      double.parse(
                                                                          textEditingControllerHight
                                                                              .text));
                                                                  String
                                                                      formattedNumber =
                                                                      bmi.toStringAsFixed(
                                                                          2);
                                                                  bmi = double
                                                                      .parse(
                                                                          formattedNumber);
                                                                });
                                                                _showAlertDialogsResultData(
                                                                    context);
                                                              }
                                                            },
                                                            child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            5,
                                                                            0,
                                                                            0),
                                                                child: Column(
                                                                    children: [
                                                                      ClipRRect(
                                                                          child: Card(
                                                                              color: Color(0XFFFEBE9A),
                                                                              child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(60, 5, 60, 5),
                                                                                  child: Row(
                                                                                    children: [
                                                                                      Text(
                                                                                        "คำนวน",
                                                                                        style: TextStyle(fontFamily: 'kanit', fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                                                                                      )
                                                                                    ],
                                                                                  ))))
                                                                    ]))))),
                                              ],
                                            )
                                          ]),
                                    )))))))));
  }
}
