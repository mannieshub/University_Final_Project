class UserAdvice {
  String? uid;
  String? diabetes;
  String? prevalentStroke;
  String? prevalentHyp;
  String? currentSmoker;
  String? totalCholesterol;
  String? sysBP;
  String? BMI;
  String? heartRate;
  String? glucose;

  UserAdvice({
    this.uid,
    this.diabetes,
    this.prevalentHyp,
    this.prevalentStroke,
    this.currentSmoker,
    this.totalCholesterol,
    this.sysBP,
    this.BMI,
    this.heartRate,
    this.glucose,
  });

  factory UserAdvice.fromMap(map) {
    return UserAdvice(
      uid: map['uid'],
      currentSmoker: map['currentSmoker'],
      diabetes: map['diabetes'],
      prevalentHyp: map['prevalentHyp'],
      prevalentStroke: map['prevalentStroke'],
      totalCholesterol: map['totalCholesterol'],
      sysBP: map['sysBP'],
      BMI: map['BMI'],
      heartRate: map['heartRate'],
      glucose: map['glucose'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'currentSmoker': currentSmoker,
      'prevalentStroke': prevalentStroke,
      'prevalentHyp': prevalentHyp,
      'diabetes': diabetes,
      'totalCholesterol': totalCholesterol,
      'sysBP': sysBP,
      'BMI': BMI,
      'heartRate': heartRate,
      'glucose': glucose,
    };
  }
}
