import 'package:get/get.dart';
import 'package:gold_calculation/model/res/routes/name_routes.dart';

class SplashController extends GetxController{

 splash() async{
   Future.delayed(Duration(seconds: 3)).then((value){
     Get.offAllNamed(RoutesName.dashboard);
   });
 }

 @override
  void onInit() {
   splash();
    super.onInit();
  }

}