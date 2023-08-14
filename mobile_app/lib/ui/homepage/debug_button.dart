import 'package:flutter/material.dart';

class debugButton extends StatelessWidget {
  final String msg;
  final Widget destination;

  debugButton({required this.msg, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => destination,
              ),
            );
            // รหัสที่ต้องการให้ทำเมื่อปุ่มถูกแตะหรือกด
          },
          child: Text(msg),
        ),
      ],
    );
  }
}
