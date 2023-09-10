class UserAdvice {
  String? uid;
  String? currentSmoker;
  String? totalCholesterol;
  String? sysBP;
  String? diaBP;
  String? BMI;
  String? heartRate;
  String? glucose;

  UserAdvice({
    this.uid,
    this.currentSmoker,
    this.totalCholesterol,
    this.sysBP,
    this.diaBP,
    this.BMI,
    this.heartRate,
    this.glucose,
  });

  factory UserAdvice.fromMap(map) {
    return UserAdvice(
      uid: map['uid'],
      currentSmoker: map['currentSmoker'],
      totalCholesterol: map['totalCholesterol'],
      sysBP: map['sysBP'],
      diaBP: map['diaBP'],
      BMI: map['BMI'],
      heartRate: map['heartRate'],
      glucose: map['glucose'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'currentSmoker': currentSmoker,
      'totalCholesterol': totalCholesterol,
      'sysBP': sysBP,
      'diaBP': diaBP,
      'BMI': BMI,
      'heartRate': heartRate,
      'glucose': glucose,
    };
  }
}
