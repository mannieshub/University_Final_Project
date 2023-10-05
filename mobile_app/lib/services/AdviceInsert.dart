import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_app/authentication/auth.dart';
import 'package:mobile_app/models/user_advice.dart';

Future<void> postAdviceToFireStore(
  int currentSmoker,
  int prevalentStroke,
  int prevalentHyp,
  int diabetes,
  double Cholesterol,
  double Glucose,
  double Heartrate,
  double BMI,
  double SysBP,
) async {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user = Auth().currentUser;
  UserAdvice userAdvice = UserAdvice();

  userAdvice.uid = user!.uid;
  if (currentSmoker == 1) {
    userAdvice.currentSmoker = "1";
  } else {
    userAdvice.currentSmoker = "0";
  }

  if (prevalentStroke == 1) {
    userAdvice.prevalentStroke = "1";
  } else {
    userAdvice.prevalentStroke = "0";
  }

  if (prevalentHyp == 1) {
    userAdvice.prevalentHyp = "1";
  } else {
    userAdvice.prevalentHyp = "0";
  }

  if (diabetes == 1) {
    userAdvice.diabetes = "1";
  } else {
    userAdvice.diabetes = "0";
  }

  if (Cholesterol >= 150) {
    userAdvice.totalCholesterol = "1";
  } else {
    userAdvice.totalCholesterol = "0";
  }

  if (Glucose >= 126) {
    userAdvice.glucose = "1";
  } else {
    userAdvice.glucose = "0";
  }

  if (Heartrate >= 150) {
    userAdvice.heartRate = "1";
  } else {
    userAdvice.heartRate = "0";
  }

  if (BMI >= 25) {
    userAdvice.BMI = "1";
  } else {
    userAdvice.BMI = "0";
  }

  if (SysBP >= 140) {
    userAdvice.sysBP = "1";
  } else {
    userAdvice.sysBP = "0";
  }

  await firebaseFirestore
      .collection("UserAdvice")
      .doc(user.uid)
      .set(userAdvice.toMap());
}
