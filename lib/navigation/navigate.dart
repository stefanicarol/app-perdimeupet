import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/sign_in_page.dart';
import '../pages/welcome_page.dart';

class Navigate {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => WelcomePage(),
    '/sign-in': (context) => SignInPage(),
    '/home': (context) => HomePage()
  };
}
