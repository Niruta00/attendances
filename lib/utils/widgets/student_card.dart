import 'package:attendu/core/themes/app_color.dart';
import 'package:attendu/model/app_db.dart';
import 'package:attendu/view/forms/student_entry.dart';
import 'package:attendu/view_model/student_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentCard extends StatefulWidget {
  const StudentCard({Key? key, this.collegeId, this.studentData})
      : super(key: key);
  final StudentData? studentData;
  final int? collegeId;

  @override
  _StudentCardState createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> {
  Color? containerColor;
  bool? isPresent; // Default to null state
  int totalDays = 0;
  @override
  Widget build(BuildContext context) {
    containerColor ??= null; // Initialize to null if not set

    return Consumer<StudentViewModel>(
      builder: (_, studentViewModel, __) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: GestureDetector(
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            studentViewModel.fetchStudentsByCollegeId(
                                widget.studentData!.collegeId);
                            // studentViewModel.fetchCollegeDataById(
                            //     widget.studentData!.collegeId);
                          },
                          child: Text("View Students"),
                        )
                      ],
                    ),
                  ),
                );
              },
              onPanUpdate: (panDetails) {
                // Right swipe
                if (panDetails.delta.dx > 0) {
                  // Handle right swipe if needed
                }

                // Left swipe
                if (panDetails.delta.dx < 0) {
                  studentViewModel
                      .fetchStudentsByCollegeId(widget.studentData!.collegeId);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => StudentEntryForm(),
                    ),
                  );
                  print("Left swipe detected");
                }
              },
              child: Container(
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey),
                  color: containerColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CircleAvatar(
                            backgroundColor: AppColors.primaryColor,
                            child: Text(widget.studentData!.rollNo.toString()),
                          ),
                        ),
                        Text(widget.studentData!.studentName),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          containerColor = Colors.green;
                                          isPresent = true;
                                          totalDays++;
                                        });
                                      },
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          containerColor = Colors.red;
                                          isPresent = false;
                                        });
                                      },
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete,
                                          color: const Color.fromARGB(
                                              255, 232, 194, 191)),
                                      onPressed: () async {
                                        await studentViewModel.deleteStudent(
                                            widget.studentData!.rollNo);
                                        // .deleteStudentdata(collegeData!.id);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 1),
                              Text('Total Days: $totalDays'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
