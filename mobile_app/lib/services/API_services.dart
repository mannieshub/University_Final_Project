import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/authentication/auth.dart';
import 'package:mobile_app/models/user_data.dart';
import 'package:mobile_app/models/user_risk.dart';
import 'package:mobile_app/routes/assessmentPage.dart';
import 'dart:convert';
import 'package:mobile_app/templates/assessmentPage/prediction_dialog.dart';

class ApiService {
  static Future<void> postData(
    BuildContext context,
    TextEditingController genderController,
    TextEditingController ageController,
    TextEditingController educationController,
    TextEditingController currentSmokerController,
    TextEditingController cigsPerDayController,
    TextEditingController BPMedsController,
    TextEditingController prevalentStrokeController,
    TextEditingController prevalentHypController,
    TextEditingController diabetesController,
    TextEditingController totCholController,
    TextEditingController sysBPController,
    TextEditingController diaBPController,
    TextEditingController BMIController,
    TextEditingController heartRateController,
    TextEditingController glucoseController,
  ) async {
    var response = await http.post(
      // URL web-server
      Uri.parse("https://chd-server.azurewebsites.net/predict"),

      // http request
      body: {
        "gender": genderController.text,
        "age": ageController.text,
        "education": educationController.text,
        "currentSmoker": currentSmokerController.text,
        "cigsPerDay": cigsPerDayController.text,
        "BPMeds": BPMedsController.text,
        "prevalentStroke": prevalentStrokeController.text,
        "prevalentHyp": prevalentHypController.text,
        "diabetes": diabetesController.text,
        "totChol": totCholController.text,
        "sysBP": sysBPController.text,
        "diaBP": diaBPController.text,
        "BMI": BMIController.text,
        "heartRate": heartRateController.text,
        "glucose": glucoseController.text,
      },
    );

    String predictionPercent = '';
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      //String predictionText = data['prediction_text'];
      predictionPercent = data['percent'];
      PredictionDialog.show(context, predictionPercent);
    } else {
      print('Failed to make request. Error code: ${response.statusCode}');
    }

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = Auth().currentUser;
    UserRisk userRisk = UserRisk();

    String level = "";
    double? percent = double.tryParse(predictionPercent);
    if (percent! >= 0 && percent < 10) {
      level = "ต่ำ";
    }
    if (percent >= 10 && percent < 25) {
      level = "ปานกลาง";
    }
    if (percent >= 25) {
      level = "สูง";
    }

    userRisk.uid = user!.uid;
    userRisk.percent = predictionPercent;
    userRisk.level = level;

    await firebaseFirestore
        .collection("UserRisk")
        .doc(user.uid)
        .set(userRisk.toMap());
    Fluttertoast.showToast(msg: "Insert successfully");
  }
}
