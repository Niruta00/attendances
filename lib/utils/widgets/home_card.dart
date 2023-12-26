import 'package:attendu/core/themes/app_color.dart';
import 'package:attendu/model/app_db.dart';
import 'package:attendu/view/forms/college_data.dart';
import 'package:attendu/view/forms/student_entry.dart';
import 'package:attendu/view/home_view/student_view.dart';
import 'package:attendu/view_model/student_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    this.collegeData,
    // this.index,
  });
  final CollegeDataData? collegeData;
//  final int? index;

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentViewModel>(builder: (_, studentViewModel, __) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                studentViewModel
                                    .fetchStudentsByCollegeId(collegeData!.id);

                                Navigator.pop(context);

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => StudentsView()));
                              },
                              child: Text("View Students"),
                            ),
                          ],
                        ),
                      ));
            },
            onPanUpdate: (details) {
              // right swipt
              if (details.delta.dx > 0) {
                // showDialog(context: context, builder: (context) => AlertDialog(
                //   title: text,
                // ));
              }

              // Swiping in left direction.
              if (details.delta.dx < 0) {
                StudentViewModel studentViewModel =
                    Provider.of<StudentViewModel>(context, listen: false);
                studentViewModel.fetchCollegeDataById(collegeData!.id);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => StudentEntryForm(
                              collegeId: collegeData!.id,
                            )));
                print(" left sweep detected");
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: [
                              TextSpan(
                                text: 'College Name: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: collegeData!.collegeName),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: [
                              TextSpan(
                                text: 'Faculty Name: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: collegeData!.facultyName),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: [
                              TextSpan(
                                text: 'Semester: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: collegeData!.semesterName),
                            ],
                          ),
                        ),
                        if (collegeData!.subjectName != null)
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                                TextSpan(
                                  text: 'Subject: ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: collegeData!.subjectName!),
                              ],
                            ),
                          ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: AppColors.primaryColor),
                          onPressed: () {
                            studentViewModel
                                .fetchCollegeDataById(collegeData!.id);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CollegeDataForm(),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () async {
                            await studentViewModel
                                .deleteStudent(collegeData!.id);
                            studentViewModel.fetchAllStudents();
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
