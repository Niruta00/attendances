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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor.withOpacity(0.8),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.only(left: 25, right: 25, top: 95),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AssetsPath.logwithg,
                    height: 300,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Text(
                    "Google Verification",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "We need to register your Google Account before get started!",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuthService().logininwithgoogle();
                        if (FirebaseAuth.instance.currentUser != null) {
                          if (!mounted) return;
                          Navigator.pushNamed(context, Routes.home);
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("No user exist"),
                              ));
                        }
                        // await phoneViewModel.loginWithPhone(context, phone);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AssetsPath.google,
                            height: 30,
                            width: 30,
                          ),
                          SizedBox(width: 10,),
                          Text(
                            "Login with Google",
                            style: TextStyle(color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.arrow_forward,color: Colors.white,),
                          )
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.primaryColor.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
