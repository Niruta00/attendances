import 'package:attendu/core/const/asset_path.dart';
import 'package:attendu/core/routes/routes.dart';
import 'package:attendu/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpView extends StatefulWidget {
  const OtpView({Key? key}) : super(key: key);

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  TextEditingController countrycode = TextEditingController();
  var phone = "";

  @override
  Widget build(BuildContext context) {
    // final phoneviewModel = Provider.of<PhoneLoginViewModel>(context);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(),
      ),
    );

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
                "We need to register your phone before getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Pinput(
                length: 6,
                // pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    // phoneviewModel.verifyOTP(context);
                    // Navigator.pushNamed(context, Routes.home);
                  },
                  child: Text(
                    "Verify Phone Number",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.login);
                    },
                    child: Text(
                      "Edit Phone Number?",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
