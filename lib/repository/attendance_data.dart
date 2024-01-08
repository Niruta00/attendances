import 'package:attendu/locator.dart';
import 'package:attendu/model/app_db.dart';
import 'package:logger/logger.dart';

class AttendanceRepo{
  AppDb db= locator.get<AppDb>();

  insertAttendance(AttendanceCompanion attendanceCompanion)async{
    await db.into(db.attendance).insert(attendanceCompanion).then((value) => {
      Logger().log(Level.info, "sucessfully added data")
    }).onError((error, stackTrace) => {
      Logger().log(Level.error, "error")
    });
  }
}