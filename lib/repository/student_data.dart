import 'package:logger/logger.dart';

import '../locator.dart';
import '../model/app_db.dart';

class StudentDataRepo {
  AppDb db = locator.get<AppDb>();

addStudentData(StudentCompanion studentData) async {
  print(" Add data called");

  // Check if the collegeId is provided
  if (studentData.collegeId.present) {
    await db.into(db.student).insert(studentData).then((value) {
      Logger().log(Level.info, "Successfully Inserted Student Data");
    }).onError((error, stackTrace) {
      Logger().log(Level.error, "Unable to add data because of $error");
    });
  } else {
    Logger().log(Level.error, "Unable to add data because collegeId is not provided");
  }
}


  updateStudentData(StudentCompanion studentData) async {
    return await db.update(db.student).replace(studentData).then((value) {
      Logger().log(Level.info, "Successfully Updated College Data");
    }).onError((error, stackTrace) {
      Logger().log(Level.error, "Unable to update data because of $error");
    });
  }

  deleteStudentData(int id) async {
    return await (db.delete(db.student)..where((t) => t.rollNo .equals(id)))
        .go()
        .then((value) {
      Logger().log(Level.info, "Successfully Delete College Data");
    }).onError((error, stackTrace) {
      Logger().log(Level.error, "Unable to delete data because of $error");
    });
  }

  Future<List<StudentData>> fetchStudentData() async {
    try {
      return await db.select(db.student).get();
    } on Error catch (e, s) {
      print(" the error is $e and strack tarce is $s");
      return [];
    }
  }

  Future<List<StudentData>> fetchStudentsByCollegeId(int collegeId) async {
    try {
      return await (db.select(db.student)
            ..where((t) => t.collegeId.equals(collegeId)))
          .get();
    } catch (e) {
      print("Unable to get students by college Id because of $e");
      return [];
    }
  }

  fetchStudentDataById(int id) async {
    try {
      return await (db.select(db.student)..where((t) => t.rollNo.equals(id)))
          .getSingle();
    } catch (e) {
      print("Unable to get because of $e");
    }
  }
}
