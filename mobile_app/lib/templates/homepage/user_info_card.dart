import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//firebase authentication
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_app/authentication/auth.dart';
import 'package:mobile_app/routes/result.dart';

class UserInfoCard extends StatefulWidget {
  @override
  _UserInfoCardState createState() => _UserInfoCardState();
}

class _UserInfoCardState extends State<UserInfoCard> {
  final User? user = Auth().currentUser;
  String percent = "";

  @override
  void initState() {
    super.initState();
    fetchDataFromFirestore();
  }

  Widget _userUid() {
    return Text(
      user?.email ?? 'user email',
      style: TextStyle(
        fontFamily: 'Kanit',
        fontSize: 17,
      ),
    );
  }

  Widget _showPercent(String percent) {
    return Text(
      percent,
      style: TextStyle(
        height: 1,
        color: Color.fromARGB(255, 255, 0, 0),
        fontSize: 50,
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter',
      ),
    );
  }

  Future<void> fetchDataFromFirestore() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection('UserRisk')
              .doc(user!.uid)
              .get();

      if (snapshot.exists) {
        final data = snapshot.data();
        print('$data');
        if (data != null) {
          final fetchedPercent = data['level'];
          if (fetchedPercent != null) {
            setState(() {
              percent = fetchedPercent;
            });
          }
        }
        print('$percent');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchDataFromFirestore();
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              offset: Offset(1, 1),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.circular(15), // Rounded corners
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "WELCOME BACK",
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Inter',
                                        ),
                                      ),
                                      _userUid(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => resultPage(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "คลิกเพื่อดูรายละเอียด",
                                    style: TextStyle(
                                      color: Color(0xFF5A5959),
                                      fontSize: 14,
                                      fontFamily: 'Kanit',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "ความเสี่ยง",
                                      style: TextStyle(
                                        height: 1,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'kanit',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          _showPercent(
                              percent), // ใช้ตัวแปร percent ที่ประกาศในคลาส
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
