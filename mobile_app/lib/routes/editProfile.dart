import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_app/authentication/auth.dart';
import 'package:flutter/material.dart';

class editProfilePage extends StatefulWidget {
  @override
  _editProfilePageState createState() => _editProfilePageState();
}

class _editProfilePageState extends State<editProfilePage> {
  //ค่าเอาไว้เช็ค ค่าว่าพิมได้หรือไม่ ใน textfield ---------------
  bool checkEditUsername = true;
  //ค่า checkEditUsername มีไว้เช็ค ให้สามารถพิมพ์ข้อความใน textfield ได้หรือไม่ในส่วนของ username ถ้า ture พิมไม่ได้ false พิมไม่ได้
  bool checkEditPassword = true;
  //ค่า checkEditPassword มีไว้เช็ค ให้สามารถพิมพ์ข้อความใน textfield ได้หรือไม่ในส่วนของ password ถ้า ture พิมไม่ได้ false พิมไม่ได้
  bool checkEditPassword2 = true;
  //ค่า checkEditPassword2 มีไว้เช็ค ให้สามารถพิมพ์ข้อความใน textfield ได้หรือไม่ในส่วนของ password ถ้า ture พิมไม่ได้ false พิมไม่ได้
  bool checkEditEmail = true;
  //ค่า checkEditEmail มีไว้เช็ค ให้สามารถพิมพ์ข้อความใน textfield ได้หรือไม่ในส่วนของ email ถ้า ture พิมไม่ได้ false พิมไม่ได้

//-----------------------------------------------------------------
//คือ ค่าดั้งเดิมก่อนของ user ที่กรอกมาจากการ login นั้นแหละ มีไว้สำหรับไว้เช็คว่ามีการเปลี่ยนแปลงมั้ย
// ให้ส่งค่ามาให้กับตัวแปรพวกนี้เพื่อใช้ในการตรวจสอบการแปลี่ยนแปลงข้อมูล
  String textEditingControllerUsernameOriginal = "";
  String textEditingControllerEmailOriginal = "mail";
  String textEditingControllerPasswordOriginal = "300";
  String textEditingControllerPassword2Original = "300";
//---------------------------------------------------------------
//ตัวแปร textController ของ textfield ไว้สำหรับ รับค่าที่ user ใส่เข้ามา จะเป็นค่าที่เกิดการเปลี่ยนแปลงตาม input
// ++ เวลาแทนค่าของ textController จะทำได้ เช่น textEditingControllerUsername.text = ค่า String ;
// ให้ส่งค่ามาให้กับตัวแปรพวกนี้เพื่อให้ user แก้ไขข้อความใน textfield ได้
  TextEditingController textEditingControllerUsername =
      TextEditingController(text: "");
  TextEditingController textEditingControllerEmail =
      TextEditingController(text: "mail");
  TextEditingController textEditingControllerPassword =
      TextEditingController(text: "300");
  TextEditingController textEditingControllerPassword2 =
      TextEditingController(text: "300");
//  ตัวนี้ไม่ต้องนะไม่เกี่ยวกัน ไม่ต้องส่งค่ามาให้ตัวนี้
  TextEditingController textEditingControllerCheckPassword =
      TextEditingController(text: "");

  final _formKey = GlobalKey<FormState>();
  User? user = Auth().currentUser;
  changePassword({email, oldPassword, newPassword}) async {
    var cred =
        EmailAuthProvider.credential(email: email, password: oldPassword);
    await user!.reauthenticateWithCredential(cred).then((value) {
      user!.updatePassword(newPassword);
    }).catchError((error) {
      print(error.toString());
    });
  }

  void _showAlertDialogsSaveData(BuildContext context) {
    // ฟังก์ชันแสดงตัว Alert
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pop(); // ปิด AlertDialog หลังจากผ่านไป 2 วินาที
          Navigator.of(context).pop();
        });

        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AlertDialog(
              backgroundColor: Color(0XFFD9D9D9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              titlePadding: const EdgeInsets.all(0),
              title: Container(
                padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
              ),
              content: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Wrap(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 32,
                          backgroundImage: AssetImage('images/Icon_True.png'),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Text(
                        "บันทึกข้อมูลเรียบร้อยแล้ว", // ส่วนของ ข้อความ title ที่พิ้นหลังสีแดงๆ
                        style: TextStyle(
                          fontFamily: 'kanit',
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showAlertDialogsErrorSaveData(BuildContext context) {
    // ฟังก์ชันแสดงตัว Alert
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pop(); // ปิด AlertDialog หลังจากผ่านไป 2 วินาที
        });

        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AlertDialog(
              backgroundColor: Color(0XFFD9D9D9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              titlePadding: const EdgeInsets.all(0),
              title: Container(
                padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  children: [],
                ),
              ),
              content: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Wrap(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 32,
                          backgroundImage: AssetImage('images/Icon_True.png'),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Text(
                        "ข้อมูลผู้ใช้มีการเปลี่ยนแปลง \n หากไม่ทำการบันทึกการเปลี่ยนแปลง ข้อมูลจะไม่ถูกบันทึก", // ส่วนของ ข้อความ title ที่พิ้นหลังสีแดงๆ
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'kanit',
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                      child: Container(
                    color: Color(0XFFFFEEDD),
                    //SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Container(
                        color: Color(0XFFFFEEDD),
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        margin: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 30, 0, 30),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "แก้ไขบัญชีผู้ใช้",
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontFamily: 'Kanit',
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Card(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 25, 10, 25),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 0, 0),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Text(
                                                            "ชื่อผู้ใช้",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Kanit',
                                                                fontSize: 20),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        10,
                                                                        0,
                                                                        10),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10),
                                                              ),
                                                              color: Color(
                                                                  0XFFD9D9D9),
                                                            ),
                                                            width: 220,
                                                            child:
                                                                TextFormField(
                                                              validator:
                                                                  (value) {},

                                                              readOnly:
                                                                  checkEditUsername, //ส่วนเช็คว่าพิมได้หรือไม่
                                                              controller:
                                                                  textEditingControllerUsername, //ส่วนที่ไว้รับค่าจากuser
                                                              decoration: InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText: "",
                                                                  contentPadding:
                                                                      EdgeInsetsDirectional.fromSTEB(
                                                                          10,
                                                                          14.2,
                                                                          0,
                                                                          16)),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20,
                                                                            13,
                                                                            20,
                                                                            13),
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                            10),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            10),
                                                                  ), // กำหนดความโค้งของมุมปุ่ม
                                                                ),

                                                                textStyle: TextStyle(
                                                                    fontSize:
                                                                        15), // เปลี่ยนสีปุ่มเป็นสีแดง
                                                              ),
                                                              onPressed: () {
                                                                //Navigator.of(context).pop();
                                                                // รหัสที่ต้องการให้ทำเมื่อปุ่มถูกกด
                                                                setState(() {
                                                                  //เงื่อนไขเช็ค เมื่อกดปุ่ม Icon ทำให้ กลับค่า true->false false->true เพื่อใช้เช็คว่าแก้ไขได้หรือไม่
                                                                  checkEditUsername =
                                                                      !checkEditUsername;
                                                                });
                                                              },
                                                              child: InkWell(
                                                                onTap: () {
                                                                  // เมื่อไอคอนถูกแตะ
                                                                  setState(() {
                                                                    //เงื่อนไขเช็ค เมื่อกดปุ่ม Icon ทำให้ กลับค่า true->false false->true เพื่อใช้เช็คว่าแก้ไขได้หรือไม่
                                                                    checkEditUsername =
                                                                        !checkEditUsername;
                                                                  }); // ใช้ Navigator.pop เพื่อย้อนกลับไปยังหน้าก่อนหน้านี้
                                                                },
                                                                child: Icon(
                                                                  Icons.edit,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                              )),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 0, 0),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Text(
                                                            "Email",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Inters',
                                                                fontSize: 20),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        10,
                                                                        0,
                                                                        10),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10),
                                                              ),
                                                              color: Color(
                                                                  0XFFD9D9D9),
                                                            ),
                                                            width: 220,
                                                            child:
                                                                TextFormField(
                                                              validator:
                                                                  (value) {},
                                                              readOnly:
                                                                  checkEditEmail, //ส่วนเช็คว่าพิมได้หรือไม่
                                                              controller:
                                                                  textEditingControllerEmail, //ส่วนที่ไว้รับค่าจากuser
                                                              decoration: InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      "ชิมมินกยู",
                                                                  contentPadding:
                                                                      EdgeInsetsDirectional.fromSTEB(
                                                                          10,
                                                                          14.2,
                                                                          0,
                                                                          16)),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20,
                                                                            13,
                                                                            20,
                                                                            13),
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                            10),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            10),
                                                                  ), // กำหนดความโค้งของมุมปุ่ม
                                                                ),

                                                                textStyle: TextStyle(
                                                                    fontSize:
                                                                        15), // เปลี่ยนสีปุ่มเป็นสีแดง
                                                              ),
                                                              onPressed: () {
                                                                setState(() {
                                                                  //เงื่อนไขเช็ค เมื่อกดปุ่ม Icon ทำให้ กลับค่า true->false false->true เพื่อใช้เช็คว่าแก้ไขได้หรือไม่
                                                                  checkEditEmail =
                                                                      !checkEditEmail;
                                                                });
                                                              },
                                                              child: InkWell(
                                                                onTap: () {
                                                                  // เมื่อไอคอนถูกแตะ
                                                                  setState(() {
                                                                    //เงื่อนไขเช็ค เมื่อกดปุ่ม Icon ทำให้ กลับค่า true->false false->true เพื่อใช้เช็คว่าแก้ไขได้หรือไม่
                                                                    checkEditEmail =
                                                                        !checkEditEmail;
                                                                  }); // ใช้ Navigator.pop เพื่อย้อนกลับไปยังหน้าก่อนหน้านี้
                                                                },
                                                                child: Icon(
                                                                  Icons.edit,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                              )),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 0, 0),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Text(
                                                            "รหัสผ่าน",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Kanit',
                                                                fontSize: 20),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        10,
                                                                        0,
                                                                        10),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10),
                                                              ),
                                                              color: Color(
                                                                  0XFFD9D9D9),
                                                            ),
                                                            width: 220,
                                                            child:
                                                                TextFormField(
                                                              validator:
                                                                  (value) {},
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  if (textEditingControllerPassword
                                                                          .text !=
                                                                      textEditingControllerPassword2
                                                                          .text) {
                                                                    textEditingControllerCheckPassword
                                                                            .text =
                                                                        "* รหัสผ่านไม่ถูกต้อง";
                                                                  } else {
                                                                    textEditingControllerCheckPassword
                                                                        .text = "";
                                                                  }
                                                                });
                                                              },
                                                              readOnly:
                                                                  checkEditPassword, //ส่วนเช็คว่าพิมได้หรือไม่
                                                              obscureText:
                                                                  true, //เป็นส่วนไว้สำหรับปิดรหัส
                                                              controller:
                                                                  textEditingControllerPassword, //ส่วนที่ไว้รับค่าจากuser
                                                              decoration:
                                                                  InputDecoration(
                                                                      border: InputBorder
                                                                          .none,
                                                                      hintText:
                                                                          //เงื่อนไขเช็ค เมื่อเปิดหน้านี้มา จะแสดง เป็น **** ก่อน เมื่อกดIcon edit จะเป็นคำว่าpasswod
                                                                          checkEditPassword
                                                                              ? '********'
                                                                              : 'Password', //ค่า password ปัจุบันก่อนแก้ไข

                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          10,
                                                                          14.2,
                                                                          0,
                                                                          16)),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20,
                                                                            13,
                                                                            20,
                                                                            13),
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                            10),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            10),
                                                                  ), // กำหนดความโค้งของมุมปุ่ม
                                                                ),

                                                                textStyle: TextStyle(
                                                                    fontSize:
                                                                        15), // เปลี่ยนสีปุ่มเป็นสีแดง
                                                              ),
                                                              onPressed: () {
                                                                setState(() {
                                                                  //เงื่อนไขเช็ค เมื่อกดปุ่ม Icon ทำให้ กลับค่า true->false false->true เพื่อใช้เช็คว่าแก้ไขได้หรือไม่
                                                                  checkEditPassword =
                                                                      !checkEditPassword;
                                                                });
                                                              },
                                                              child: InkWell(
                                                                onTap: () {
                                                                  // เมื่อไอคอนถูกแตะ
                                                                  setState(() {
                                                                    //เงื่อนไขเช็ค เมื่อกดปุ่ม Icon ทำให้ กลับค่า true->false false->true เพื่อใช้เช็คว่าแก้ไขได้หรือไม่
                                                                    checkEditPassword =
                                                                        !checkEditPassword;
                                                                  });
                                                                },
                                                                child: Icon(
                                                                  Icons.edit,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                              )),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Visibility(
                                                    visible: !checkEditPassword,
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(20,
                                                                      0, 0, 0),
                                                          child: Row(
                                                            children: [
                                                              Column(
                                                                children: [
                                                                  Text(
                                                                    "ยืนยันรหัสผ่าน",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Kanit',
                                                                        fontSize:
                                                                            20),
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 0, 0),
                                                          child: Row(
                                                            children: [
                                                              Column(
                                                                children: [
                                                                  Container(
                                                                    margin: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            10,
                                                                            0,
                                                                            10),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(10),
                                                                        bottomLeft:
                                                                            Radius.circular(10),
                                                                      ),
                                                                      color: Color(
                                                                          0XFFD9D9D9),
                                                                    ),
                                                                    width: 220,
                                                                    child:
                                                                        TextFormField(
                                                                      validator:
                                                                          (value) {},
                                                                      onChanged:
                                                                          (value) {
                                                                        setState(
                                                                            () {
                                                                          if (textEditingControllerPassword.text !=
                                                                              textEditingControllerPassword2.text) {
                                                                            textEditingControllerCheckPassword.text =
                                                                                "* รหัสผ่านไม่ถูกต้อง";
                                                                          } else {
                                                                            textEditingControllerCheckPassword.text =
                                                                                "";
                                                                          }
                                                                        });
                                                                      },
                                                                      readOnly:
                                                                          checkEditPassword2, //ส่วนเช็คว่าพิมได้หรือไม่
                                                                      obscureText:
                                                                          true, //เป็นส่วนไว้สำหรับปิดรหัส
                                                                      controller:
                                                                          textEditingControllerPassword2, //ส่วนที่ไว้รับค่าจากuser
                                                                      decoration: InputDecoration(
                                                                          border: InputBorder.none,
                                                                          hintText:
                                                                              //เงื่อนไขเช็ค เมื่อเปิดหน้านี้มา จะแสดง เป็น **** ก่อน เมื่อกดIcon edit จะเป็นคำว่าpasswod
                                                                              checkEditPassword2 ? '********' : 'Password', //ค่า password ปัจุบันก่อนแก้ไข

                                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(10, 14.2, 0, 16)),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                children: [
                                                                  ElevatedButton(
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        backgroundColor:
                                                                            Colors.white,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20,
                                                                            13,
                                                                            20,
                                                                            13),
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            topRight:
                                                                                Radius.circular(10),
                                                                            bottomRight:
                                                                                Radius.circular(10),
                                                                          ), // กำหนดความโค้งของมุมปุ่ม
                                                                        ),

                                                                        textStyle:
                                                                            TextStyle(fontSize: 15), // เปลี่ยนสีปุ่มเป็นสีแดง
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          //เงื่อนไขเช็ค เมื่อกดปุ่ม Icon ทำให้ กลับค่า true->false false->true เพื่อใช้เช็คว่าแก้ไขได้หรือไม่
                                                                          checkEditPassword2 =
                                                                              !checkEditPassword2;
                                                                        });
                                                                      },
                                                                      child:
                                                                          InkWell(
                                                                        onTap:
                                                                            () {
                                                                          // เมื่อไอคอนถูกแตะ
                                                                          setState(
                                                                              () {
                                                                            //เงื่อนไขเช็ค เมื่อกดปุ่ม Icon ทำให้ กลับค่า true->false false->true เพื่อใช้เช็คว่าแก้ไขได้หรือไม่
                                                                            checkEditPassword2 =
                                                                                !checkEditPassword2;
                                                                          });
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .edit,
                                                                          color:
                                                                              Colors.grey,
                                                                        ),
                                                                      )),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    )),
                                                Visibility(
                                                    visible:
                                                        textEditingControllerPassword
                                                                .text !=
                                                            textEditingControllerPassword2
                                                                .text,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20, 0, 0, 0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            textEditingControllerCheckPassword
                                                                .text,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Kanit',
                                                                fontSize: 17,
                                                                color:
                                                                    Colors.red),
                                                          )
                                                        ],
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 30, 0, 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xFF4FCCBD),
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30, 13, 30, 13),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  15), // กำหนดความโค้งของมุมปุ่ม
                                            ),

                                            textStyle: TextStyle(
                                                fontSize:
                                                    15), // เปลี่ยนสีปุ่มเป็นสีแดง
                                          ),
                                          onPressed: () {
                                            // รหัสที่ต้องการให้ทำเมื่อปุ่มถูกกด
                                            if (textEditingControllerPassword
                                                    .text !=
                                                textEditingControllerPassword2
                                                    .text) {
                                              _showAlertDialogsErrorSaveData(
                                                  context);
                                            } else {
                                              _showAlertDialogsSaveData(
                                                  context);
                                            }
                                          },
                                          child: Text(
                                            'บันทึกข้อมูล',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Kanit',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 20, 50),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (textEditingControllerPassword
                                                        .text !=
                                                    textEditingControllerPasswordOriginal ||
                                                textEditingControllerPassword2
                                                        .text !=
                                                    textEditingControllerPassword2Original ||
                                                textEditingControllerEmail
                                                        .text !=
                                                    textEditingControllerEmailOriginal ||
                                                textEditingControllerUsername
                                                        .text !=
                                                    textEditingControllerUsernameOriginal) {
                                              _showAlertDialogsErrorSaveData(
                                                  context);
                                            } else {
                                              Navigator.pop(context);
                                            }
                                          },
                                          child: Text(
                                            "กลับสู่หน้าหลัก",
                                            style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 20,
                                              fontFamily: 'Kanit',
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
                ),
              )),
    );
  }
}
