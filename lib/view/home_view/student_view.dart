import 'package:flutter/material.dart';
import 'package:attendu/core/themes/app_color.dart';
import 'package:attendu/model/app_db.dart';
import 'package:attendu/utils/appbar/custom_appbar.dart';
import 'package:attendu/utils/widgets/student_card.dart';
import 'package:attendu/view/forms/student_entry.dart';
import 'package:attendu/view_model/student_view_model.dart';
import 'package:provider/provider.dart';

class StudentsView extends StatelessWidget {
  const StudentsView({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: CustomAppbar(), // Use CustomAppbar here
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbar(
              text: "Students View",
            ), // You can have a different text or configuration if needed
            Expanded(
              child: Consumer<StudentViewModel>(
                builder: (_, studentViewModel, __) {
                  return FutureBuilder<List<StudentData>>(
                    future: studentViewModel.fetchStudentData(),
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
            ),
          ],
        ),
      ),
    );
  }
}
