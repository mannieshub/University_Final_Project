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
      padding: const EdgeInsets.only(bottom: 10), // Adjust bottom padding
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Color(0xFF4FCCBD),
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
                  width: 50,
                  height: 50,
                ),
                const SizedBox(width: 10), // Add spacing between image and text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message1,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        message2,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.5,
                          fontFamily: 'Kanit',
                        ),
                      ),
                      const SizedBox(
                          height: 5), // Add spacing between text and link
                      Text(
                        "คลิกเพื่อดูรายละเอียด",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.5,
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
    );
  }
}
