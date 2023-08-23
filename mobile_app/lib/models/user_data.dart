class UserData {
  String? uid;
  String? gender;
  String? age;
  String? education;
  String? currentSmoker;
  String? cigsPerDay;
  String? BPMeds;
  String? prevalentStroke;
  String? prevalentHyp;
  String? diabetes;
  String? totChol;
  String? sysBP;
  String? diaBP;
  String? BMI;
  String? heartRate;
  String? glucose;
  String? prediction;

  UserData(
      {this.uid,
      this.gender,
      this.age,
      this.education,
      this.currentSmoker,
      this.cigsPerDay,
      this.BPMeds,
      this.prevalentStroke,
      this.prevalentHyp,
      this.diabetes,
      this.totChol,
      this.sysBP,
      this.diaBP,
      this.BMI,
      this.heartRate,
      this.glucose,
      this.prediction});

  //data from server
  factory UserData.fromMap(map) {
    return UserData(
        uid: map['uid'],
        gender: map['gender'],
        age: map['age'],
        education: map['education'],
        currentSmoker: map['currentSmoker'],
        cigsPerDay: map['cigsPerDay'],
        BPMeds: map['BPMeds'],
        prevalentStroke: map['prevalentStroke'],
        prevalentHyp: map['prevalentHyp'],
        diabetes: map['diabetes'],
        totChol: map['totChol'],
        sysBP: map['sysBP'],
        diaBP: map['diaBP'],
        BMI: map['BMI'],
        heartRate: map['heartRate'],
        glucose: map['glucose'],
        prediction: map['prediction']);
  }

  //sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'gender': gender,
      'age': age,
      'education': education,
      'currentSmoker': currentSmoker,
      'cigsPerDay': cigsPerDay,
      'BPMeds': BPMeds,
      'prevalentStroke': prevalentStroke,
      'prevalentHyp': prevalentHyp,
      'diabetes': diabetes,
      'totChol': totChol,
      'sysBP': sysBP,
      'diaBP': diaBP,
      'BMI': BMI,
      'heartRate': heartRate,
      'glucose': glucose,
      'prediction': prediction,
    };
  }
}
