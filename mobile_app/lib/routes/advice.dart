import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/authentication/auth.dart';
import 'package:mobile_app/templates/advice/advice_component.dart';

class advicePage extends StatefulWidget {
  @override
  advicePageState createState() => advicePageState();
}

class advicePageState extends State<advicePage> {
  bool check = true;
  User? user = Auth().currentUser;
  //advice 1
  bool isSmoker = false;

  //advice 2
  bool isDiabetes = false;
  bool isBMI = false;
  bool isGlucose = false;

  //advice 3
  bool isStroke = false;
  bool isCholesterol = false;
  bool isSysBP = false;

  //advice 4
  bool isHyp = false;
  bool isHeartRate = false;

  @override
  void initState() {
    super.initState();
    // Call checkFirestoreData when the widget is initialized
    checkFirestoreData();
  }

  Future<void> checkFirestoreData() async {
    try {
      // เรียกใช้งาน Firestore และอ้างถึง collection และ document ที่ต้องการตรวจสอบ
      final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await FirebaseFirestore.instance
              .collection('UserAdvice') // เปลี่ยนเป็นชื่อ collection ของคุณ
              .doc(user!.uid) // เปลี่ยนเป็น ID ของ document ที่ต้องการตรวจสอบ
              .get();

      // ตรวจสอบค่า field ใน Firestore และตั้งค่าตัวแปร isCholesterol ตามเงื่อนไข
      if (documentSnapshot.exists) {
        final String diabetesString = documentSnapshot.data()?['diabetes'];
        final String hypString = documentSnapshot.data()?['prevalentHyp'];
        final String strokeString = documentSnapshot.data()?['prevalentStroke'];
        final String smokerString = documentSnapshot.data()?['currentSmoker'];
        final String cholString = documentSnapshot.data()?['totalCholesterol'];
        final String sysString = documentSnapshot.data()?['sysBP'];
        final String BMIString = documentSnapshot.data()?['BMI'];
        final String heartString = documentSnapshot.data()?['heartRate'];
        final String glucoseString = documentSnapshot.data()?['glucose'];

        // final int diabetesVal = int.tryParse(diabetesString) ?? 0;
        // final int hypVal= int.tryParse(hypString) ?? 0;
        // final int strokeVal= int.tryParse(strokeString) ?? 0;
        // final int smokerVal= int.tryParse(smokerString) ?? 0;
        final int cholVal = int.tryParse(cholString) ?? 0;
        final int sysVal = int.tryParse(sysString) ?? 0;
        final int BMIVal = int.tryParse(BMIString) ?? 0;
        final int heartVal = int.tryParse(heartString) ?? 0;
        final int glucoseVal = int.tryParse(glucoseString) ?? 0;

        final bool Diabetes = diabetesString == "1";
        final bool Hyp = hypString == "1";
        final bool Stroke = strokeString == "1";
        final bool Smoker = smokerString == "1";
        final bool Chol = cholVal >= 250;
        final bool Sys = sysVal >= 140;
        final bool BMI = BMIVal >= 25;
        final bool HeartRate = heartVal >= 150;
        final bool Glucose = glucoseVal >= 126;
        setState(() {
          isDiabetes = Diabetes;
          isHyp = Hyp;
          isStroke = Stroke;
          isSmoker = Smoker;
          isCholesterol = Chol;
          isSysBP = Sys;
          isBMI = BMI;
          isHeartRate = HeartRate;
          isGlucose = Glucose;
          
        });
      } else {
        // ถ้าไม่พบ document หรือไม่พบค่าใน Firestore
        setState(() {
          isDiabetes = false;
          isHyp = false;
          isStroke = false;
          isSmoker = false;
          isCholesterol = false;
          isSysBP = false;
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

  Widget _showAdvice(
    final bool isTrue,
    final String imgPath,
    final String msg,
  ) {
    return isTrue ? AdviceWidget(imagePath: imgPath, text: msg) : SizedBox();
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
                  "คำแนะนำ",
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
        body: check == true
            ? LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: IntrinsicHeight(
                          child: Container(
                            color: Color(0XFFFEDBBA),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 60, 0, 60),
                                child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      _showAdvice(isSmoker, 'images/Smook.png',
                                          "ควรลดปริมาณการสูบบุหรี่ หรือถ้าเลิกได้ก็ควรเลิกสูบบุหรี่"),
                                      const SizedBox(height: 10),
                                      _showAdvice(
                                          isDiabetes ||
                                              isBMI ||
                                              isGlucose ||
                                              isStroke ||
                                              isCholesterol,
                                          'images/healthy-food 1.png',
                                          "งดการกินของทอด ของหวาน และของมัน \n รับประทานแต่อาหารที่มีประโยชน์"),
                                      const SizedBox(height: 10),
                                      // _showAdvice(isStroke || isCholesterol, imgPath, msg),
                                      _showAdvice(
                                          isHyp || isHeartRate,
                                          'images/Exercise.png',
                                          "นอนหลับให้เพียงพอ และออกกำลังกาย 3-5 ครั้งต่อสัปดาห์"),
                                    ]),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ))
            : LayoutBuilder(
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
                                    child:
                                        Text("กรุณาทำแบบประเมินเพื่อรับผลลัพธ์",
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
                        ))))));
  }
}
