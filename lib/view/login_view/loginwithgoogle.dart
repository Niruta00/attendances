import 'package:attendu/core/const/asset_path.dart';
import 'package:attendu/core/routes/routes.dart';
import 'package:attendu/core/themes/app_color.dart';
import 'package:attendu/services/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginwithGoogle extends StatefulWidget {
  const LoginwithGoogle({Key? key}) : super(key: key);

  @override
  State<LoginwithGoogle> createState() => _LoginwithGoogleState();
}

class _LoginwithGoogleState extends State<LoginwithGoogle> {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      checkIfAlreadyLoggedIn();
    });
  }

  Future<void> checkIfAlreadyLoggedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
    
      Navigator.pushReplacementNamed(context, Routes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AssetsPath.atendu,
                height: 300,
              ),
              Text(
                "Google Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We need to register your Google Account before getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });

                    try {
                      await FirebaseAuthService().logininwithgoogle();

                      if (FirebaseAuth.instance.currentUser != null) {
                        Navigator.pushNamed(context, Routes.home);
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("No user exists"),
                          ),
                        );
                      }
                    } catch (e) {
                      print("Error during Google login: $e");
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Error during login"),
                          content: Text("Please try again."),
                        ),
                      );
                    } finally {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  child: isLoading
                      ? CircularProgressIndicator()
                      : Text(
                          "Login with Google",
                          style: TextStyle(color: Colors.white),
                        ),
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
