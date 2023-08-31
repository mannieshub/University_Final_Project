import 'dart:convert';
import 'package:flutter/material.dart';
import '/routes/home_page.dart';

//FireStore
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_app/models/user_data.dart'; //user info data

//Firebase Authentication
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_app/authentication/auth.dart';

//http
import 'package:http/http.dart' as http;

class asP extends StatelessWidget {
  const asP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const assessmentPage(title: 'Assessment Demo'),
    );
  }
}

class assessmentPage extends StatefulWidget {
  const assessmentPage({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  State<assessmentPage> createState() => _assessmentPageState();
}

class _assessmentPageState extends State<assessmentPage> {
  final TextEditingController genderController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController educationController = TextEditingController();
  final TextEditingController currentSmokerController = TextEditingController();
  final TextEditingController cigsPerDayController = TextEditingController();

  //ยังไม่ได้ใช้
  final TextEditingController BPMedsController = TextEditingController();
  final TextEditingController prevalentStrokeController =
      TextEditingController();
  final TextEditingController prevalentHypController = TextEditingController();
  final TextEditingController diabetesController = TextEditingController();
  final TextEditingController totCholController = TextEditingController();
  final TextEditingController sysBPController = TextEditingController();
  final TextEditingController diaBPController = TextEditingController();
  final TextEditingController BMIController = TextEditingController();
  final TextEditingController heartRateController = TextEditingController();
  final TextEditingController glucoseController = TextEditingController();

  String predictionText = '';
  String predictionPercent = '';

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
        "education": educationController.text,
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
    userData.prediction = predictionPercent;

    await firebaseFirestore
        .collection("UserData")
        .doc(user.uid)
        .set(userData.toMap());
    Fluttertoast.showToast(msg: "Insert successfully");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: genderController,
                decoration: InputDecoration(labelText: 'Gender (0 or 1)'),
              ),
              TextField(
                controller: ageController,
                decoration: InputDecoration(labelText: 'Age'),
              ),

              TextField(
                controller: educationController,
                decoration: InputDecoration(labelText: 'Education'),
              ),

              TextField(
                controller: currentSmokerController,
                decoration: InputDecoration(labelText: 'Smoker?'),
              ),

              TextField(
                controller: cigsPerDayController,
                decoration: InputDecoration(labelText: 'cigsPerDay'),
              ),

              // TextField(
              //   controller: BPMedsController,
              //   decoration: InputDecoration(labelText: 'BPMeds history?'),
              // ),

              // TextField(
              //   controller: prevalentStrokeController,
              //   decoration: InputDecoration(labelText: 'Stroke history?'),
              // ),

              // TextField(
              //   controller: prevalentHypController,
              //   decoration: InputDecoration(labelText: 'Hypertension history?'),
              // ),

              // TextField(
              //   controller: diabetesController,
              //   decoration: InputDecoration(labelText: 'Diabetes history?'),
              // ),

              // TextField(
              //   controller: totCholController,
              //   decoration: InputDecoration(labelText: 'Total Cholesterol'),
              // ),

              // TextField(
              //   controller: sysBPController,
              //   decoration: InputDecoration(labelText: 'SysBP'),
              // ),

              // TextField(
              //   controller: diaBPController,
              //   decoration: InputDecoration(labelText: 'diaBP'),
              // ),

              // TextField(
              //   controller: totCholController,
              //   decoration: InputDecoration(labelText: 'Total Cholesterol'),
              // ),
              // Add more TextFields for other input fields...
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await postData();
            await postDataToFireStore();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }
}
