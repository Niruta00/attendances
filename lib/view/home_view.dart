import 'package:attendu/model/app_db.dart';
import 'package:attendu/model/db_models.dart';
import 'package:attendu/utils/widgets/home_card.dart';
import 'package:attendu/view/forms/college_data.dart';
import 'package:attendu/view_model/college_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // HomeViewModel homeViewModel =
    //     Provider.of<HomeViewModel>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Admin Detail"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
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
