import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get.dart';

import '../../../view_model/dashboard/tabs/tabs_controller.dart';

class TabsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TabControllers>(() => TabControllers());
  }

}