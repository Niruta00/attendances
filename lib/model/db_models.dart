import 'package:drift/drift.dart';

class CollegeData extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get collegeName => text().withLength(min: 1, max: 255)();
  TextColumn get facultyName => text().withLength(min: 1, max: 255)();
  TextColumn get semesterName => text().withLength(min: 1, max: 255)();
  TextColumn get subjectName => text().nullable()();

}

class Student extends Table {
  IntColumn get collegeId => integer().references(CollegeData, #id)();
  // IntColumn get id => integer().autoIncrement()();
  IntColumn get rollNo => integer().autoIncrement()();
  TextColumn get studentName => text().withLength(min: 1, max: 255)();
}

class Attendance extends Table {
  // IntColumn get studentId => integer().references(Student, #id)();
  DateTimeColumn get attendanceDate =>
      dateTime().nullable().clientDefault(() => DateTime.now())();
  BoolColumn get isPresent =>
      boolean().nullable().withDefault(const Constant(true))();
}
