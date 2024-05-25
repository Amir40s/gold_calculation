import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gold_calculation/constant.dart';
import 'package:gold_calculation/model/res/widgets/text_widget.dart';

class HeadDesign extends StatelessWidget {
  final double? goldPrice, platinumPrice, silverPrice;
  const HeadDesign(
      {super.key, this.goldPrice, this.platinumPrice, this.silverPrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Table(
        border: TableBorder.all(color: Colors.black, width: 1.0),
        children: [
          TableRow(children: [
            Container(
              color: appColor,
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
              child: TextWidget(
                text: "Gold Price",
                size: 14.0,
                textAlignment: TextAlign.center,
              ),
            ),
            Container(
              color: appColor,
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
              child: TextWidget(
                text: "Platinum Price",
                size: 14.0,
                textAlignment: TextAlign.center,
              ),
            ),
            Container(
              color: appColor,
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
              child: TextWidget(
                text: "Silver Price",
                size: 14.0,
                textAlignment: TextAlign.center,
              ),
            )
          ]),
          TableRow(children: [
            Container(
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
              child: TextWidget(
                text: goldPrice.toString(),
                size: 14.0,
                textAlignment: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
              child: TextWidget(
                text: platinumPrice.toString(),
                size: 14.0,
                textAlignment: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
              child: TextWidget(
                text: silverPrice.toString(),
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
