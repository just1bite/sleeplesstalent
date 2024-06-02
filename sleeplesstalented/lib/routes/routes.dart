import 'package:flutter/material.dart';
import 'package:sleeplesstalented/main_app/home_screen.dart';
import 'package:sleeplesstalented/main_app/main_screen.dart';
import 'package:sleeplesstalented/pages/detail_Screen/detail_screen.dart';
import 'package:sleeplesstalented/pages/get_started_screen/get_started_screen.dart';
import 'package:sleeplesstalented/pages/login_screen/login_screen.dart';
import 'package:sleeplesstalented/pages/news_screen/news_screen.dart';
import 'package:sleeplesstalented/pages/register_screen/register_screen.dart';
import 'package:sleeplesstalented/pages/saved_screen/saved_screen.dart';
import 'package:sleeplesstalented/pages/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String getStarted = '/get_started';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String main = '/main';
  static const String news = '/news';
  static const String saved = '/saved';
  static const String detail = '/detail';
}

Map<String, WidgetBuilder> getAppRoutes() {
  return {
    AppRoutes.splash: (context) => SplashScreen(),
    AppRoutes.getStarted: (context) => GetStartedScreen(),
    AppRoutes.login: (context) => LoginScreen(),
    AppRoutes.register: (context) => RegisterScreen(),
    AppRoutes.home: (context) => HomeScreen(),
    AppRoutes.main: (context) => MainScreen(),
    AppRoutes.news: (context) => NewsScreen(),
    AppRoutes.saved: (context) => SavedScreen(),
    AppRoutes.detail: (context) => DetailScreen(),
  };
}
