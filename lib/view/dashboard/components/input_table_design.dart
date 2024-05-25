import 'package:flutter/material.dart';
import 'package:gold_calculation/constant.dart';
import 'package:gold_calculation/model/res/widgets/text_widget.dart';

class InputTableDesign extends StatelessWidget {
  
  const InputTableDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0),
      child: Table(
        border: TableBorder.all(color: Colors.black, width: 1.0),
        children: [
          TableRow(children: [
            Container(
              color: appColor,
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
              child: TextWidget(
                text: "Purity",
                size: 14.0,
                textAlignment: TextAlign.center,
              ),
            ),
            Container(
              color: appColor,
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
              child: TextWidget(
                text: "Weight in Gram",
                size: 14.0,
                textAlignment: TextAlign.center,
              ),
            ),
            Container(
              color: appColor,
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
              child: TextWidget(
                text: "Total Payout",
                size: 14.0,
                textAlignment: TextAlign.center,
              ),
            )
          ])
        ],
      ),
    );
  }
}
