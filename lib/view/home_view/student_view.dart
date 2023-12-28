import 'package:attendu/core/themes/app_color.dart';
import 'package:attendu/model/app_db.dart';
import 'package:attendu/utils/widgets/student_card.dart';
import 'package:attendu/view/forms/student_entry.dart';
import 'package:attendu/view_model/student_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentsView extends StatelessWidget {
  final int? collegeId;

  StudentsView({Key? key, this.collegeId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text("Students View"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
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
            future: studentViewModel.getStudentsByCollegeId(
                collegeId ?? 0), // Using collegeId with a default value of 0
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else {
                List<StudentData> studentData = snapshot.data ?? [];

                if (studentData.isEmpty) {
                  return const Center(
                    child: Text("No students available for this college"),
                  );
                } else {
                  return ListView.builder(
                    itemCount: studentData.length,
                    itemBuilder: (context, index) {
                      return StudentCard(
                        collegeId: collegeId,
                        studentData: studentData[index],
                      );
                    },
                  );
                }
              }
            },
          );
        },
      ),
    );
  }
}
