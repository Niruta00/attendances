import 'package:attendu/model/app_db.dart';
import 'package:attendu/utils/widgets/student_card.dart';
import 'package:attendu/view/forms/student_entry.dart';
import 'package:attendu/view_model/student_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentsView extends StatelessWidget {
  const StudentsView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Students View"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => StudentEntryForm()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Consumer<StudentViewModel>(
        builder: (_, studentViewModel, __) {
          return FutureBuilder<List<StudentData>>(
            future: studentViewModel.fetchStudentData(), // Assuming fetchStudentData returns a Future<List<StudentData>>
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text("No student data available."));
              } else {
                List<StudentData> studentData = snapshot.data!;
                return ListView.builder(
                  itemCount: studentData.length,
                  itemBuilder: (context, index) {
                    return StudentCard(
                      studentData: studentData[index],
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}
