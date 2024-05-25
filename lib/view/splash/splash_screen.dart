import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:gold_calculation/constant.dart';
import 'package:gold_calculation/view_model/splash/splash_controller.dart';

import '../../model/res/constant/app_assets.dart';
class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});

  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    var size = Get.width / 2.2;
    return Scaffold(
      backgroundColor: appColor,
      body: Center(
        child: Container(
          width: size,
            height: size,
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size / 2),
              color: Colors.white
            ),
            child: Image.asset(
              AppAssets.logoImage,
              width: 90.0,
              height: 90.0,
              )
        ),
      ),
    );
  }
}
