import 'package:flutter/material.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance Screen"),
      ),
      body: PageView.builder(
          itemCount: 29,
          itemBuilder: (context, index) {
            return Text("Hi");
          }),
    );
  }
}
