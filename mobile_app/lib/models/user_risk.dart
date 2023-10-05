class UserRisk {
  String? uid;
  String? percent;
  String? level;

  UserRisk({
    this.uid,
    this.percent,
    this.level,
  });

  factory UserRisk.fromMap(map) {
    return UserRisk(
        uid: map['uid'], percent: map['percent'], level: map['level']);
  }

  Map<String, dynamic> toMap() {
    return {'uid': uid, 'percent': percent, 'level': level};
  }
}
