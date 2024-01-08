import 'package:attendu/utils/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:attendu/core/themes/app_color.dart';
import 'package:attendu/model/app_db.dart';
import 'package:attendu/utils/widgets/home_card.dart';
import 'package:attendu/view/forms/college_data.dart';
import 'package:attendu/view_model/college_view_model.dart';
// import 'package:attendu/utils/widgets/custom_appbar.dart'; // Import your custom appbar file
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: AppColors.primaryColor,
        //   title: const Text("Admin Detail"),
        //   centerTitle: true,
        // ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => CollegeDataForm()));
          },
          child: const Icon(Icons.add),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbar(text: "Home View"),
            Expanded(
              child: Consumer<HomeViewModel>(
                builder: (_, homeViewModel, __) {
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
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
