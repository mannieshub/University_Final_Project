import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_app/authentication/auth.dart';
import 'package:mobile_app/models/user_advice.dart';

Future<void> postAdviceToFireStore(
  double Cholesterol,
  double Glucose,
  double Heartrate,
  double BMI,
  double SysBP,
  double DiaBP,
) async {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user = Auth().currentUser;
  UserAdvice userAdvice = UserAdvice();

  userAdvice.uid = user!.uid;
  if (Cholesterol >= 150) {
    userAdvice.totalCholesterol = "อ้วน";
  }
  if (Glucose >= 200) {
    userAdvice.glucose = "กินน้ำตาลเยอะไปป่าว";
  }
  if (Heartrate >= 200) {
    userAdvice.heartRate = "ออกกำลังกายบ้าง";
  }
  if (BMI >= 40) {
    userAdvice.BMI = "อ้วน กินเยอะ ออกกำลังกายนะ";
  }
  if (SysBP >= 150) {
    userAdvice.sysBP = "หัวใจเต้นแรงทุกวินาที";
  }
  if (DiaBP >= 100) {
    userAdvice.diaBP = "หัวใจเต้นแรงไปนะบางที";
  }

  await firebaseFirestore
      .collection("UserAdvice")
      .doc(user.uid)
      .set(userAdvice.toMap());
}
