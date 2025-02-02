import 'package:get/get.dart';

import '../../../view_model/dashboard/dashboard_controller.dart';

class DashboardBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}