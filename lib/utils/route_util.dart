import 'package:flutter/material.dart';
import 'package:karmalab_assignment/views/authentication/forgot/forgot_password.dart';
import 'package:karmalab_assignment/views/authentication/login/login_view.dart';
import 'package:karmalab_assignment/views/authentication/new_password/new_password.dart';
import 'package:karmalab_assignment/views/authentication/select_auth/select_auth_view.dart';
import 'package:karmalab_assignment/views/authentication/siginup/signup_view.dart';
import 'package:karmalab_assignment/views/authentication/verification/verification_view.dart';
import 'package:karmalab_assignment/views/home/home_view.dart';

import '../services/auth_service.dart';

class RouteUtil {




  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {

    case SelectAuthView.routeName:
        return MaterialPageRoute(builder: (context) => const SelectAuthView());
      case SignUpView.routeName:
        return MaterialPageRoute(builder: (context) => SignUpView());
      case LoginView.routeName:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case ForgotPassWord.routeName:
        return MaterialPageRoute(builder: (context) => const ForgotPassWord());
      case VerificationView.routeName:
        return MaterialPageRoute(
            builder: (context) => const VerificationView());
      case HomeView.routeName:
        return MaterialPageRoute(builder: (context) => HomeView());
      case NewPassWordView.routeName:
        return MaterialPageRoute(builder: (context) => const NewPassWordView());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
