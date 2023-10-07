import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signOutWidget extends StatelessWidget {
  final String imagePath;
  final String text;
  final Color color;

  signOutWidget(
      {required this.imagePath, required this.text, required this.color});

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      signOut();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(15), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.25),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(1, 1), // X and Y offset
                          ),
                        ],
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Color(0xFFFF4D4D),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30, 17.5, 30, 17.5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              'images/Icon_Exit.png',
                                              width: 25,
                                              height: 25,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );

    // return Column(
    //   children: [
    //     Padding(
    //       padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
    //       child: Column(
    //         children: [
    //           GestureDetector(
    //             onTap: () {
    //               signOut();
    //             },
    //             child: ClipRRect(
    //               borderRadius: BorderRadius.circular(25),
    //               child: Card(
    //                 shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(15), // เพิ่มเส้นขอบ
    //                 ),
    //                 color: color,
    //                 child: Column(
    //                   children: [
    //                     Padding(
    //                       padding:
    //                           EdgeInsetsDirectional.fromSTEB(6, 7.5, 6, 7.5),
    //                       child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Padding(
    //                             padding:
    //                                 EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
    //                             child: Column(
    //                               children: [
    //                                 Row(
    //                                   children: [
    //                                     Image.asset(
    //                                       imagePath, // Specify the image path here
    //                                       width: 25,
    //                                       height: 45,
    //                                     ),
    //                                     Padding(
    //                                       padding:
    //                                           EdgeInsetsDirectional.fromSTEB(
    //                                               10, 0, 5, 0),
    //                                       child: Text(
    //                                         text, // Specify the text here
    //                                         style: TextStyle(
    //                                           fontSize: 13,
    //                                           fontFamily: 'Kanit',
    //                                         ),
    //                                       ),
    //                                     )
    //                                   ],
    //                                 )
    //                               ],
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }
}
