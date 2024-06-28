//class for naming routes used in the app
import 'package:get/get.dart';

import '../screens/home_page/home_binding.dart';
import '../screens/home_page/home_ui.dart';

class Routes {
  static const String homePage = '/homePage';
  static const String basePage = '/basePage';
}

//configuration for routes used in app
final List<GetPage> appPages = [
  GetPage(
    name: Routes.homePage,
    page: () => const HomePageUi(),
    binding: HomePageBinding(),
  ),
];
