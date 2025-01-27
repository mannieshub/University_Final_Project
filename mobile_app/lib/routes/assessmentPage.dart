import 'package:flutter/material.dart';

//UI
import 'package:flutter/services.dart';

//function
import '../services/AdviceInsert.dart';
import 'package:mobile_app/services/API_services.dart';

//FireStore
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_app/models/user_data.dart'; //user info data

//Firebase Authentication
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_app/authentication/auth.dart';

class assessmentPage extends StatefulWidget {
  const assessmentPage({super.key});

  @override
  State<assessmentPage> createState() => _assessmentPageState();
}

class _assessmentPageState extends State<assessmentPage> {
  //demographic
  final TextEditingController genderController =
      TextEditingController(text: '0');
  final TextEditingController ageController = TextEditingController(text: '0');
  double ageslider = 1.0;
  int age = 0;
  int gender = 0;
  List<bool> _Selectgender = <bool>[true, false];

  //behavior
  final TextEditingController educationController =
      TextEditingController(text: '0');
  final TextEditingController currentSmokerController =
      TextEditingController(text: '1');
  final TextEditingController cigsPerDayController =
      TextEditingController(text: '0');
  List<bool> _SelectSmoke = <bool>[true, false];
  double smokeperdayslider = 1.0;
  int smokeperday = 0;
  int smoke = 1;
  int EducationLevel = 0;

  bool checkInputData = true;

  void initState() {
    super.initState();
    EducationLevel = 1;
  }

  setEducationLevel(int val) {
    setState(() {
      EducationLevel = val;
    });
  }

  void checkData() {
    if (ageController == "0" ||
        BPMedsController == "0" ||
        totCholController == "0" ||
        sysBPController == "0" ||
        diaBPController == "0" ||
        BMIController == "0" ||
        heartRateController == "0" ||
        glucoseController == "0") {
      checkInputData = false;
    } else {
      checkInputData = true;
    }
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

  //medical history
  //BPMed
  List<bool> _SelectPressure = <bool>[true, false];
  int PressureMedicine = 1;

  //Stroke
  List<bool> _SelectStroke = <bool>[true, false];
  int Stroke = 1;

  //Hypertension
  List<bool> _SelectBloodPressure = <bool>[true, false];
  int BloodPressure = 1;

  //Diabetes
  List<bool> _SelectDiabetes = <bool>[true, false];
  int Diabetes = 1;

  //TextEditingController
  final TextEditingController BPMedsController =
      TextEditingController(text: '1');
  final TextEditingController prevalentStrokeController =
      TextEditingController(text: '1');
  final TextEditingController prevalentHypController =
      TextEditingController(text: '1');
  final TextEditingController diabetesController =
      TextEditingController(text: '1');

  //medical history - current
  double Cholesterol = 0;
  double Glucose = 0;
  double Heartrate = 0;
  double BMI = 0;
  double SysBP = 0;
  double DiaBP = 0;

  final TextEditingController totCholController =
      TextEditingController(text: '0');
  final TextEditingController sysBPController =
      TextEditingController(text: '0');
  final TextEditingController diaBPController =
      TextEditingController(text: '0');
  final TextEditingController BMIController = TextEditingController(text: '0');
  final TextEditingController heartRateController =
      TextEditingController(text: '0');
  final TextEditingController glucoseController =
      TextEditingController(text: '0');

  bool boolCheckSmokingVisible = false;
  bool boolCheckCholesterolVisible = false;
  bool boolCheckGlucoseVisible = false;
  bool boolCheckHeartRateVisible = false;
  bool boolCheckBMIVisible = false;
  bool boolCheckSysVisible = false;
  bool boolCheckDiaVisible = false;

  //advice
  postDataToFireStore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = Auth().currentUser;
    UserData userData = UserData();

    userData.uid = user!.uid;
    userData.gender = genderController.text;
    userData.age = ageController.text;
    userData.education = educationController.text;
    userData.currentSmoker = currentSmokerController.text;
    userData.cigsPerDay = cigsPerDayController.text;
    userData.BPMeds = BPMedsController.text;
    userData.prevalentStroke = prevalentStrokeController.text;
    userData.prevalentHyp = prevalentHypController.text;
    userData.diabetes = diabetesController.text;
    userData.totChol = totCholController.text;
    userData.sysBP = sysBPController.text;
    userData.diaBP = diaBPController.text;
    userData.BMI = BMIController.text;
    userData.heartRate = heartRateController.text;
    userData.glucose = glucoseController.text;

    await firebaseFirestore
        .collection("UserData")
        .doc(user.uid)
        .set(userData.toMap());
    Fluttertoast.showToast(msg: "Insert successfully");
  }

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
                  "CHD 10 years risk score",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontFamily: 'Inter'),
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
                        color: Color(0XFFF9CEA5),
                        child: Container(
                          color: Color(0XFFF9CEA5),
                          margin:
                              EdgeInsetsDirectional.fromSTEB(30, 30, 30, 30),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25, 0, 0, 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "ข้อมูลด้านประชากร",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Kanit',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              //demographic
                              Container(
                                width: constraints.maxWidth * 0.833,
                                child: FittedBox(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 350,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    25), // กำหนดความโค้งของมุมปุ่ม
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20, 20, 20, 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  //ของใน card เป็น row ๆ ไป
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              10),
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Text(
                                                                            "เพศ:",
                                                                            style:
                                                                                TextStyle(fontFamily: 'Kanit', fontSize: 15),
                                                                          ),
                                                                          Text(
                                                                              "        "),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                30,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                ToggleButtons(
                                                                              constraints: BoxConstraints(maxWidth: 90, minWidth: 70, minHeight: 35, maxHeight: 35),
                                                                              isSelected: _Selectgender,
                                                                              children: <Widget>[
                                                                                Container(
                                                                                    width: 20,
                                                                                    child: new Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: <Widget>[
                                                                                        new Icon(
                                                                                          Icons.male,
                                                                                          size: 20,
                                                                                          color: Colors.blue,
                                                                                        ),
                                                                                      ],
                                                                                    )),
                                                                                Container(
                                                                                    width: 20,
                                                                                    child: new Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: <Widget>[
                                                                                        new Icon(
                                                                                          Icons.female,
                                                                                          size: 20.0,
                                                                                          color: Colors.pink,
                                                                                        ),
                                                                                      ],
                                                                                    )),
                                                                              ],
                                                                              onPressed: (int index) {
                                                                                setState(() {
                                                                                  for (int i = 0; i < _Selectgender.length; i++) {
                                                                                    _Selectgender[i] = i == index;
                                                                                  }
                                                                                  if (_Selectgender[0]) {
                                                                                    gender = 0;
                                                                                    print("ชาย = $gender");
                                                                                  } else {
                                                                                    gender = 1;
                                                                                    print("หญิง = $gender");
                                                                                  }
                                                                                });
                                                                              },
                                                                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                              "                   "),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            "อายุ",
                                                                            style:
                                                                                TextStyle(fontFamily: 'Kanit', fontSize: 15),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child: Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Column(
                                                                                children: [
                                                                                  Slider(
                                                                                    value: ageslider,
                                                                                    onChanged: (newRating) {
                                                                                      setState(
                                                                                        () => ageslider = newRating, //รับค่าจาก slider มาใน agelider
                                                                                      );
                                                                                      setState(() {
                                                                                        age = ageslider //เปลี่ยน double เป็น integer เพื่ออะไปใช้ต่อ
                                                                                            .floor();

                                                                                        //ค่า age คือค่าใช้จริง
                                                                                      });
                                                                                      setState(() {
                                                                                        //รับค่าจาก slider มาใน textEditingController ของ textfleid เพื่อแสดงค่าปัจุบันให้ user เห็น
                                                                                        ageController.text = (newRating.floor()).toString();
                                                                                      });
                                                                                    },
                                                                                    min: 0,
                                                                                    max: 100,
                                                                                    divisions: 100,
                                                                                    label: "$age",
                                                                                  )
                                                                                ],
                                                                              ),
                                                                              Column(
                                                                                children: [
                                                                                  Container(
                                                                                    width: 27, // กำหนดความกว้างที่คุณต้องการ
                                                                                    child: TextFormField(
                                                                                      validator: (value) {},
                                                                                      controller: ageController,
                                                                                      keyboardType: TextInputType.number,
                                                                                      decoration: InputDecoration(
                                                                                        hintText: "$age",
                                                                                        border: InputBorder.none,

                                                                                        //textEditingControllerAge
                                                                                      ),
                                                                                      // ค่าอื่น ๆ ของ TextField
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                child: Column(
                                                                                  children: [
                                                                                    Text(
                                                                                      "ปี",
                                                                                      style: TextStyle(fontFamily: 'Kanit', fontSize: 15),
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              )
                                                                            ]))
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Row(
                                  children: [
                                    Text(
                                      "ข้อมูลด้านพฤติกรรม",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Kanit',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              //behavior
                              Container(
                                width: constraints.maxWidth * 0.833,
                                child: FittedBox(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            width: 350,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                child: Card(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25), // กำหนดความโค้งของมุมปุ่ม
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(10, 10,
                                                                  10, 10),
                                                      child: Column(
                                                        children: [
                                                          //Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 0,0, 0),)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          5), // Add padding here
                                                                  child: Text(
                                                                    "ประวัติการศึกษา",
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Kanit',
                                                                      fontSize:
                                                                          15,
                                                                    ),
                                                                  ),
                                                                ),
                                                                // SizedBox(height: 10), // You can remove this line
                                                              ],
                                                            ),
                                                          ),

                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        10),
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: <Widget>[
                                                                    Container(
                                                                      height:
                                                                          24,
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Radio(
                                                                            value:
                                                                                1,
                                                                            groupValue:
                                                                                EducationLevel,
                                                                            onChanged:
                                                                                (val) {
                                                                              setState(() {
                                                                                EducationLevel = val as int;
                                                                              });
                                                                              educationController.text = "1"; // Set the text to "1"
                                                                            },
                                                                          ),
                                                                          Text(
                                                                            "ต่ำกว่าระดับมัธยมตอนต้น",
                                                                            style:
                                                                                TextStyle(fontFamily: 'Kanit', fontSize: 12),
                                                                          ),
                                                                          Text(
                                                                              "                                          "),
                                                                        ],
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: <Widget>[
                                                                    Container(
                                                                      height:
                                                                          24,
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Radio(
                                                                            value:
                                                                                2,
                                                                            groupValue:
                                                                                EducationLevel,
                                                                            onChanged:
                                                                                (val) {
                                                                              setState(() {
                                                                                EducationLevel = val as int;
                                                                              });
                                                                              educationController.text = "2"; // Set the text to "1"
                                                                            },
                                                                          ),
                                                                          Text(
                                                                            "ระดับมัธยมตอนปลาย",
                                                                            style:
                                                                                TextStyle(fontFamily: 'Kanit', fontSize: 12),
                                                                          ),
                                                                          Text(
                                                                              "                                             "),
                                                                        ],
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: <Widget>[
                                                                    Container(
                                                                      height:
                                                                          24,
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Radio(
                                                                            value:
                                                                                3,
                                                                            groupValue:
                                                                                EducationLevel,
                                                                            onChanged:
                                                                                (val) {
                                                                              setState(() {
                                                                                EducationLevel = val as int;
                                                                              });
                                                                              educationController.text = "3"; // Set the text to "1"
                                                                            },
                                                                          ),
                                                                          Text(
                                                                            "ระดับปริญญาตรี",
                                                                            style:
                                                                                TextStyle(fontFamily: 'Kanit', fontSize: 12),
                                                                          ),
                                                                          Text(
                                                                              "                                                 "),
                                                                        ],
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: <Widget>[
                                                                    Container(
                                                                      height:
                                                                          24,
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Radio(
                                                                            value:
                                                                                4,
                                                                            groupValue:
                                                                                EducationLevel,
                                                                            onChanged:
                                                                                (val) {
                                                                              setState(() {
                                                                                EducationLevel = val as int;
                                                                              });
                                                                              educationController.text = "4"; // Set the text to "1"
                                                                            },
                                                                          ),
                                                                          Text(
                                                                            "สูงกว่าระดับปริญญาตรี",
                                                                            style:
                                                                                TextStyle(fontFamily: 'Kanit', fontSize: 12),
                                                                          ),
                                                                          Text(
                                                                              "                                        "),
                                                                        ],
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        10),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              10,
                                                                              0,
                                                                              0,
                                                                              0), // Add padding here
                                                                      child:
                                                                          Text(
                                                                        "ประวัติการสูบบุหรี่",
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'Kanit',
                                                                          fontSize:
                                                                              15,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              10,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        "ถ้าปัจจุบันเลิกสูบบุหรี่แล้วให้เลือก มี",
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'Kanit',
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              255,
                                                                              17,
                                                                              0),
                                                                          fontSize:
                                                                              12,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0,
                                                                          10,
                                                                          10,
                                                                          0), // Add top padding here
                                                                      child:
                                                                          ToggleButtons(
                                                                        constraints:
                                                                            BoxConstraints(
                                                                          maxWidth:
                                                                              55,
                                                                          minWidth:
                                                                              50,
                                                                          minHeight:
                                                                              35,
                                                                          maxHeight:
                                                                              35,
                                                                        ),
                                                                        isSelected:
                                                                            _SelectSmoke,
                                                                        children: <Widget>[
                                                                          Container(
                                                                            width:
                                                                                20,
                                                                            child:
                                                                                new Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: <Widget>[
                                                                                new Text(
                                                                                  "มี",
                                                                                  style: TextStyle(
                                                                                    color: Colors.red,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    fontFamily: 'Kanit',
                                                                                    fontSize: 15,
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                25,
                                                                            child:
                                                                                new Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: <Widget>[
                                                                                new Text(
                                                                                  "ไม่มี",
                                                                                  style: TextStyle(
                                                                                    color: Colors.blue,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    fontFamily: 'Kanit',
                                                                                    fontSize: 15,
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                        onPressed:
                                                                            (int
                                                                                index) {
                                                                          setState(
                                                                              () {
                                                                            for (int i = 0;
                                                                                i < _SelectSmoke.length;
                                                                                i++) {
                                                                              _SelectSmoke[i] = i == index;
                                                                            }
                                                                            if (_SelectSmoke[0]) {
                                                                              smoke = 1;

                                                                              currentSmokerController.text = "1";
                                                                              print("มีประวัติสูบบุหรี่ = $smoke");
                                                                            } else {
                                                                              smoke = 0;
                                                                              setState(() {
                                                                                cigsPerDayController.text = "0";
                                                                                smokeperday = int.parse(cigsPerDayController.text);
                                                                                setState(
                                                                                  () => smokeperdayslider = 0,
                                                                                );
                                                                                boolCheckSmokingVisible = true;
                                                                              });
                                                                              currentSmokerController.text = "0";
                                                                              print("ไม่มีมีประวัติสูบบุหรี่ = $smoke");
                                                                            }
                                                                          });
                                                                        },
                                                                        borderRadius: const BorderRadius
                                                                            .all(
                                                                            Radius.circular(20)),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        10,
                                                                        0,
                                                                        0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    "ปริมาณบุหรี่ที่สูบต่อวัน",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Kanit',
                                                                        fontSize:
                                                                            15),
                                                                  ),
                                                                ),
                                                                Text(
                                                                    "                                              ")
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Column(
                                                                      children: [
                                                                        Slider(
                                                                          value:
                                                                              smokeperdayslider,
                                                                          onChanged:
                                                                              (newRating) {
                                                                            if (smoke ==
                                                                                0) {
                                                                              setState(() {
                                                                                boolCheckSmokingVisible = true;
                                                                              });
                                                                              return null;
                                                                            }

                                                                            setState(
                                                                              () => smokeperdayslider = newRating, //รับค่าจากslider มาใน agelider
                                                                            );
                                                                            setState(() {
                                                                              smokeperday = smokeperdayslider //เปลี่ยน double เป็น integer เพื่ออะไปใช้ต่อ
                                                                                  .floor();
                                                                            });
                                                                            setState(() {
                                                                              //รับค่าจาก slider มาใน textEditingController ของ textfleid เพื่อแสดงค่าปัจุบันให้ user เห็น
                                                                              cigsPerDayController.text = (newRating.floor()).toString();
                                                                            });
                                                                          },
                                                                          min:
                                                                              0,
                                                                          max:
                                                                              100,
                                                                          divisions:
                                                                              100,
                                                                          label:
                                                                              "$smokeperday",
                                                                        )
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              27, // กำหนดความกว้างที่คุณต้องการ
                                                                          child:
                                                                              TextFormField(
                                                                            validator:
                                                                                (value) {},
                                                                            readOnly:
                                                                                boolCheckSmokingVisible,
                                                                            controller:
                                                                                cigsPerDayController,
                                                                            keyboardType:
                                                                                TextInputType.number,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              hintText: "$smokeperday",
                                                                              border: InputBorder.none,

                                                                              //textEditingControllerAge
                                                                            ),
                                                                            // ค่าอื่น ๆ ของ TextField
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          Text(
                                                                            "มวนต่อวัน",
                                                                            style:
                                                                                TextStyle(fontFamily: 'Kanit', fontSize: 15),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ]))
                                                        ],
                                                      ),
                                                    ))))
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              //medical
                              Padding(
                                // เริ่ม กล่อง ที่ ปรับเพิ่ม เริ่มตรงนนี้นะ ****
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 10, 0, 0),
                                child: Row(
                                  children: [
                                    Text(
                                      "ข้อมูลประวัติการแพทย์",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Kanit',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: constraints.maxWidth * 0.833,
                                child: FittedBox(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 350,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25), // กำหนดความโค้งของมุมปุ่ม
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 10, 10, 10),
                                                  child: Column(
                                                    children: [
                                                      //Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 0,0, 0),)

                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 5,
                                                                    10, 0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "ประวัติการรับยาลดความดัน",
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Kanit',
                                                                      fontSize:
                                                                          15),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                Text("")
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          30,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child:
                                                                      ToggleButtons(
                                                                    constraints: BoxConstraints(
                                                                        maxWidth:
                                                                            55,
                                                                        minWidth:
                                                                            50,
                                                                        minHeight:
                                                                            35,
                                                                        maxHeight:
                                                                            35),
                                                                    isSelected:
                                                                        _SelectPressure,
                                                                    children: <Widget>[
                                                                      Container(
                                                                          width:
                                                                              20,
                                                                          child:
                                                                              new Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: <Widget>[
                                                                              new Text(
                                                                                "มี",
                                                                                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontFamily: 'Kanit', fontSize: 15),
                                                                              )
                                                                            ],
                                                                          )),
                                                                      Container(
                                                                          width:
                                                                              25,
                                                                          child:
                                                                              new Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: <Widget>[
                                                                              new Text(
                                                                                "ไม่มี",
                                                                                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontFamily: 'Kanit', fontSize: 15),
                                                                              )
                                                                            ],
                                                                          )),
                                                                    ],
                                                                    onPressed: (int
                                                                        index) {
                                                                      setState(
                                                                          () {
                                                                        for (int i =
                                                                                0;
                                                                            i < _SelectPressure.length;
                                                                            i++) {
                                                                          _SelectPressure[i] =
                                                                              i == index;
                                                                        }
                                                                        if (_SelectPressure[
                                                                            0]) {
                                                                          PressureMedicine =
                                                                              1;
                                                                          prevalentHypController.text =
                                                                              "1";
                                                                          print(
                                                                              "มีประวัติความดันโลหิต = $PressureMedicine");
                                                                        } else {
                                                                          PressureMedicine =
                                                                              0;
                                                                          prevalentHypController.text =
                                                                              "0";
                                                                          print(
                                                                              "ไม่มีมีประวัติความดันโลหิต = $PressureMedicine");
                                                                        }
                                                                      });
                                                                    },
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .all(
                                                                            Radius.circular(20)),
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 5,
                                                                    10, 0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "ประวัติโรคหลอดเลือดสมอง",
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Kanit',
                                                                      fontSize:
                                                                          15),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          30,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child:
                                                                      ToggleButtons(
                                                                    constraints: BoxConstraints(
                                                                        maxWidth:
                                                                            55,
                                                                        minWidth:
                                                                            50,
                                                                        minHeight:
                                                                            35,
                                                                        maxHeight:
                                                                            35),
                                                                    isSelected:
                                                                        _SelectStroke,
                                                                    children: <Widget>[
                                                                      Container(
                                                                          width:
                                                                              20,
                                                                          child:
                                                                              new Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: <Widget>[
                                                                              new Text(
                                                                                "มี",
                                                                                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontFamily: 'Kanit', fontSize: 15),
                                                                              )
                                                                            ],
                                                                          )),
                                                                      Container(
                                                                          width:
                                                                              25,
                                                                          child:
                                                                              new Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: <Widget>[
                                                                              new Text(
                                                                                "ไม่มี",
                                                                                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontFamily: 'Kanit', fontSize: 15),
                                                                              )
                                                                            ],
                                                                          )),
                                                                    ],
                                                                    onPressed: (int
                                                                        index) {
                                                                      setState(
                                                                          () {
                                                                        for (int i =
                                                                                0;
                                                                            i < _SelectStroke.length;
                                                                            i++) {
                                                                          _SelectStroke[i] =
                                                                              i == index;
                                                                        }
                                                                        if (_SelectStroke[
                                                                            0]) {
                                                                          Stroke =
                                                                              1;
                                                                          prevalentStrokeController.text =
                                                                              "1";
                                                                          print(
                                                                              "มีประวัติโรคหลอดเลือดสมอง = $Stroke");
                                                                        } else {
                                                                          Stroke =
                                                                              0;
                                                                          prevalentStrokeController.text =
                                                                              "0";
                                                                          print(
                                                                              "ไม่มีมีประวัติโรดหลอดเลือดสมอง = $Stroke");
                                                                        }
                                                                      });
                                                                    },
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .all(
                                                                            Radius.circular(20)),
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 5,
                                                                    10, 0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "ประวัติโรคความดันโลหิต     ",
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Kanit',
                                                                      fontSize:
                                                                          15),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          30,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child:
                                                                      ToggleButtons(
                                                                    constraints: BoxConstraints(
                                                                        maxWidth:
                                                                            55,
                                                                        minWidth:
                                                                            50,
                                                                        minHeight:
                                                                            35,
                                                                        maxHeight:
                                                                            35),
                                                                    isSelected:
                                                                        _SelectBloodPressure,
                                                                    children: <Widget>[
                                                                      Container(
                                                                          width:
                                                                              20,
                                                                          child:
                                                                              new Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: <Widget>[
                                                                              new Text(
                                                                                "มี",
                                                                                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontFamily: 'Kanit', fontSize: 15),
                                                                              )
                                                                            ],
                                                                          )),
                                                                      Container(
                                                                          width:
                                                                              25,
                                                                          child:
                                                                              new Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: <Widget>[
                                                                              new Text(
                                                                                "ไม่มี",
                                                                                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontFamily: 'Kanit', fontSize: 15),
                                                                              )
                                                                            ],
                                                                          )),
                                                                    ],
                                                                    onPressed: (int
                                                                        index) {
                                                                      setState(
                                                                          () {
                                                                        for (int i =
                                                                                0;
                                                                            i < _SelectBloodPressure.length;
                                                                            i++) {
                                                                          _SelectBloodPressure[i] =
                                                                              i == index;
                                                                        }
                                                                        if (_SelectBloodPressure[
                                                                            0]) {
                                                                          BloodPressure =
                                                                              1;
                                                                          BPMedsController.text =
                                                                              "1";
                                                                          print(
                                                                              "มีประวัติความดันโลหิตสูง = $BloodPressure");
                                                                        } else {
                                                                          BloodPressure =
                                                                              0;
                                                                          BPMedsController.text =
                                                                              "0";
                                                                          print(
                                                                              "ไม่มีมีประวัติความดันโลหิตสูง = $BloodPressure");
                                                                        }
                                                                      });
                                                                    },
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .all(
                                                                            Radius.circular(20)),
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 5,
                                                                    10, 0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "ประวัติการเป็นโรคเบาหวาน",
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Kanit',
                                                                      fontSize:
                                                                          15),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          30,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child:
                                                                      ToggleButtons(
                                                                    constraints: BoxConstraints(
                                                                        maxWidth:
                                                                            55,
                                                                        minWidth:
                                                                            50,
                                                                        minHeight:
                                                                            35,
                                                                        maxHeight:
                                                                            35),
                                                                    isSelected:
                                                                        _SelectDiabetes,
                                                                    children: <Widget>[
                                                                      Container(
                                                                          width:
                                                                              20,
                                                                          child:
                                                                              new Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: <Widget>[
                                                                              new Text(
                                                                                "มี",
                                                                                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontFamily: 'Kanit', fontSize: 15),
                                                                              )
                                                                            ],
                                                                          )),
                                                                      Container(
                                                                          width:
                                                                              25,
                                                                          child:
                                                                              new Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: <Widget>[
                                                                              new Text(
                                                                                "ไม่มี",
                                                                                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontFamily: 'Kanit', fontSize: 15),
                                                                              )
                                                                            ],
                                                                          )),
                                                                    ],
                                                                    onPressed: (int
                                                                        index) {
                                                                      setState(
                                                                          () {
                                                                        for (int i =
                                                                                0;
                                                                            i < _SelectDiabetes.length;
                                                                            i++) {
                                                                          _SelectDiabetes[i] =
                                                                              i == index;
                                                                        }
                                                                        if (_SelectDiabetes[
                                                                            0]) {
                                                                          Diabetes =
                                                                              1;
                                                                          diabetesController.text =
                                                                              "1";
                                                                          print(
                                                                              "มีประวัติโรคเบาหวาน = $Diabetes");
                                                                        } else {
                                                                          Diabetes =
                                                                              0;
                                                                          diabetesController.text =
                                                                              "0";
                                                                          print(
                                                                              "ไม่มีมีประวัติโรคเบาหวาน = $Diabetes");
                                                                        }
                                                                      });
                                                                    },
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .all(
                                                                            Radius.circular(20)),
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              //medical history - current
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 10, 0, 0),
                                child: Row(
                                  children: [
                                    Text(
                                      "ข้อมูลประวัติการแพทย์",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Kanit',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: constraints.maxWidth * 0.833,
                                child: FittedBox(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 350,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              child: Card(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25), // กำหนดความโค้งของมุมปุ่ม
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 10, 10, 10),
                                                    child: Column(
                                                      children: [
                                                        //Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 0,0, 0),)

                                                        Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        10,
                                                                        10,
                                                                        0),
                                                            child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      Text(
                                                                        "ระดับคอเลสเตอรอลในเลือด",
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                'Kanit',
                                                                            fontSize:
                                                                                15),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                          child: Container(
                                                                              color: Color(0XFFD9D9D9),
                                                                              height: 39,
                                                                              width: 70, // กำหนดความกว้างที่คุณต้องการ
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
                                                                                          boolCheckCholesterolVisible = true;
                                                                                        })
                                                                                      }
                                                                                    else if (double.parse(totCholController.text) >= 100 && double.parse(totCholController.text) <= 350)
                                                                                      {
                                                                                        setState(() {
                                                                                          boolCheckCholesterolVisible = false;
                                                                                        })
                                                                                      }
                                                                                    else
                                                                                      {
                                                                                        setState(() {
                                                                                          boolCheckCholesterolVisible = true;
                                                                                        })
                                                                                      }
                                                                                  },
                                                                                  controller: totCholController,
                                                                                  keyboardType: TextInputType.number,
                                                                                  inputFormatters: <TextInputFormatter>[
                                                                                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Text(
                                                                          "mg/dL",
                                                                          style: TextStyle(
                                                                              fontFamily: 'Inter',
                                                                              fontSize: 13),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  )
                                                                ])),

                                                        Visibility(
                                                            visible:
                                                                boolCheckCholesterolVisible,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "* กรุณาใส่ข้อมูลให้เลขอยู่ในช่วง 100 ถึง 350",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Kanit',
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .red),
                                                                  )
                                                                ],
                                                              ),
                                                            )),

                                                        Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        10,
                                                                        10,
                                                                        0),
                                                            child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      Text(
                                                                        "ระดับความดันโลหิตตัวบน",
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                'Kanit',
                                                                            fontSize:
                                                                                15),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            25,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                          child: Container(
                                                                              color: Color(0XFFD9D9D9),
                                                                              height: 39,
                                                                              width: 70, // กำหนดความกว้างที่คุณต้องการ
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                                                                                child: TextFormField(
                                                                                  validator: (value) {},
                                                                                  onChanged: (value) => {
                                                                                    if (value == "" || value[0] == "." || value[0] == "0")
                                                                                      {
                                                                                        setState(() {
                                                                                          boolCheckSysVisible = true;
                                                                                        })
                                                                                      }
                                                                                    else if (double.parse(sysBPController.text) >= 80 && double.parse(sysBPController.text) <= 300)
                                                                                      {
                                                                                        setState(() {
                                                                                          boolCheckSysVisible = false;
                                                                                        })
                                                                                      }
                                                                                    else
                                                                                      {
                                                                                        setState(() {
                                                                                          boolCheckSysVisible = true;
                                                                                        })
                                                                                      }
                                                                                  },
                                                                                  controller: sysBPController,
                                                                                  keyboardType: TextInputType.number,
                                                                                  inputFormatters: <TextInputFormatter>[
                                                                                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                                                                  ],
                                                                                  decoration: InputDecoration(
                                                                                    hintText: "$SysBP",
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Text(
                                                                          "mmHg",
                                                                          style: TextStyle(
                                                                              fontFamily: 'Inter',
                                                                              fontSize: 13),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  )
                                                                ])),
                                                        Visibility(
                                                            visible:
                                                                boolCheckSysVisible,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "* กรุณาใส่ข้อมูลให้เลขอยู่ในช่วง 80 ถึง 300",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Kanit',
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .red),
                                                                  )
                                                                ],
                                                              ),
                                                            )),

                                                        Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        10,
                                                                        10,
                                                                        0),
                                                            child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      Text(
                                                                        "ระดับความดันโลหิตตัวล่าง",
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                'Kanit',
                                                                            fontSize:
                                                                                15),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                          child: Container(
                                                                              color: Color(0XFFD9D9D9),
                                                                              height: 39,
                                                                              width: 70, // กำหนดความกว้างที่คุณต้องการ
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                                                                                child: TextFormField(
                                                                                  validator: (value) {},
                                                                                  onChanged: (value) => {
                                                                                    if (value == "" || value[0] == "." || value[0] == "0")
                                                                                      {
                                                                                        setState(() {
                                                                                          boolCheckDiaVisible = true;
                                                                                        })
                                                                                      }
                                                                                    else if (double.parse(diaBPController.text) >= 40 && double.parse(diaBPController.text) <= 150)
                                                                                      {
                                                                                        setState(() {
                                                                                          boolCheckDiaVisible = false;
                                                                                        })
                                                                                      }
                                                                                    else
                                                                                      {
                                                                                        setState(() {
                                                                                          boolCheckDiaVisible = true;
                                                                                        })
                                                                                      }
                                                                                  },
                                                                                  controller: diaBPController,
                                                                                  keyboardType: TextInputType.number,
                                                                                  inputFormatters: <TextInputFormatter>[
                                                                                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                                                                  ],
                                                                                  decoration: InputDecoration(
                                                                                    hintText: "$DiaBP",
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Text(
                                                                          "mmHg",
                                                                          style: TextStyle(
                                                                              fontFamily: 'Inter',
                                                                              fontSize: 13),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  )
                                                                ])),
                                                        Visibility(
                                                            visible:
                                                                boolCheckDiaVisible,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "* กรุณาใส่ข้อมูลให้เลขอยู่ในช่วง 40 ถึง 150",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Kanit',
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .red),
                                                                  )
                                                                ],
                                                              ),
                                                            )),

                                                        Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        10,
                                                                        10,
                                                                        0),
                                                            child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      Text(
                                                                        "ดัชนีมวลกาย (BMI)",
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                'Kanit',
                                                                            fontSize:
                                                                                15),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            60,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                          child: Container(
                                                                              color: Color(0XFFD9D9D9),
                                                                              height: 39,
                                                                              width: 70, // กำหนดความกว้างที่คุณต้องการ
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                                                                                child: TextFormField(
                                                                                  validator: (value) {},
                                                                                  onChanged: (value) => {
                                                                                    if (value == "" || value[0] == "." || value[0] == "0")
                                                                                      {
                                                                                        setState(() {
                                                                                          boolCheckBMIVisible = true;
                                                                                        })
                                                                                      }
                                                                                    else if (double.parse(BMIController.text) >= 10 && double.parse(BMIController.text) <= 40)
                                                                                      {
                                                                                        setState(() {
                                                                                          boolCheckBMIVisible = false;
                                                                                        })
                                                                                      }
                                                                                    else
                                                                                      {
                                                                                        setState(() {
                                                                                          boolCheckBMIVisible = true;
                                                                                        })
                                                                                      }
                                                                                  },
                                                                                  controller: BMIController,
                                                                                  keyboardType: TextInputType.number,
                                                                                  inputFormatters: <TextInputFormatter>[
                                                                                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                                                                  ],
                                                                                  decoration: InputDecoration(
                                                                                    hintText: "$BMI",
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Text(
                                                                          "Kg/m",
                                                                          style: TextStyle(
                                                                              fontFamily: 'Inter',
                                                                              fontSize: 13),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  )
                                                                ])),
                                                        Visibility(
                                                            visible:
                                                                boolCheckBMIVisible,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "* กรุณาใส่ข้อมูลให้เลขอยู่ในช่วง 10 ถึง 40",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Kanit',
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .red),
                                                                  )
                                                                ],
                                                              ),
                                                            )),

                                                        Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        10,
                                                                        10,
                                                                        0),
                                                            child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      Text(
                                                                        "อัตราการเต้นของหัวใจ",
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                'Kanit',
                                                                            fontSize:
                                                                                15),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            35,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                          child: Container(
                                                                              color: Color(0XFFD9D9D9),
                                                                              height: 39,
                                                                              width: 70, // กำหนดความกว้างที่คุณต้องการ
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 10, 0),
                                                                                child: TextFormField(
                                                                                  validator: (value) {},
                                                                                  onChanged: (value) => {
                                                                                    if (value == "" || value[0] == "." || value[0] == "0")
                                                                                      {
                                                                                        setState(() {
                                                                                          boolCheckHeartRateVisible = true;
                                                                                        })
                                                                                      }
                                                                                    else if (double.parse(heartRateController.text) >= 40 && double.parse(heartRateController.text) <= 150)
                                                                                      {
                                                                                        setState(() {
                                                                                          boolCheckHeartRateVisible = false;
                                                                                        })
                                                                                      }
                                                                                    else
                                                                                      {
                                                                                        setState(() {
                                                                                          boolCheckHeartRateVisible = true;
                                                                                        })
                                                                                      }
                                                                                  },
                                                                                  controller: heartRateController,
                                                                                  keyboardType: TextInputType.number,
                                                                                  inputFormatters: <TextInputFormatter>[
                                                                                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                                                                  ],
                                                                                  decoration: InputDecoration(
                                                                                    hintText: "$Heartrate",
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Text(
                                                                          "ครั้ง/นาที",
                                                                          style: TextStyle(
                                                                              fontFamily: 'Kanit',
                                                                              fontSize: 13),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  )
                                                                ])),
                                                        Visibility(
                                                            visible:
                                                                boolCheckHeartRateVisible,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "* กรุณาใส่ข้อมูลให้เลขอยู่ในช่วง 40 ถึง 150",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Kanit',
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .red),
                                                                  )
                                                                ],
                                                              ),
                                                            )),

                                                        Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        10,
                                                                        10,
                                                                        10),
                                                            child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      Text(
                                                                        "ปริมาณกลูโคส",
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                'Kanit',
                                                                            fontSize:
                                                                                15),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            80,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                          child: Container(
                                                                              color: Color(0XFFD9D9D9),
                                                                              height: 39,
                                                                              width: 70, // กำหนดความกว้างที่คุณต้องการ
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                                                                                child: TextFormField(
                                                                                  validator: (value) {},
                                                                                  onChanged: (value) => {
                                                                                    if (value == "" || value[0] == "." || value[0] == "0")
                                                                                      {
                                                                                        setState(() {
                                                                                          boolCheckGlucoseVisible = true;
                                                                                        })
                                                                                      }
                                                                                    else if (double.parse(glucoseController.text) >= 40 && double.parse(glucoseController.text) <= 400)
                                                                                      {
                                                                                        setState(() {
                                                                                          boolCheckGlucoseVisible = false;
                                                                                        })
                                                                                      }
                                                                                    else
                                                                                      {
                                                                                        setState(() {
                                                                                          boolCheckGlucoseVisible = true;
                                                                                        })
                                                                                      }
                                                                                  },
                                                                                  controller: glucoseController,
                                                                                  keyboardType: TextInputType.number,
                                                                                  inputFormatters: <TextInputFormatter>[
                                                                                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                                                                  ],
                                                                                  decoration: InputDecoration(
                                                                                    hintText: "$Glucose",
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Text(
                                                                          "mg/dL",
                                                                          style: TextStyle(
                                                                              fontFamily: 'Inter',
                                                                              fontSize: 13),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  )
                                                                ])),
                                                        Visibility(
                                                            visible:
                                                                boolCheckGlucoseVisible,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    "* กรุณาใส่ข้อมูลให้เลขอยู่ในช่วง 40 ถึง 400",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Kanit',
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .red),
                                                                  )
                                                                ],
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ))),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 20, 0, 20),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
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
                                      onPressed: () async {
                                        checkData();
                                        if (BMIController.text == "0") {
                                          setState(() {
                                            boolCheckBMIVisible = true;
                                          });
                                        }
                                        if (totCholController.text == "0") {
                                          setState(() {
                                            boolCheckCholesterolVisible = true;
                                          });
                                        }
                                        if (diaBPController.text == "0") {
                                          setState(() {
                                            boolCheckDiaVisible = true;
                                          });
                                        }
                                        if (glucoseController.text == "0") {
                                          setState(() {
                                            boolCheckGlucoseVisible = true;
                                          });
                                        }
                                        if (heartRateController.text == "0") {
                                          setState(() {
                                            boolCheckHeartRateVisible = true;
                                          });
                                        }
                                        if (sysBPController.text == "0") {
                                          setState(() {
                                            boolCheckSysVisible = true;
                                          });
                                        }
                                        if (int.parse(ageController.text) !=
                                            age) {
                                          age = int.parse(ageController.text);
                                        }
                                        if (int.parse(
                                                cigsPerDayController.text) !=
                                            smokeperday) {
                                          smokeperday = int.parse(
                                              cigsPerDayController.text);
                                        }
                                        if (boolCheckBMIVisible ||
                                            boolCheckCholesterolVisible ||
                                            boolCheckDiaVisible ||
                                            boolCheckGlucoseVisible ||
                                            boolCheckHeartRateVisible ||
                                            boolCheckSysVisible) {
                                          if (checkInputData == false) {
                                            _showAlertDialogsErrorSaveData(
                                                context);
                                          }
                                        } else {
                                          ApiService.postData(
                                          context,
                                          genderController,
                                          ageController,
                                          educationController,
                                          currentSmokerController,
                                          cigsPerDayController,
                                          BPMedsController,
                                          prevalentStrokeController,
                                          prevalentHypController,
                                          diabetesController,
                                          totCholController,
                                          sysBPController,
                                          diaBPController,
                                          BMIController,
                                          heartRateController,
                                          glucoseController,
                                        );
                                        }
                                        
                                        await postDataToFireStore();
                                        await postAdviceToFireStore(
                                            int.parse(
                                                currentSmokerController.text),
                                            int.parse(
                                                prevalentStrokeController.text),
                                            int.parse(
                                                prevalentHypController.text),
                                            int.parse(diabetesController.text),
                                            double.parse(
                                                totCholController.text),
                                            double.parse(sysBPController.text),
                                            double.parse(BMIController.text),
                                            double.parse(
                                                heartRateController.text),
                                            double.parse(
                                                glucoseController.text));
                                      },
                                      child: Text(
                                        'ประเมินความเสี่ยง',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Kanit',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )))));
  }
}
