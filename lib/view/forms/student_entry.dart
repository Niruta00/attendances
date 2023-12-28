import 'package:attendu/core/themes/app_color.dart';
import 'package:attendu/model/app_db.dart';
import 'package:attendu/view/widgets/custom_text_field.dart';
import 'package:drift/drift.dart' as d;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/student_view_model.dart';

class StudentEntryForm extends StatefulWidget {
  const StudentEntryForm({
    super.key,
    this.studentData,
    this.collegeId,
  });
  final StudentData? studentData;
  final int? collegeId;

  @override
  State<StudentEntryForm> createState() => _StudentEntryFormState();
}

class _StudentEntryFormState extends State<StudentEntryForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _rollController = TextEditingController();
  final TextEditingController _collegeIdController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.studentData != null) {
      StudentData data = widget.studentData!;
      _nameController.text = data.studentName;
      _rollController.text = data.rollNo.toString();
      _collegeIdController.text = data.collegeId.toString();

    }
  }

  @override
  Widget build(BuildContext context) {
    StudentViewModel studentViewModel = Provider.of<StudentViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text("Student Form"),
        ),
        body: Consumer<StudentViewModel>(
          builder: (_, homeViewModel, __) {
            return SingleChildScrollView(
                child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                             CustomTextField(
                          label: "Enter college id",
                          controller: _collegeIdController,
                          keyboardType: TextInputType.number,

                        ),
                        CustomTextField(
                          label: "Enter student Name",
                          controller: _nameController,
                        ),
                        CustomTextField(
                          label: "Enter student roll no.",
                          controller: _rollController,
                          keyboardType: TextInputType.number,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 45,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                StudentCompanion data = StudentCompanion(
                                  studentName: d.Value(_nameController.text),
                                  rollNo:
                                      d.Value(int.parse(_rollController.text)),
                                  collegeId: d.Value(widget.collegeId ??
                                      0), // Provide a default value or handle accordingly
                                );

                                widget.studentData == null
                                    ? studentViewModel.addStudent(data)
                                    : studentViewModel.updateStudent(data);

                                Navigator.pop(context);
                              },
                              child: Text(
                                widget.studentData == null ? "Save" : "Update",
                                style: TextStyle(color: AppColors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ));
          },
        ));
  }
}
