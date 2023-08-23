// import 'package:project_chd/Main_page.dart';
// import 'package:flutter/material.dart';

// class E_Po extends StatefulWidget {
//   @override
//   _E_PoState createState() => _E_PoState();
// }

// class _E_PoState extends State<E_Po> {
//   //ค่าเอาไว้เช็ค ค่าว่าพิมได้หรือไม่ ใน textfield ---------------
//   bool checkEditUsername = true;
//   //ค่า checkEditUsername มีไว้เช็ค ให้สามารถพิมพ์ข้อความใน textfield ได้หรือไม่ในส่วนของ username ถ้า ture พิมไม่ได้ false พิมไม่ได้
//   bool checkEditPassword = true;
//   //ค่า checkEditPassword มีไว้เช็ค ให้สามารถพิมพ์ข้อความใน textfield ได้หรือไม่ในส่วนของ password ถ้า ture พิมไม่ได้ false พิมไม่ได้
//   bool checkEditEmail = true;
//   //ค่า checkEditEmail มีไว้เช็ค ให้สามารถพิมพ์ข้อความใน textfield ได้หรือไม่ในส่วนของ email ถ้า ture พิมไม่ได้ false พิมไม่ได้

// //ตัวแปร textController ของ textfield ไว้สำหรับ รับค่าที่ user ใส่เข้ามา
// // ++ เวลาแทนค่าของ textController จะทำได้ เช่น textEditingControllerUsername.text = ค่า String ;
//   TextEditingController textEditingControllerUsername = TextEditingController();
//   TextEditingController textEditingControllerEmail = TextEditingController();
//   TextEditingController textEditingControllerPassword = TextEditingController();

//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Container(
//           color: Color(0XFFFFEEDD),
//           //SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Container(
//               color: Color(0XFFFFEEDD),
//               padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
//               margin: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 0),
//               child: Column(
//                 children: <Widget>[
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(30),
//                           child: Card(
//                             child: Column(
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       0, 10, 0, 10),
//                                   child: Column(
//                                     children: [
//                                       Row(
//                                         mainAxisSize: MainAxisSize.max,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Text(
//                                             "แก้ไขบัญชีผู้ใช้",
//                                             style: TextStyle(
//                                               fontSize: 24,
//                                               fontFamily: 'Kanit',
//                                             ),
//                                           )
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       0, 0, 0, 0),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       CircleAvatar(
//                                         radius: 65.0,
//                                         backgroundImage:
//                                             AssetImage('images/user-icon.png'),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       10, 0, 0, 10),
//                                   child: Column(
//                                     children: [
//                                       Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             10, 0, 0, 0),
//                                         child: Row(
//                                           children: [
//                                             Column(
//                                               children: [
//                                                 Text(
//                                                   "ชื่อผู้ใช้",
//                                                   style: TextStyle(
//                                                       fontFamily: 'Kanit',
//                                                       fontSize: 20),
//                                                 ),
//                                               ],
//                                             ),
//                                             Column(
//                                               children: [
//                                                 Container(
//                                                   margin: EdgeInsetsDirectional
//                                                       .fromSTEB(25, 10, 10, 10),
//                                                   decoration: BoxDecoration(
//                                                     border: Border.all(
//                                                       color: Colors.white,
//                                                       // สีขอบ
//                                                       width:
//                                                           1, // ความกว้างของเส้นขอบ
//                                                     ),
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             10),
//                                                     color: Color(0XFFD9D9D9),
//                                                   ),
//                                                   width: 200,
//                                                   child: TextFormField(
//                                                     validator: (value) {},
//                                                     readOnly:
//                                                         checkEditUsername, //ส่วนเช็คว่าพิมได้หรือไม่
//                                                     controller:
//                                                         textEditingControllerUsername, //ส่วนที่ไว้รับค่าจากuser
//                                                     decoration: InputDecoration(
//                                                         border:
//                                                             InputBorder.none,
//                                                         hintText: "ชิมมินกยู",
//                                                         suffixIcon: IconButton(
//                                                           icon:
//                                                               Icon(Icons.edit),
//                                                           color: Colors.black,
//                                                           onPressed: () {
//                                                             setState(() {
//                                                               //เงื่อนไขเช็ค เมื่อกดปุ่ม Icon ทำให้ กลับค่า true->false false->true เพื่อใช้เช็คว่าแก้ไขได้หรือไม่
//                                                               checkEditUsername =
//                                                                   !checkEditUsername;
//                                                             });
//                                                           },
//                                                         ),
//                                                         contentPadding:
//                                                             EdgeInsetsDirectional
//                                                                 .fromSTEB(10,
//                                                                     14, 0, 0)),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             10, 0, 0, 0),
//                                         child: Row(
//                                           children: [
//                                             Column(
//                                               children: [
//                                                 Text(
//                                                   "Email",
//                                                   style: TextStyle(
//                                                       fontFamily: 'Inters',
//                                                       fontSize: 20),
//                                                 ),
//                                               ],
//                                             ),
//                                             Column(
//                                               children: [
//                                                 Container(
//                                                   margin: EdgeInsetsDirectional
//                                                       .fromSTEB(25, 10, 10, 10),
//                                                   decoration: BoxDecoration(
//                                                     border: Border.all(
//                                                       color: Colors.white,
//                                                       // สีขอบ
//                                                       width:
//                                                           1, // ความกว้างของเส้นขอบ
//                                                     ),
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             10),
//                                                     color: Color(0XFFD9D9D9),
//                                                   ),
//                                                   width: 200,
//                                                   child: TextFormField(
//                                                     validator: (value) {},
//                                                     readOnly:
//                                                         checkEditEmail, //ส่วนเช็คว่าพิมได้หรือไม่

//                                                     controller:
//                                                         textEditingControllerEmail, //ส่วนที่ไว้รับค่าจากuser
//                                                     decoration: InputDecoration(
//                                                         border:
//                                                             InputBorder.none,
//                                                         hintText:
//                                                             "ชิมมินกยู", //ค่า Email ปัจุบันก่อนแก้ไข
//                                                         suffixIcon: IconButton(
//                                                           icon:
//                                                               Icon(Icons.edit),
//                                                           color: Colors.black,
//                                                           onPressed: () {
//                                                             setState(() {
//                                                               //เงื่อนไขเช็ค เมื่อกดปุ่ม Icon ทำให้ กลับค่า true->false false->true เพื่อใช้เช็คว่าแก้ไขได้หรือไม่

//                                                               checkEditEmail =
//                                                                   !checkEditEmail;
//                                                             });
//                                                           },
//                                                         ),
//                                                         contentPadding:
//                                                             EdgeInsetsDirectional
//                                                                 .fromSTEB(10,
//                                                                     14, 0, 0)),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             10, 0, 0, 0),
//                                         child: Row(
//                                           children: [
//                                             Column(
//                                               children: [
//                                                 Text(
//                                                   "รหัสผ่าน",
//                                                   style: TextStyle(
//                                                       fontFamily: 'Kanit',
//                                                       fontSize: 20),
//                                                 )
//                                               ],
//                                             ),
//                                             Column(
//                                               children: [
//                                                 Container(
//                                                   margin: EdgeInsetsDirectional
//                                                       .fromSTEB(10, 10, 10, 10),
//                                                   decoration: BoxDecoration(
//                                                     border: Border.all(
//                                                       color: Colors.white,
//                                                       // สีขอบ
//                                                       width:
//                                                           1, // ความกว้างของเส้นขอบ
//                                                     ),
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             10),
//                                                     color: Color(0XFFD9D9D9),
//                                                   ),
//                                                   width: 200,
//                                                   child: TextFormField(
//                                                     validator: (value) {},
//                                                     readOnly:
//                                                         checkEditPassword, //ส่วนเช็คว่าพิมได้หรือไม่
//                                                     obscureText:
//                                                         checkEditPassword, //เป็นส่วนไว้สำหรับปิดรหัส
//                                                     controller:
//                                                         textEditingControllerPassword, //ส่วนที่ไว้รับค่าจากuser
//                                                     decoration: InputDecoration(
//                                                         border:
//                                                             InputBorder.none,
//                                                         hintText:
//                                                             //เงื่อนไขเช็ค เมื่อเปิดหน้านี้มา จะแสดง เป็น **** ก่อน เมื่อกดIcon edit จะเป็นคำว่าpasswod
//                                                             checkEditPassword
//                                                                 ? '********'
//                                                                 : 'Password', //ค่า password ปัจุบันก่อนแก้ไข
//                                                         suffixIcon: IconButton(
//                                                           icon:
//                                                               Icon(Icons.edit),
//                                                           color: Colors.black,
//                                                           onPressed: () {
//                                                             setState(() {
//                                                               //เงื่อนไขเช็ค เมื่อกดปุ่ม Icon ทำให้ กลับค่า true->false false->true เพื่อใช้เช็คว่าแก้ไขได้หรือไม่
//                                                               checkEditPassword =
//                                                                   !checkEditPassword;
//                                                             });
//                                                           },
//                                                         ),
//                                                         contentPadding:
//                                                             EdgeInsetsDirectional
//                                                                 .fromSTEB(10,
//                                                                     14, 0, 0)),
//                                                   ),
//                                                 ),
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       20, 0, 20, 8),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       GestureDetector(
//                                         onTap: () {
//                                           if (true) {
//                                             Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                 builder: (context) => M_Pa(),
//                                                 //ลิ้งไปหน้า home page
//                                               ),
//                                             );
//                                           }
//                                         },
//                                         child: CircleAvatar(
//                                           radius: 32,
//                                           backgroundImage: AssetImage(
//                                               'images/Icon_True.png'),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       20, 0, 20, 8),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       GestureDetector(
//                                         onTap: () {
//                                           Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                               builder: (context) => M_Pa(),
//                                               //ลิ้งไปหน้า home page
//                                             ),
//                                           );
//                                         },
//                                         child: Text(
//                                           "กลับสู่หน้าหลัก",
//                                           style: TextStyle(
//                                             color: Color.fromARGB(255, 0, 0, 0),
//                                             fontSize: 20,
//                                             fontFamily: 'Kanit',
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }
