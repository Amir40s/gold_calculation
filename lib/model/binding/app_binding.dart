import 'package:get/get.dart';
import 'package:gold_calculation/view_model/dashboard/dashboard_controller.dart';
import 'package:gold_calculation/view_model/splash/splash_controller.dart';

class AppBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => DashboardController());
  }

}