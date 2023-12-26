import 'dart:ffi';

import 'package:attendu/core/themes/app_color.dart';
import 'package:attendu/model/app_db.dart';
import 'package:attendu/repository/college_data.dart';
import 'package:attendu/view/home_view/home_view.dart';
import 'package:attendu/view/widgets/custom_text_field.dart';
import 'package:attendu/view_model/college_view_model.dart';
import 'package:drift/drift.dart' as dr;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CollegeDataForm extends StatefulWidget {
  final CollegeDataData? collegeDataData;

  CollegeDataForm({super.key, this.collegeDataData});

  @override
  State<CollegeDataForm> createState() => _CollegeDataFormState();
}

class _CollegeDataFormState extends State<CollegeDataForm> {
  final TextEditingController _collegeNameController = TextEditingController();

  final TextEditingController _facultyController = TextEditingController();

  final TextEditingController _semesterController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.collegeDataData != null) {
      CollegeDataData data = widget.collegeDataData!;

      _collegeNameController.text = data.collegeName;
      _facultyController.text = data.facultyName;
      _semesterController.text = data.semesterName;
      _subjectController.text = data.subjectName!;
    }
  }

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text("College data"),
      ),
      body: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomTextField(
                controller: _collegeNameController,
                hinttext: "Please enter college name",
                label: "College Name",
              ),
              CustomTextField(
                controller: _facultyController,
                hinttext: "Please enter faculty name",
                label: "Faculty  Name",
              ),
              CustomTextField(
                controller: _semesterController,
                hinttext: "Please enter semester name",
                label: "Semester Name",
              ),
              CustomTextField(
                controller: _subjectController,
                hinttext: "Please enter subject  name",
                label: "Subject name",
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      CollegeDataCompanion data = CollegeDataCompanion(
                          collegeName: dr.Value(_collegeNameController.text),
                          facultyName: dr.Value(_facultyController.text),
                          semesterName: dr.Value(_semesterController.text),
                          subjectName: dr.Value(_subjectController.text));

                      widget.collegeDataData == null
                          ? homeViewModel.addCollegeData(data)
                          : homeViewModel.updateCollegeData(data);
                      Navigator.pop(context);
                    },
                    child: Text(
                      widget.collegeDataData == null ? "Save" : "Update",
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
              ),
            ],
          ),
        ),
      )),
    );
  }
}
