import 'package:flutter/material.dart';

class NextPageButton extends StatelessWidget {
  final String imgPath;
  final String message1;
  final String message2;
  final Widget destination;

  NextPageButton({
    required this.imgPath,
    required this.message1,
    required this.message2,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25), // Shadow color
              offset: Offset(1, 1), // x and y offset
              blurRadius: 2.5, // Blur radius
              spreadRadius: 0, // Spread radius
            ),
          ],
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10), // Rounded corners for the card
          ),
          color: Color(0xFFEBA37A),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => destination),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    imgPath,
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message1,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          message2,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'Kanit',
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          "คลิกเพื่อดูรายละเอียด",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Kanit',
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
