import 'package:flutter/material.dart';

class PredictionDialog {
  static void show(BuildContext context, String predictionText) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Prediction Text"),
          content: Text(predictionText),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Close the current AlertDialog
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
