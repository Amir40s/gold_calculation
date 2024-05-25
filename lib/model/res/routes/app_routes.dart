import 'package:get/get.dart';
import 'package:gold_calculation/model/binding/dashboard/dashboard_binding.dart';
import 'package:gold_calculation/model/binding/splash/splash_binding.dart';
import 'package:gold_calculation/model/res/routes/name_routes.dart';
import 'package:gold_calculation/view/dashboard/components/home_screen.dart';
import 'package:gold_calculation/view/dashboard/dashboard_screen.dart';
import 'package:gold_calculation/view/splash/splash_screen.dart';

class AppRoutes{
  static final routes = [
    GetPage(
        name: RoutesName.splashScreen,
        page: ()=> SplashScreen(),
        binding: SplashBinding()
    ),
    GetPage(
        name: RoutesName.dashboard,
        page: ()=> HomeScreen(),
        binding: DashboardBinding()
    )
  ];
}