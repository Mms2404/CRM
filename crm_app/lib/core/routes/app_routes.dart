import 'package:crm_app/features/auth/presentation/signIn_screen.dart';
import 'package:crm_app/features/auth/presentation/signUp_screen.dart';
import 'package:crm_app/features/auth/presentation/viewOnly_screen.dart';
import 'package:crm_app/features/splash/presentation/splash_screen.dart';
import 'package:flutter/widgets.dart';

class AppRoutes {

  static const String splash = '/';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String viewOnly = '/view-Only';

  static Map<String , WidgetBuilder> routes = {
    splash : (context) => SplashScreen(),
    signIn : (context) => SignupScreen(),
    signUp : (context) => SigninScreen(),
    viewOnly : (context) => ViewonlyScreen()
  };
}