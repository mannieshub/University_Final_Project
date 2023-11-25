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
  bool check = false;
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
        fontWeight: FontWeight.w200
      ),
    );
  }

  Widget _showPercent(String percent) {
    Color levelColor = Color(0xFFFF0000);
    
    // if (percent == "ต่ำ") {
    //   levelColor = Color(0xFFFF8888);
    // }
    // if (percent == "ปานกลาง") {
    //   levelColor = Color(0xFFFD5F5F);
    // }
    // if (percent == "สูง") {
    //   levelColor = Color(0xFFFF0000);
    // }
    return Text(
      percent+" %", //ใส่ต่าตวามเสี่ยงตรงนี้(ต้องเป็น stringนะ)

      style: TextStyle(
          height: 0.95, color: levelColor, fontSize: 45, fontFamily: 'kanit'),
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
          final fetchedPercent = data['percent'];
          if (fetchedPercent != null) {
            setState(() {
              percent = fetchedPercent;
              check = true;
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
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                offset: Offset(1, 1),
                blurRadius: 6,
                spreadRadius: 0,
              ),
            ],
            borderRadius: BorderRadius.circular(15), // Rounded corners
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        10, 15, 10, percent == "ตํ่า" ? 10 : 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                              fontFamily: 'Inter'),
                                        ),
                                        const SizedBox(height: 3),
                                        _userUid()
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
                                    child:
                                    Text(
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              child: Column(
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0,
                                            0,
                                            5,
                                            percent == "ตํ่า" ? 20 : 0),
                                      
                                        child: check == true ?
                                        Text(
                                          "โอกาสเป็นโรคหลอดเลือดหัวใจ",
                                          style: TextStyle(
                                              height: 1,
                                              fontSize: 14,
                                              fontFamily: 'kanit',color: Color(0xFF5A5959)),
                                        ):Text('',
                                        style: TextStyle(
                                          color: Color(0xFF5A5959),
                                          fontWeight: FontWeight.bold
                                        ))
                                      ),
                                      SizedBox(height: 20),
                                      _showPercent(percent)
                                    ],
                                  ),
                                ],
                              ),
                            ),
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
      ]),
    );
  }
}
