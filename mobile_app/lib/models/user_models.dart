class UserModel {
  String? uid;
  String? email;
  String? username;

  UserModel({this.uid, this.email, this.username});

  //data from server

  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'], email: map['email'], username: map['username']);
  }

  //sending data to our server
  Map<String, dynamic> toMap() {
    return {'uid': uid, 'email': email, 'username': username};
  }
}
