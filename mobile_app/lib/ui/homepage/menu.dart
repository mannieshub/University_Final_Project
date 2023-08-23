// import 'package:flutter/material.dart';

// class widgetFunction extends StatelessWidget {
//   const widgetFunction({super.key});

//text navigate img colors

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Column(
//             children: [
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => M_Pa(),//result page
//                               ),
//                             );
//                           },
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(25),
//                             child: Card(
//                               color: Color(0xFF4FCCBD),
//                               child: Column(
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsetsDirectional.all(10),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   0, 0, 0, 0),
//                                           child: Column(
//                                             children: [
//                                               Image.asset(
//                                                 'images/Icon_As.png',
//                                                 // ระบุเส้นทางของไอคอนภาพ
//                                                 width:
//                                                     50, // กำหนดความกว้างของไอคอน
//                                                 height:
//                                                     50, // กำหนดความสูงของไอคอน
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           "ผลการประเมิน",
//                           style: TextStyle(
//                             fontSize: 10,
//                             fontFamily: 'Kanit',
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//           Column(
//             children: [
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => M_Pa(), //advice page
//                               ),
//                             );
//                           },
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(25),
//                             child: Card(
//                               color: Color(0xFF4FCCBD),
//                               child: Column(
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsetsDirectional.all(10),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   0, 0, 0, 0),
//                                           child: Column(
//                                             children: [
//                                               Image.asset(
//                                                 'images/Icon_HandHeart.png',
//                                                 // ระบุเส้นทางของไอคอนภาพ
//                                                 width:
//                                                     50, // กำหนดความกว้างของไอคอน
//                                                 height:
//                                                     50, // กำหนดความสูงของไอคอน
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           "คำแนะนำ",
//                           style: TextStyle(
//                             fontSize: 10,
//                             fontFamily: 'Kanit',
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//           Column(
//             children: [
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => E_Po(),
//                                 //ตรงนี้ส่วนของลิ้งไปหน้าโปรไฟล์
//                               ),
//                             );
//                           },
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(25),
//                             child: Card(
//                               color: Color(0xFF4FCCBD),
//                               child: Column(
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsetsDirectional.all(10),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   0, 0, 0, 0),
//                                           child: Column(
//                                             children: [
//                                               Image.asset(
//                                                 'images/user-icon.png',
//                                                 // ระบุเส้นทางของไอคอนภาพ
//                                                 width:
//                                                     50, // กำหนดความกว้างของไอคอน
//                                                 height:
//                                                     50, // กำหนดความสูงของไอคอน
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           "โปรไฟล์",
//                           style: TextStyle(
//                             fontSize: 10,
//                             fontFamily: 'Kanit',
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//           Column(
//             children: [
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => S_In(),
//                                 //ตรงนี้ส่วนของลิ้งไปหน้าโปรไฟล์
//                               ),
//                             );
//                           },
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(25),
//                             child: Card(
//                               color: Color.fromARGB(255, 255, 140, 120),
//                               child: Column(
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsetsDirectional.all(10),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   0, 0, 0, 0),
//                                           child: Column(
//                                             children: [
//                                               Image.asset(
//                                                 'images/Icon_Exit.png',
//                                                 // ระบุเส้นทางของไอคอนภาพ
//                                                 width:
//                                                     50, // กำหนดความกว้างของไอคอน
//                                                 height:
//                                                     50, // กำหนดความสูงของไอคอน
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           "ออกจากระบบ",
//                           style: TextStyle(
//                             fontSize: 10,
//                             fontFamily: 'Kanit',
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
