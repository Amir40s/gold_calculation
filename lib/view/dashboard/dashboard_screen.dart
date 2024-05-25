import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_calculation/model/res/widgets/text_widget.dart';
import 'package:gold_calculation/view_model/dashboard/dashboard_controller.dart';
import '../../constant.dart';
import '../../view_model/dashboard/tabs/tabs_controller.dart';
import 'components/home_screen.dart';
class DashboardScreen extends StatelessWidget {
   DashboardScreen({super.key});

  final TabControllers tabController = Get.put(TabControllers());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appColor,
          title: TextWidget(text: "Gold/Platinum/Silver Buying					",size: 18.0,),
        ),
        body: Column(
          children: [
            // TabBar(
            //   indicatorSize: TabBarIndicatorSize.tab,
            //   tabs: [
            //     Tab(text: 'Gold'),
            //     Tab(text: 'Platinum'),
            //     Tab(text: 'Silver'),
            //   ],
            //   onTap: (index) {
            //     tabController.changeTab(index);
            //   },
            // ),
            // Expanded(
            //   child: Obx(() {
            //     switch (tabController.currentIndex.value) {
            //       case 0:
            //         return HomeScreen(mt: "1",);
            //       case 1:
            //         return HomeScreen(mt: "2",);
            //       case 2:
            //         return HomeScreen(mt: "3",);
            //       default:
            //         return Container();
            //     }
            //   }
            // ),
            // )
          ],
        ),
      ),
    );
  }
}
