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

void saveStudentDataByIndex(int collegeId, int cardIndex) {
  // Check if the cardIndex is within the bounds of your _studentData list
  if (cardIndex >= 0 && cardIndex < _studentData.length) {
    // Fetch the student data based on the index of the card
    StudentData student = _studentData[cardIndex];

    // Perform any additional logic or save the data as needed
    // For example, you might set the selected student in your ViewModel
    _selectedStudent = student;

    // Notify listeners if needed
    notifyListeners();
  } else {
    print('Invalid card index: $cardIndex');
  }
}


}
