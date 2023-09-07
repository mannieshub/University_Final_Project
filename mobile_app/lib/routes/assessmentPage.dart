import 'package:flutter/material.dart';
import '/routes/home_page.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

//FireStore
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_app/models/user_data.dart'; //user info data

//Firebase Authentication
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_app/authentication/auth.dart';

//http
import 'package:http/http.dart' as http;

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

  void initState() {
    super.initState();
    EducationLevel = 1;
  }

  setEducationLevel(int val) {
    setState(() {
      EducationLevel = val;
    });
  }

  final TextEditingController BPMedsController =
      TextEditingController(text: '0');
  final TextEditingController prevalentStrokeController =
      TextEditingController(text: '0');
  final TextEditingController prevalentHypController =
      TextEditingController(text: '0');
  final TextEditingController diabetesController =
      TextEditingController(text: '0');
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

  String predictionText = '';

  void _showPredictionText() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Prediction Text"),
          content: Text(predictionText),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Close the current AlertDialog
                Navigator.of(context).pop();

                // Navigate to another page
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HomePage()), // Replace with the actual page you want to navigate to
                );
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  //------------------HTTP part-----------------------------------//
  Future<void> postData() async {
    var response = await http.post(
      //URL web-server
      Uri.parse("http://10.0.2.2:5000/predict"),

      //http request
      body: {
        "gender": genderController.text,
        "age": ageController.text,
        "education": educationController.text, //1.toString(),
        "currentSmoker": currentSmokerController.text,
        "cigsPerDay": cigsPerDayController.text,

        "BPMeds": 0.toString(),
        "prevalentStroke": 0.toString(),
        "prevalentHyp": 0.toString(),
        "diabetes": 0.toString(),
        "totChol": 195.toString(),
        "sysBP": 106.toString(),
        "diaBP": 70.toString(),
        "BMI": 26.97.toString(),
        "heartRate": 80.toString(),
        "glucose": 77.toString(),
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      predictionText = data['prediction_text'];
      _showPredictionText(); // เมื่อได้รับค่า predictiontext เสร็จ ให้แสดงผลใน AlertDialog
    } else {
      print('Failed to make request. Error code: ${response.statusCode}');
    }
  }
//--------------------------------End HTTP--------------------------------------//

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

    userData.BPMeds = 0.toString(); //BPMedsController.text;
    userData.prevalentStroke = 0.toString();
    userData.prevalentHyp = 0.toString();
    userData.diabetes = 0.toString();
    userData.totChol = 195.toString();
    userData.sysBP = 106.toString();
    userData.diaBP = 97.toString();
    userData.BMI = 26.97.toString();
    userData.heartRate = 90.toString();
    userData.glucose = 77.toString();
    //userData.prediction = predictionPercent;

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
        body: SingleChildScrollView(
          //color: Color(0XFFFFEEDD),
          child: Container(
            color: Color(0XFFF9CEA5),
            child: Container(
              color: Color(0XFFF9CEA5),
              margin: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 30),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
                    child: Row(
                      children: [
                        Text(
                          "ข้อมูลด้านประชากร",
                          style: TextStyle(
                            color: Color(0XFF5A5959),
                            fontFamily: 'Kanit',
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        )
                      ],
                    ),
                  ),
                  //demographic
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 350,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    25), // กำหนดความโค้งของมุมปุ่ม
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 20, 20, 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  //ของใน card เป็น row ๆ ไป
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 10),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "เพศ:",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Kanit',
                                                                fontSize: 15),
                                                          ),
                                                          Text("        "),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        30,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child:
                                                                ToggleButtons(
                                                              constraints:
                                                                  BoxConstraints(
                                                                      maxWidth:
                                                                          90,
                                                                      minWidth:
                                                                          70,
                                                                      minHeight:
                                                                          35,
                                                                      maxHeight:
                                                                          35),
                                                              isSelected:
                                                                  _Selectgender,
                                                              children: <Widget>[
                                                                Container(
                                                                    width: 20,
                                                                    child:
                                                                        new Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: <Widget>[
                                                                        new Icon(
                                                                          Icons
                                                                              .male,
                                                                          size:
                                                                              20,
                                                                          color:
                                                                              Colors.blue,
                                                                        ),
                                                                      ],
                                                                    )),
                                                                Container(
                                                                    width: 20,
                                                                    child:
                                                                        new Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: <Widget>[
                                                                        new Icon(
                                                                          Icons
                                                                              .female,
                                                                          size:
                                                                              20.0,
                                                                          color:
                                                                              Colors.pink,
                                                                        ),
                                                                      ],
                                                                    )),
                                                              ],
                                                              onPressed:
                                                                  (int index) {
                                                                setState(() {
                                                                  for (int i =
                                                                          0;
                                                                      i <
                                                                          _Selectgender
                                                                              .length;
                                                                      i++) {
                                                                    _Selectgender[
                                                                            i] =
                                                                        i ==
                                                                            index;
                                                                  }
                                                                  if (_Selectgender[
                                                                      0]) {
                                                                    gender = 0;
                                                                    print(
                                                                        "ชาย = $gender");
                                                                  } else {
                                                                    gender = 1;
                                                                    print(
                                                                        "หญิง = $gender");
                                                                  }
                                                                });
                                                              },
                                                              borderRadius:
                                                                  const BorderRadius
                                                                          .all(
                                                                      Radius.circular(
                                                                          20)),
                                                            ),
                                                          ),
                                                          Text(
                                                              "                   "),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "อายุ",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Kanit',
                                                                fontSize: 15),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(20, 0,
                                                                    0, 0),
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Column(
                                                                children: [
                                                                  Slider(
                                                                    value:
                                                                        ageslider,
                                                                    onChanged:
                                                                        (newRating) {
                                                                      setState(
                                                                        () => ageslider =
                                                                            newRating, //รับค่าจาก slider มาใน agelider
                                                                      );
                                                                      setState(
                                                                          () {
                                                                        age = ageslider //เปลี่ยน double เป็น integer เพื่ออะไปใช้ต่อ
                                                                            .floor();

                                                                        //ค่า age คือค่าใช้จริง
                                                                      });
                                                                      setState(
                                                                          () {
                                                                        //รับค่าจาก slider มาใน textEditingController ของ textfleid เพื่อแสดงค่าปัจุบันให้ user เห็น
                                                                        ageController
                                                                            .text = (newRating
                                                                                .floor())
                                                                            .toString();
                                                                      });
                                                                    },
                                                                    min: 0,
                                                                    max: 100,
                                                                    divisions:
                                                                        100,
                                                                    label:
                                                                        "$age",
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
                                                                      controller:
                                                                          ageController,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .number,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            "$age",
                                                                        border:
                                                                            InputBorder.none,

                                                                        //textEditingControllerAge
                                                                      ),
                                                                      // ค่าอื่น ๆ ของ TextField
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Column(
                                                                  children: [
                                                                    Text(
                                                                      "ปี",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Kanit',
                                                                          fontSize:
                                                                              15),
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

                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Text(
                          "ข้อมูลด้านพฤติกรรม",
                          style: TextStyle(
                            color: Color(0XFF5A5959),
                            fontFamily: 'Kanit',
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        )
                      ],
                    ),
                  ),
                  //behavior
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 350,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          25), // กำหนดความโค้งของมุมปุ่ม
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 10, 10),
                                      child: Column(
                                        children: [
                                          //Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 0,0, 0),)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0,
                                                          5), // Add padding here
                                                  child: Text(
                                                    "ประวัติการศึกษา",
                                                    style: TextStyle(
                                                      fontFamily: 'Kanit',
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                                // SizedBox(height: 10), // You can remove this line
                                              ],
                                            ),
                                          ),

                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 10),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: <Widget>[
                                                    Container(
                                                      height: 24,
                                                      child: Row(
                                                        children: [
                                                          Radio(
                                                            value: 1,
                                                            groupValue:
                                                                EducationLevel,
                                                            onChanged: (val) {
                                                              setState(() {
                                                                EducationLevel =
                                                                    val as int;
                                                              });
                                                              educationController
                                                                      .text =
                                                                  "1"; // Set the text to "1"
                                                            },
                                                          ),
                                                          Text(
                                                            "ต่ำกว่าระดับมัธยมตอนต้น",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Kanit',
                                                                fontSize: 12),
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
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      height: 24,
                                                      child: Row(
                                                        children: [
                                                          Radio(
                                                            value: 2,
                                                            groupValue:
                                                                EducationLevel,
                                                            onChanged: (val) {
                                                              setState(() {
                                                                EducationLevel =
                                                                    val as int;
                                                              });
                                                              educationController
                                                                      .text =
                                                                  "2"; // Set the text to "1"
                                                            },
                                                          ),
                                                          Text(
                                                            "ระดับมัธยมตอนปลาย",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Kanit',
                                                                fontSize: 12),
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
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      height: 24,
                                                      child: Row(
                                                        children: [
                                                          Radio(
                                                            value: 3,
                                                            groupValue:
                                                                EducationLevel,
                                                            onChanged: (val) {
                                                              setState(() {
                                                                EducationLevel =
                                                                    val as int;
                                                              });
                                                              educationController
                                                                      .text =
                                                                  "3"; // Set the text to "1"
                                                            },
                                                          ),
                                                          Text(
                                                            "ระดับปริญญาตรี",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Kanit',
                                                                fontSize: 12),
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
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      height: 24,
                                                      child: Row(
                                                        children: [
                                                          Radio(
                                                            value: 4,
                                                            groupValue:
                                                                EducationLevel,
                                                            onChanged: (val) {
                                                              setState(() {
                                                                EducationLevel =
                                                                    val as int;
                                                              });
                                                              educationController
                                                                      .text =
                                                                  "4"; // Set the text to "1"
                                                            },
                                                          ),
                                                          Text(
                                                            "สูงกว่าระดับปริญญาตรี",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Kanit',
                                                                fontSize: 12),
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
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsetsDirectional
                                                          .fromSTEB(10, 0, 0,
                                                              0), // Add padding here
                                                      child: Text(
                                                        "ประวัติการสูบบุหรี่",
                                                        style: TextStyle(
                                                          fontFamily: 'Kanit',
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 0, 0),
                                                      child: Text(
                                                        "ถ้าปัจจุบันเลิกสูบบุหรี่แล้วให้เลือก มี",
                                                        style: TextStyle(
                                                          fontFamily: 'Kanit',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color.fromARGB(
                                                              255, 255, 17, 0),
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsetsDirectional
                                                          .fromSTEB(0, 10, 10,
                                                              0), // Add top padding here
                                                      child: ToggleButtons(
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 55,
                                                          minWidth: 50,
                                                          minHeight: 35,
                                                          maxHeight: 35,
                                                        ),
                                                        isSelected:
                                                            _SelectSmoke,
                                                        children: <Widget>[
                                                          Container(
                                                            width: 20,
                                                            child: new Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: <Widget>[
                                                                new Text(
                                                                  "มี",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .red,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        'Kanit',
                                                                    fontSize:
                                                                        15,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 25,
                                                            child: new Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: <Widget>[
                                                                new Text(
                                                                  "ไม่มี",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .blue,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        'Kanit',
                                                                    fontSize:
                                                                        15,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                        onPressed: (int index) {
                                                          setState(() {
                                                            for (int i = 0;
                                                                i <
                                                                    _SelectSmoke
                                                                        .length;
                                                                i++) {
                                                              _SelectSmoke[i] =
                                                                  i == index;
                                                            }
                                                            if (_SelectSmoke[
                                                                0]) {
                                                              smoke = 1;
                                                              currentSmokerController
                                                                  .text = "1";
                                                              print(
                                                                  "มีประวัติสูบบุหรี่ = $smoke");
                                                            } else {
                                                              smoke = 0;
                                                              currentSmokerController
                                                                  .text = "0";
                                                              print(
                                                                  "ไม่มีมีประวัติสูบบุหรี่ = $smoke");
                                                            }
                                                          });
                                                        },
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    20)),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                                  child: Text(
                                                    "ปริมาณบุหรี่ที่สูบต่อวัน",
                                                    style: TextStyle(
                                                        fontFamily: 'Kanit',
                                                        fontSize: 15),
                                                  ),
                                                ),
                                                Text(
                                                    "                                              ")
                                              ],
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 0),
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
                                                            setState(
                                                              () => smokeperdayslider =
                                                                  newRating, //รับค่าจากslider มาใน agelider
                                                            );
                                                            setState(() {
                                                              smokeperday =
                                                                  smokeperdayslider //เปลี่ยน double เป็น integer เพื่ออะไปใช้ต่อ
                                                                      .floor();
                                                            });
                                                            setState(() {
                                                              //รับค่าจาก slider มาใน textEditingController ของ textfleid เพื่อแสดงค่าปัจุบันให้ user เห็น
                                                              cigsPerDayController
                                                                  .text = (newRating
                                                                      .floor())
                                                                  .toString();
                                                            });
                                                          },
                                                          min: 0,
                                                          max: 100,
                                                          divisions: 100,
                                                          label: "$smokeperday",
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Container(
                                                          width:
                                                              27, // กำหนดความกว้างที่คุณต้องการ
                                                          child: TextFormField(
                                                            validator:
                                                                (value) {},
                                                            controller:
                                                                cigsPerDayController,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  "$smokeperday",
                                                              border:
                                                                  InputBorder
                                                                      .none,

                                                              //textEditingControllerAge
                                                            ),
                                                            // ค่าอื่น ๆ ของ TextField
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 0),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            "มวนต่อวัน",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Kanit',
                                                                fontSize: 15),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ]))
                                        ],
                                      ),
                                    ))))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF4FCCBD),
                            padding:
                                EdgeInsetsDirectional.fromSTEB(25, 15, 25, 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20), // กำหนดความโค้งของมุมปุ่ม
                            ),

                            textStyle: TextStyle(
                                fontSize: 15), // เปลี่ยนสีปุ่มเป็นสีแดง
                          ),
                          onPressed: () async {
                            /*เงื่อนไขด้านล่างนี้มีไว้เช็ค ค่า age(อายุ) กับ ค่า textEditingControllerAge(ค่าที่userป้อนมา) ถ้าไม่เท่าให้
                              age = textEditingControllerAge;
                              ** หรือก็คือ ค่าที่userใส่เข้ามาจะไม่เท่ากับของ slider เลยจะต้องมีเงื่อนไขนี้ไว้เพื่ออัพเดทค่าให้ตรงกับที่userใส่มานั้นเอง
                            */
                            if (int.parse(ageController.text) != age) {
                              age = int.parse(ageController.text);
                            }
                            /*เงื่อนไขด้านล่างนี้มีไว้เช็ค ค่า age(อายุ) กับ ค่า textEditingControllerAge(ค่าที่userป้อนมา) ถ้าไม่เท่าให้
                              age = textEditingControllerAge;
                              ** หรือก็คือ ค่าที่userใส่เข้ามาจะไม่เท่ากับของ slider เลยจะต้องมีเงื่อนไขนี้ไว้เพื่ออัพเดทค่าให้ตรงกับที่userใส่มานั้นเอง
                            */
                            if (int.parse(cigsPerDayController.text) !=
                                smokeperday) {
                              smokeperday =
                                  int.parse(cigsPerDayController.text);
                            }
                            await postData();
                            await postDataToFireStore();
                            //ค่าที่ print ออกมาคือค่าที่ใช้จริง ด้านล่างค่าจะถูกต้องเมื่อกดปุ่มนี้เพราะมีเงื่อนไขด้านบนมาเช็คตัวแปรบางตัวก่อน
                            //หรือก็คือสามารถใช้ ค่าที่เป็น $ชื่อตัวแปร ด้านล่างได้เลย ตัวแปรทั้งหมดนี้เป็นแบบ integer
                            //ส่วนที่ printนี้จะเห็นได้ใน Debug console
                            print("-----------------------");
                            print("เพศ = $gender");
                            print('อายุ = $age');
                            print('ระดับการศึกษา = $EducationLevel');
                            print('สูบุหรี่ต่อวัน = $smokeperday');
                            print('ประวิติสูบหรี่ =  $smoke');
                            print("-----------------------");
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
        ));
  }
}
