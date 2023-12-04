import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/templates/resultpage/reasonWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../authentication/auth.dart';

//ถ้าไม่มี state ไหนเลย ให้แสดง widget default
class resultPage extends StatefulWidget {
  @override
  resultPageState createState() => resultPageState();
}

class resultPageState extends State<resultPage> {
  User? user = Auth().currentUser;
  bool check = true;
  bool isCholesterol = false;
  bool isHyp = false;
  bool isSmoking = false;
  bool isDiabetes = false;
  bool isSysBP = false;
  bool isDiaBP = false;
  bool isBMI = false;
  bool isHeartRate = false;
  bool isGlucose = false;

  @override
  void initState() {
    super.initState();
    checkFirestoreData();
    fetchDataFromFirestore();
  }

  Future<void> checkFirestoreData() async {
    try {
      // เรียกใช้งาน Firestore และอ้างถึง collection และ document ที่ต้องการตรวจสอบ
      final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await FirebaseFirestore.instance
              .collection('UserData') // เปลี่ยนเป็นชื่อ collection ของคุณ
              .doc(user!.uid) // เปลี่ยนเป็น ID ของ document ที่ต้องการตรวจสอบ
              .get();

      // ตรวจสอบค่า field ใน Firestore และตั้งค่าตัวแปร isCholesterol ตามเงื่อนไข
      if (documentSnapshot.exists) {
        //Total Cholesteral
        final String CholesterolValueString =
            documentSnapshot.data()?['totChol'];
        final double CholesterolValue =
            double.tryParse(CholesterolValueString) ?? 0.0;
        final bool isCholesterolValue = CholesterolValue >= 240;

        //prevalentHypertension
        final bool isHypValue = documentSnapshot.data()?['prevalentHyp'] == '1';

        //currentSmoking
        final bool isSmokingValue =
            documentSnapshot.data()?['currentSmoker'] == '1';

        final bool isDiabetesValue =
            documentSnapshot.data()?['diabetes'] == '1';

        final String sysBPValueString = documentSnapshot.data()?['sysBP'];
        final double sysBPValue = double.tryParse(sysBPValueString) ?? 0.0;
        final bool isSysBPValue = sysBPValue >= 140;

        final String diaBPValueString = documentSnapshot.data()?['diaBP'];
        final double diaBPValue = double.tryParse(diaBPValueString) ?? 0.0;
        final bool isDiaBPValue = diaBPValue >= 90;

        final String BMIValueString = documentSnapshot.data()?['BMI'];
        final double BMIValue = double.tryParse(BMIValueString) ?? 0.0;
        final bool isBMIValue = BMIValue >= 25;

        // //double.tryParse()
        final String HeartRateValueString =
            documentSnapshot.data()?['heartRate'];
        final double HeartRateValue =
            double.tryParse(HeartRateValueString) ?? 0.0;
        final bool isHeartRateValue = HeartRateValue >= 150;

        final String GlucoseValueString = documentSnapshot.data()?['glucose'];
        final double GlucoseValue = double.tryParse(GlucoseValueString) ?? 0.0;
        final bool isGlucoseValue = GlucoseValue >= 126;
        setState(() {
          isCholesterol = isCholesterolValue;
          isHyp = isHypValue;
          isSmoking = isSmokingValue;
          isDiabetes = isDiabetesValue;
          isSysBP = isSysBPValue;
          isDiaBP = isDiaBPValue;
          isBMI = isBMIValue;
          isHeartRate = isHeartRateValue;
          isGlucose = isGlucoseValue;
        });
        print('isCholesterol: $isCholesterol');
      } else {
        // ถ้าไม่พบ document หรือไม่พบค่าใน Firestore
        setState(() {
          isCholesterol = false; // ตั้งค่า isCholesterol เป็น false
          isHyp = false;
          isSmoking = false;
          isDiabetes = false;
          isSysBP = false;
          isDiaBP = false;
          isBMI = false;
          isHeartRate = false;
          isGlucose = false;
          check = false;
        });
      }
    } catch (e) {
      print('Error checking Firestore data: $e');
    }
  }

  //shorter
  Widget _showResult(
    final bool isTrue,
    final String imgPath,
    final String msg1,
    final String msg2,
    final Color color,
  ) {
    return isTrue
        ? ReasonWidget(
            imagePath: imgPath, message1: msg1, message2: msg2, color: color)
        : SizedBox();
  }

  String percent = "";
  Future<void> fetchDataFromFirestore() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection('UserRisk')
              .doc(user!.uid)
              .get();

      if (snapshot.exists) {
        // Retrieve data from the snapshot
        final data = snapshot.data();
        if (data != null) {
          // Assuming there is a field called "percent" in your Firestore document
          final fetchedPercent = data['percent'];
          if (fetchedPercent != null) {
            // Update the percent variable with the fetched data
            setState(() {
              percent = fetchedPercent.toString();
            });
          }
        }
      }
    } catch (e) {
      // Handle any errors that occur during the fetch
      print('Error fetching data: $e');
    }
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFEBE9A),
                  textStyle: TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Back',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "ทำไมคุณถึงเสี่ยง",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Kanit',
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Text(
                "            ",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      body: check == false
          ? LayoutBuilder(
              //เพิ่มเป็นส่วนเปลี่ยนหน้าที่ยังไม่มีผลลัพธ์
              builder: (context, constraints) => SingleChildScrollView(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                          child: Container(
                        color: Color(0XFFFFEEDD),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Wrap(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: constraints.maxWidth,
                                  child: Text(
                                      "ยังไม่มีผลลัพธ์หรับคุณ กรุณาทำแบบประเมินเพื่อรับผลลัพธ์",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        fontFamily: 'Kanit',
                                      )),
                                )
                              ],
                            )
                          ],
                        ),
                      )))))
          : LayoutBuilder(
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
                              EdgeInsetsDirectional.fromSTEB(45, 50, 45, 45),
                          child: Container(
                            color: Color(0XFFFFEEDD),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      19, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "ความเสี่ยง",
                                        style: TextStyle(
                                          height: 1,
                                          color: Colors.red,
                                          fontFamily: 'Kanit',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '$percent %',
                                      style: TextStyle(
                                        height: 1.1,
                                        color: Colors.red,
                                        fontFamily: 'Kanit',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 70,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "ในการเกิดโรคหลอดเลือดหัวใจใน 10 ปี",
                                      style: TextStyle(
                                        height: 1,
                                        color: Colors.red,
                                        fontFamily: 'Kanit',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                _showResult(
                                    isCholesterol,
                                    'images/mitter.png',
                                    "ปริมาณคอเลสเตอรอลสูง",
                                    "ไขมันร้าย คือตัวการปิดกั้นหลอดเลือดหัวใจ",
                                    Color(0xFFFD7272)),
                                _showResult(
                                    isHyp,
                                    'images/hypertension.png',
                                    "มีประวัติโรคความดันโลหิตสูง",
                                    "ทำให้หัวใจทำงานหนักขึ้น",
                                    Color(0xFFFD7272)),
                                _showResult(
                                    isDiabetes,
                                    'images/diabetes.png',
                                    "มีประวัติการเป็นโรคเบาหวาน",
                                    "ผนังหลอดเลือดหนา ทำให้เลือดไหลเวียนยาก",
                                    Color(0xFFFD7272)),
                                _showResult(
                                    isSmoking,
                                    'images/cig.png',
                                    "มีประวัติการสูบบุหรี่",
                                    "เป็นปัจจัยเสี่ยงสำคัญที่ทำให้เกิดโรค",
                                    Color(0xFFFD7272)),
                                _showResult(
                                    isSysBP,
                                    'images/sys.png',
                                    "ความดันโลหิตตัวบนสูง",
                                    "ทำให้หลอดเลือดแดงแข็ง-หลอดเลือดหัวใจตีบ",
                                    Color(0xFFFD7272)),
                                _showResult(
                                    isDiaBP,
                                    'images/dia.png',
                                    "ความดันโลหิตตัวบนต่ำ",
                                    "อาจส่งผลต่อความเสียหายหัวใจ",
                                    Color(0xFFFD7272)),
                                _showResult(
                                    isBMI,
                                    'images/bmi.png',
                                    "ดัชนีมวลกาย(BMI) สูงกว่าเกณฑ์ปกติ",
                                    "เสี่ยงโรคอ้วน เบาหวาน และความดันโลหิตสูง",
                                    Color(0xFFFD7272)),
                                _showResult(
                                    isHeartRate,
                                    'images/heartrate.png',
                                    "อัตราการเต้นของหัวใจเร็วผิดปกติ",
                                    "อาจมีโรคความดันโลหิตสูง-โรคหลอดเลือดหัวใจ",
                                    Color(0xFFFD7272)),
                                _showResult(
                                    isGlucose,
                                    'images/mitter.png',
                                    "ระดับกลูโคสโดยเฉลี่ยสูง",
                                    "มีความเสี่ยงที่จะเป็นโรคเบาหวาน",
                                    Color(0xFFFD7272)),
                                // Padding(
                                //   padding:
                                //       EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: <Widget>[
                                //       ElevatedButton(
                                //         style: ElevatedButton.styleFrom(
                                //           backgroundColor: Color(0xFF4FCCBD),

                                //           padding: EdgeInsetsDirectional.fromSTEB(
                                //               40, 10, 40, 10),
                                //           shape: RoundedRectangleBorder(
                                //             borderRadius: BorderRadius.circular(
                                //                 10), // กำหนดความโค้งของมุมปุ่ม
                                //           ),

                                //           textStyle: TextStyle(
                                //               fontSize:
                                //                   15), // เปลี่ยนสีปุ่มเป็นสีแดง
                                //         ),
                                //         onPressed: () {
                                //           Navigator.of(context).pop();
                                //           // เอาไว้ลิ้งไปหน้าอื่นอันนี้จะเป็นแบบย้อนกลับไปหน้าก่อนหน้านี้
                                //         },
                                //         child: Text(
                                //           'back',
                                //           style: TextStyle(
                                //             color: Colors.white,
                                //             fontFamily: 'Kanit',
                                //           ),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      )),
                    ),
                  )),
    );
  }
}
