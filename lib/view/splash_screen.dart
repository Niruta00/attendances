import 'package:attendu/view/home_view/home_view.dart';
import 'package:attendu/view/login_view/loginwithgoogle.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatelessWidget {
  Future<bool> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken') != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: checkLoginStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasError || !snapshot.data!) {
              // Navigate to the login page
              return LoginwithGoogle();
            } else {
              // Navigate to the home page
              return HomeView();
            }
          }
        },
      ),
    );
  }
}