import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:walking_world/MVC/Utils/AppServices/GetRouteNames.dart';
import 'package:walking_world/MVC/Views/Auth/LoginScreen.dart';
import 'package:walking_world/MVC/Views/Auth/ProfileSetup.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: GetRouteName.Loginscreen,
      transition: Transition.rightToLeft,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: GetRouteName.Profilesetup,
      transition: Transition.rightToLeft,
      page: () =>  ProfileSetupScreen(),
    ),
  ];
}
