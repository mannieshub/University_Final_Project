import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      String predictionText = data['prediction_text'];
      String predictionPercent = data['percent'];
      PredictionDialog.show(context, predictionPercent);
    } else {
      print('Failed to make request. Error code: ${response.statusCode}');
    }
  }
}
