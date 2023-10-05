import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/authentication/auth.dart';

class YourWidget extends StatefulWidget {
  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  String percent = "";
  User? user = Auth().currentUser;
  @override
  void initState() {
    super.initState();
    // เรียกใช้ fetchDataFromFirestore ใน initState เพื่อดึงข้อมูลเมื่อหน้าจอโหลด
    fetchDataFromFirestore();
  }

  Future<void> fetchDataFromFirestore() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection('UserRisk')
              .doc(user!.uid)
              .get();

      if (snapshot.exists) {
        // Retrieve data from the snapshot
        final data = snapshot.data();
        if (data != null) {
          // Assuming there is a field called "percent" in your Firestore document
          final fetchedPercent = data['percent'];
          if (fetchedPercent != null) {
            // Update the percent variable with the fetched data
            setState(() {
              percent = fetchedPercent.toString();
            });
          }
        }
      }
    } catch (e) {
      // Handle any errors that occur during the fetch
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App Title'),
      ),
      body: Center(
        child: Text('Percent: $percent'),
      ),
    );
  }
}
