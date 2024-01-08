import 'package:flutter/material.dart';
import '../model/app_db.dart';
import '../repository/student_data.dart';

class StudentViewModel extends ChangeNotifier {
  final StudentDataRepo _studentDataRepo = StudentDataRepo();

  CollegeDataData? _selectedCollege;
  CollegeDataData? get selectedCollege => _selectedCollege;



  List<StudentData> _studentData = [];
  List<StudentData> _studentDataByClz = [];

  List<StudentData> get studentData => _studentData;
  List<StudentData> get studentDataByClz => _studentDataByClz;

  addStudent(StudentCompanion studentCompanion) async {
    print(studentCompanion);
    await StudentDataRepo().addStudentData(studentCompanion);
    notifyListeners();
  }

  updateStudent(StudentCompanion studentCompanion) async {
    await StudentDataRepo().updateStudentData(studentCompanion);
    notifyListeners();
  }

  deleteStudent(int id) async {
    await StudentDataRepo().deleteStudentData(id);
    notifyListeners();
  }



  fetchStudentById(int collegeId) async {
    _selectedCollege = await StudentDataRepo().fetchStudentDataById(collegeId);
    notifyListeners();
  }



  Future<List<StudentData>> fetchStudentData() async {
    try {
      return await _studentDataRepo.fetchStudentData();
    } catch (e) {
      print("Error fetching student data: $e");
      return [];
    }
  }


}
