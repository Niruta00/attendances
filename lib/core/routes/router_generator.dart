import 'package:attendu/core/routes/routes.dart';
import 'package:attendu/view/home_view/home_view.dart';
import 'package:attendu/view/home_view/student_view.dart';
import 'package:attendu/view/login_view/login_with_phone.dart';
import 'package:attendu/view/login_view/loginwithgoogle.dart';
import 'package:attendu/view/login_view/otp_verify.dart';

import 'package:flutter/material.dart';

class Routegenerator{
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LoginwithPhone());

      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginwithPhone());
    case Routes.otpVerify:
        return MaterialPageRoute(builder: (_) =>  OtpView());
   case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeView());
           case Routes.student:
        return MaterialPageRoute(builder: (_) => const StudentsView());
            case Routes.loginwithG:
        return MaterialPageRoute(builder: (_) => const LoginwithGoogle());
   default:
        return MaterialPageRoute(builder: (_) => const LoginwithPhone());
    }
  }
}
