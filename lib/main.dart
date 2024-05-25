import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_calculation/model/binding/app_binding.dart';
import 'package:gold_calculation/model/res/routes/app_routes.dart';
import 'package:gold_calculation/model/res/routes/name_routes.dart';

import 'constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gold Calculator',
      theme: ThemeData(
        primaryColor: appColor,
        colorScheme: ColorScheme.light(
          primary: appColor,
        ),
        useMaterial3: true,
      ),
     initialBinding: AppBinding(),
     initialRoute: RoutesName.splashScreen,
      getPages: AppRoutes.routes,
    );
  }
}
