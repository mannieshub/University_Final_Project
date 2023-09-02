
// //demographic
//   final TextEditingController genderController = TextEditingController();
//   final TextEditingController ageController = TextEditingController();
//   double ageslider = 1.0;
//   int age = 0;
//   int gender = 0;
//   List<bool> _Selectgender = <bool>[true, false];

// Padding(
//                                     padding: EdgeInsetsDirectional.fromSTEB(
//                                         0, 0, 0, 0),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Padding(
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   0, 0, 0, 0),
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             //ของใน card เป็น row ๆ ไป
//                                             children: [
//                                               Padding(
//                                                 padding: EdgeInsetsDirectional
//                                                     .fromSTEB(0, 0, 0, 10),
//                                                 child: Row(
//                                                   children: [
//                                                     Text(
//                                                       "เพศ:",
//                                                       style: TextStyle(
//                                                           fontFamily: 'Kanit',
//                                                           fontSize: 15),
//                                                     ),
//                                                     Text("        "),
//                                                     Padding(
//                                                       padding:
//                                                           EdgeInsetsDirectional
//                                                               .fromSTEB(
//                                                                   30, 0, 0, 0),
//                                                       child: ToggleButtons(
//                                                         constraints:
//                                                             BoxConstraints(
//                                                                 maxWidth: 90,
//                                                                 minWidth: 70,
//                                                                 minHeight: 35,
//                                                                 maxHeight: 35),
//                                                         isSelected:
//                                                             _Selectgender,
//                                                         children: <Widget>[
//                                                           Container(
//                                                               width: 20,
//                                                               child: new Row(
//                                                                 mainAxisAlignment:
//                                                                     MainAxisAlignment
//                                                                         .center,
//                                                                 children: <Widget>[
//                                                                   new Icon(
//                                                                     Icons.male,
//                                                                     size: 20,
//                                                                     color: Colors
//                                                                         .blue,
//                                                                   ),
//                                                                 ],
//                                                               )),
//                                                           Container(
//                                                               width: 20,
//                                                               child: new Row(
//                                                                 mainAxisAlignment:
//                                                                     MainAxisAlignment
//                                                                         .center,
//                                                                 children: <Widget>[
//                                                                   new Icon(
//                                                                     Icons
//                                                                         .female,
//                                                                     size: 20.0,
//                                                                     color: Colors
//                                                                         .pink,
//                                                                   ),
//                                                                 ],
//                                                               )),
//                                                         ],
//                                                         onPressed: (int index) {
//                                                           setState(() {
//                                                             for (int i = 0;
//                                                                 i <
//                                                                     _Selectgender
//                                                                         .length;
//                                                                 i++) {
//                                                               _Selectgender[i] =
//                                                                   i == index;
//                                                             }
//                                                             if (_Selectgender[
//                                                                 0]) {
//                                                               genderController
//                                                                   .text = "0";
//                                                               print(
//                                                                   "ชาย = $gender");
//                                                             } else {
//                                                               genderController
//                                                                   .text = "1";
//                                                               print(
//                                                                   "หญิง = $gender");
//                                                             }
//                                                           });
//                                                         },
//                                                         borderRadius:
//                                                             const BorderRadius
//                                                                     .all(
//                                                                 Radius.circular(
//                                                                     20)),
//                                                       ),
//                                                     ),
//                                                     Text("                   "),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: EdgeInsetsDirectional
//                                                     .fromSTEB(0, 0, 0, 0),
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   children: [
//                                                     Text(
//                                                       "อายุ",
//                                                       style: TextStyle(
//                                                           fontFamily: 'Kanit',
//                                                           fontSize: 15),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Padding(
//                                                   padding: EdgeInsetsDirectional
//                                                       .fromSTEB(20, 0, 0, 0),
//                                                   child: Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         Column(
//                                                           children: [
//                                                             Slider(
//                                                               value: ageslider,
//                                                               onChanged:
//                                                                   (newRating) {
//                                                                 setState(
//                                                                   () => ageslider =
//                                                                       newRating, //รับค่าจาก slider มาใน agelider
//                                                                 );
//                                                                 setState(() {
//                                                                   age = ageslider //เปลี่ยน double เป็น integer เพื่ออะไปใช้ต่อ
//                                                                       .floor();

//                                                                   //ค่า age คือค่าใช้จริง
//                                                                 });
//                                                                 setState(() {
//                                                                   //รับค่าจาก slider มาใน textEditingController ของ textfleid เพื่อแสดงค่าปัจุบันให้ user เห็น
//                                                                   ageController
//                                                                       .text = (newRating
//                                                                           .floor())
//                                                                       .toString();
//                                                                 });
//                                                               },
//                                                               min: 0,
//                                                               max: 100,
//                                                               divisions: 100,
//                                                               label: "$age",
//                                                             )
//                                                           ],
//                                                         ),
//                                                         Column(
//                                                           children: [
//                                                             Container(
//                                                               width:
//                                                                   27, // กำหนดความกว้างที่คุณต้องการ
//                                                               child:
//                                                                   TextFormField(
//                                                                 validator:
//                                                                     (value) {},
//                                                                 controller:
//                                                                     ageController,
//                                                                 keyboardType:
//                                                                     TextInputType
//                                                                         .number,
//                                                                 decoration:
//                                                                     InputDecoration(
//                                                                   hintText:
//                                                                       "$age",
//                                                                   border:
//                                                                       InputBorder
//                                                                           .none,

//                                                                   //textEditingControllerAge
//                                                                 ),
//                                                                 // ค่าอื่น ๆ ของ TextField
//                                                               ),
//                                                             )
//                                                           ],
//                                                         ),
//                                                         Padding(
//                                                           padding:
//                                                               EdgeInsetsDirectional
//                                                                   .fromSTEB(10,
//                                                                       0, 0, 0),
//                                                           child: Column(
//                                                             children: [
//                                                               Text(
//                                                                 "ปี",
//                                                                 style: TextStyle(
//                                                                     fontFamily:
//                                                                         'Kanit',
//                                                                     fontSize:
//                                                                         15),
//                                                               )
//                                                             ],
//                                                           ),
//                                                         )
//                                                       ]))
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),