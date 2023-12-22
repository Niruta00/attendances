import 'package:attendu/repository/college_data.dart';
import 'package:flutter/material.dart';
import '../model/app_db.dart';
import '../repository/student_data.dart';

class StudentViewModel extends ChangeNotifier {
  final StudentDataRepo _studentDataRepo = StudentDataRepo();

  CollegeDataData? _selectedCollege;
  CollegeDataData? get selectedCollege => _selectedCollege;

  StudentData? _selectedStudent;
  StudentData? get selectedStudent => _selectedStudent;

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

  fetchAllStudents() async {
    _studentData = await StudentDataRepo().fetchStudentData();
    notifyListeners();
  }

  fetchStudentById(int collegeId) async {
    _selectedCollege = await StudentDataRepo().fetchStudentDataById(collegeId);
    notifyListeners();
  }

  fetchStudentsByCollegeId(int collegeId) async {
    return await StudentDataRepo().fetchStudentsByCollegeId(collegeId);
  }

  fetchCollegeDataById(int id) async {
    _selectedCollege =
        await CollegeDataRepo().fetchCollegeDataById(id) as CollegeDataData;
    print(_selectedCollege);
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
