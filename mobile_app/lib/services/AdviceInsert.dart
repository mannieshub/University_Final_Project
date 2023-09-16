import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_app/authentication/auth.dart';
import 'package:mobile_app/models/user_advice.dart';

Future<void> postAdviceToFireStore(
  int currentSmoker,
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
  if (currentSmoker == 1) {
    userAdvice.currentSmoker = "การสูบบุหรี่ไม่ดีต่อสุขภาพของหัวใจ"
        "ดังนั้นคุณควรลดปริมาณการสูบบุหรี่ลง หากเลิกสูบบุหรี่ได้จะดีมาก";
  }
  if (Cholesterol >= 150) {
    userAdvice.totalCholesterol = "คุณมีระดับคอเลสเตอรอลสูงกว่าระดับกว่าปกติ"
        "ดังนั้นคุณควรงดรับประทานของหวาน ของทอดและของมัน";
  }
  if (Glucose >= 126) {
    userAdvice.glucose =
        "ระดับกลูโคสของคุณมีสูงกว่าระดับปกติ ทำให้คุณมีโอกาสสูงที่จะเป็นโรคเบาหวาน";
  }
  if (Heartrate >= 150) {
    userAdvice.heartRate =
        "อัตราการเต้นของหัวใจของคุณสูงกว่าระดับปกติ อาจมีโรคความดันโลหิตสูงหรือโรคหลอดเลือดหัวใจ "
        "คุณควรออกกำลังกายสัปดาห์ละ 3-5 ครั้ง ครั้งละ 30 นาที";
  }
  if (BMI >= 25) {
    userAdvice.BMI =
        "ดัชนีมวลกายของคุณอยู่ในกลุ่มเสี่ยงที่อาจเป็นโรคอ้วน ซึ่งเป็นอาการแทรกซ้อนของโรคหลอดเลือดหัวใจ";
  }
  if (SysBP >= 140) {
    userAdvice.sysBP = "หัวใจเต้นแรงทุกวินาที";
  }
  if (DiaBP >= 90) {
    userAdvice.diaBP = "หัวใจเต้นแรงไปนะบางที";
  }

  await firebaseFirestore
      .collection("UserAdvice")
      .doc(user.uid)
      .set(userAdvice.toMap());
}
