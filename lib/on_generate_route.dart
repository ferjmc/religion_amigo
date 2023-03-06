import 'package:flutter/material.dart';
import 'package:religion_amigo/consts.dart';
import 'package:religion_amigo/features/presentation/page/credential/sign_in_page.dart';
import 'package:religion_amigo/features/presentation/page/credential/sign_up_page.dart';

import 'main.dart';

class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case PageConst.editProfilePage:
        {
          return routeBuilder(NoPageFound());
        }
      case PageConst.signInPage:
        {
          return routeBuilder(SignInPage());
        }
      case PageConst.signUpPage:
        {
          return routeBuilder(SignUpPage());
        }
      default:
        {
          NoPageFound();
        }
    }
  }
}

dynamic routeBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
