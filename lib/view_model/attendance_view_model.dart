import 'package:flutter/material.dart';

import 'package:attendu/model/app_db.dart';
import 'package:attendu/repository/attendance_data.dart';

class AttendanceViewModel extends ChangeNotifier {
  bool _isPresent = false;
  bool get present => _isPresent;
  int _totalDays = 0;
  int get totalDays => _totalDays;

  final AttendanceRepo _attendanceRepo = AttendanceRepo();

  List<AttendanceData> _attendances = [];
  List<AttendanceData> get attendances => _attendances;

  Future<void> markStudent(AttendanceCompanion attendanceCompanion) async {
    await _attendanceRepo.insertAttendance(attendanceCompanion);
    _isPresent = attendanceCompanion.isPresent.present;
    _totalDays++;
    // notifyListeners();
  }

  Future<void> fetchStudentById(int collegeId) async {
    // Implement logic to fetch student by ID
    // Example: _attendances = await _attendanceRepo.getAttendancesByCollegeId(collegeId);
    // Update the _attendances list based on your actual logic
    // notifyListeners();
  }
}
