import 'package:attendu/core/themes/app_color.dart';
import 'package:attendu/model/app_db.dart';
import 'package:attendu/utils/widgets/home_card.dart';
import 'package:attendu/view/forms/college_data.dart';
import 'package:attendu/view_model/college_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  final int? collegeId;
  const HomeView({super.key,  this.collegeId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: const Text("Admin Detail"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            // homeViewModel.switchVisibility();
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => CollegeDataForm()));
          },
          child: const Icon(Icons.add),
        ),
        body: Consumer<HomeViewModel>(
          builder: (_, homeViewModel, __) {
            // homeViewModel.refreshCollegeData();

            List<CollegeDataData> collegeData = homeViewModel.collegeData;

            if (collegeData.isEmpty) {
              return const Center(
                child: Text("Please start by adding college Data"),
              );
            } else {
              return ListView.builder(
                  itemCount: collegeData.length,
                  itemBuilder: (context, index) {
                    return HomeCard(
                      collegeData: collegeData[index],
                    );
                  });
            }
          },
        ));
  }
}
