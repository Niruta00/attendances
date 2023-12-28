import 'package:logger/logger.dart';

import '../locator.dart';
import '../model/app_db.dart';

class CollegeDataRepo {
  AppDb db = locator.get<AppDb>();

  addCollegeData(CollegeDataCompanion collegeData) async {
    print(" Add data called");
    await db.into(db.collegeData).insert(collegeData).then((value) {
      Logger().log(Level.info, "Successfully Inserted College Data");
    }).onError((error, stackTrace) {
      Logger().log(Level.error, "Unable to add data because of $error");
    });
  }

  updateCollegeData(CollegeDataCompanion collegeData) async {
    return await db.update(db.collegeData).replace(collegeData).then((value) {
      Logger().log(Level.info, "Successfully Updated College Data");
    }).onError((error, stackTrace) {
      Logger().log(Level.error, "Unable to update data because of $error");
    });
  }

  deleteCollegeData(int id) async {
    return await (db.delete(db.collegeData)..where((t) => t.id.equals(id)))
        .go()
        .then((value) {
      Logger().log(Level.info, "Successfully Delete College Data");
    }).onError((error, stackTrace) {
      Logger().log(Level.error, "Unable to delete data because of $error");
    });
  }

  Future<List<CollegeDataData>> fetchCollegeData() async {
    try {
      return await db.select(db.collegeData).get();
    } on Error catch (e, s) {
      print(" the error is $e and strack tarce is $s");
      return [];
    }
  }

   fetchCollegeDataById(int id) async {
    try {
      return await (db.select(db.collegeData)..where((t) => t.id.equals(id)))
          .getSingle();
    } catch (e) {
     
      print("Unable to get because of $e");
    }

    //     .then((value) {
    //   Logger().log(Level.info, "Successfully fetched College Data");
    // }).onError((error, stackTrace) {
    //   Logger().log(Level.error, "Unable to fetch data because of $error");
    // });
  }
}
