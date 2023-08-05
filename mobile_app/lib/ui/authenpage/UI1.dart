import 'package:flutter/material.dart';

class positioned1 extends StatelessWidget {
  final String description;

  positioned1({
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Padding(
      padding: EdgeInsetsDirectional.fromSTEB(50, 60, 50, 0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Card(
                      child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 30, 10, 60),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              description,
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
