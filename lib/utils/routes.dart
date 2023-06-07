

import 'package:get/get.dart';
import 'package:webangle/screens/Dashboard.dart';
import 'package:webangle/screens/Splash.dart';
import 'package:webangle/screens/job_details.dart';
import 'package:webangle/screens/search.dart';
/// Routes name to directly navigate the route by its name
class Routes {
  static String splash = '/splash';
  static String Dashboard = '/dashboard';
  static String search = '/search';
}

/// Add this list variable into your GetMaterialApp as the value of getPages parameter.
/// You can get the reference to the above GetMaterialApp code.
final getPages = [
GetPage(
name: Routes.splash,
page: () =>  Splash(),
),
  GetPage(
    name: Routes.Dashboard,
    page: () =>  Dashboard(),
  ),
  GetPage(
    name: Routes.search,
    page: () =>  search(),
  ),
];