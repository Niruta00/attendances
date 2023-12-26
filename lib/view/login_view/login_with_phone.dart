import 'package:attendu/core/const/asset_path.dart';
import 'package:attendu/core/routes/routes.dart';
import 'package:attendu/core/themes/app_color.dart';
import 'package:attendu/services/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginwithPhone extends StatefulWidget {
  const LoginwithPhone({Key? key}) : super(key: key);

  @override
  State<LoginwithPhone> createState() => _LoginwithPhoneState();
}

class _LoginwithPhoneState extends State<LoginwithPhone> {
  var phone = "";

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
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We need to register your phone before get started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        cursorColor: AppColors.primaryColor,
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          phone = value;
                        },
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter phone",
                        ),
                      ),
                    )
                  ],
                ),
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
                  child: Text(
                    "Send the Code",
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
