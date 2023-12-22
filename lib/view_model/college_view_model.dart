import 'package:attendu/model/app_db.dart';
import 'package:attendu/repository/college_data.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel() {
    refreshCollegeData();
  }
  bool _isVisible = false;
  bool get visible => _isVisible;
  List<CollegeDataData> _collegeData = [];
  List<CollegeDataData> get collegeData => _collegeData;
  

  void switchVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  addCollegeData(CollegeDataCompanion collegeDataCompanion) async {
    await CollegeDataRepo().addCollegeData(collegeDataCompanion);
    refreshCollegeData();
  }

  updateCollegeData(CollegeDataCompanion collegeDataCompanion) async {
    await CollegeDataRepo().updateCollegeData(collegeDataCompanion);
    refreshCollegeData();
  }

  deleteCollegedata(int id) async {
    await CollegeDataRepo().deleteCollegeData(id);
    refreshCollegeData();
  }

  fetchCollegeData() async {
    print("Fetch College called");
    _collegeData = await CollegeDataRepo().fetchCollegeData();
    notifyListeners();
  }

 

  refreshCollegeData() async {
    print("Fetch College called");

    _collegeData = await CollegeDataRepo().fetchCollegeData();
    notifyListeners();
  }
  // refreshCollegeDataa() async {
  //   print("Fetch College called");

  //   _collegeData = await CollegeDataRepo().fetchCollegeData();
  //   // notifyListeners();
  // }
}
