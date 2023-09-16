import 'package:flutter/material.dart';

class RobotIcon extends StatelessWidget {
  const RobotIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 41,
      left: 30,
      child: Image(
        image: AssetImage('images/Robot.png'),
      ),
    );
  }
}
