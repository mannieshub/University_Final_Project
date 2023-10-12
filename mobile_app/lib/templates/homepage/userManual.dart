import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/routes/userManualPage.dart';

class userManualWidget extends StatelessWidget {
  final String imagePath;
  final String text;
  final Color color;

  userManualWidget(
      {required this.imagePath, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the desired page when tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                userManualPage(), // Replace with the destination page
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 7,
              offset: Offset(1, 1), // X and Y offset
            ),
          ],
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: color,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 17.5, 30, 17.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                imagePath,
                                width: 25,
                                height: 25,
                              ),
                            ],
                          ),
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
    );
  }
}
