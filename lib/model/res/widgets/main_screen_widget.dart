import 'package:flutter/material.dart';
import 'package:gold_calculation/model/res/widgets/text_widget.dart';

import '../../../constant.dart';
import '../constant/app_colors.dart';
class MainScreenWidget extends StatelessWidget {
  final Widget body;
  const MainScreenWidget({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: "Gold/Platinum/Silver Buying",
          color: Colors.black,
          size: 22.0,
        ),
        backgroundColor: appColor,
        centerTitle: true,
      ),
      backgroundColor: AppColors.appBackgroundColor,
      body: body,
    );
  }
}
