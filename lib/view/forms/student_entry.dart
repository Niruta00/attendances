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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.studentData != null) {
      StudentData data = widget.studentData!;
      _nameController.text = data.studentName;
      _rollController.text = data.rollNo.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    StudentViewModel studentViewModel = Provider.of<StudentViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Student Form"),
        ),
        body: Consumer<StudentViewModel>(
          builder: (_, homeViewModel, __) {
            return SingleChildScrollView(
                child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    label: "Enter student Name",
                    controller: _nameController,
                  ),
                  CustomTextField(
                    label: "Enter student roll no.",
                    controller: _rollController,
                    keyboardType: TextInputType.number,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      StudentCompanion data = StudentCompanion(
                        studentName: d.Value(_nameController.text),
                        rollNo: d.Value(int.parse(_rollController.text)),
                        collegeId: d.Value(widget.collegeId ??
                            0), // Provide a default value or handle accordingly
                      );

                      widget.studentData == null
                          ? studentViewModel.addStudent(data)
                          : studentViewModel.updateStudent(data);

                      Navigator.pop(context);
                    },
                    child: Text(widget.studentData == null ? "Save" : "Update"),
                  )
                ],
              ),
            ));
          },
        ));
  }
}
