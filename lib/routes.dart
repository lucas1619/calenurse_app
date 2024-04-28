import 'package:calenurse_app/pages/login/login.dart';
import 'package:calenurse_app/pages/notifications/notifications.dart';
import 'package:calenurse_app/pages/profile/profile.dart';
import 'package:calenurse_app/pages/register/register.dart';
import 'package:calenurse_app/pages/home/home.dart';
import 'package:calenurse_app/pages/schedule/schedule.dart';
import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> routes = {
  '/login': (BuildContext context) => LoginPage(),
  '/register': (BuildContext context) => SignupPage(),
  '/home': (BuildContext context) => const HomePage(),
  '/schedule': (BuildContext context) => const SchedulePage(),
  '/notifications': (BuildContext context) => const NotificationsPage(),
  '/profile': (BuildContext context) => const ProfilePage(),
};
