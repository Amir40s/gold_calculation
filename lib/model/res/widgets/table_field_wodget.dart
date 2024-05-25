import 'package:flutter/material.dart';
import 'package:gold_calculation/constant.dart';
import 'package:gold_calculation/model/res/widgets/text_widget.dart';

class TableFieldWodget extends StatelessWidget {
  final VoidCallback press;
  final String firstTest;
  final String totalPayout, inputAmount;
  const TableFieldWodget(
      {super.key,
      required this.press,
      required this.firstTest,
      required this.totalPayout,
      required this.inputAmount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Table(
        border: TableBorder.all(color: Colors.black, width: 1.0),
        children: [
          TableRow(children: [
            Container(
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
              child: TextWidget(
                text: firstTest,
                size: 14.0,
                textAlignment: TextAlign.center,
              ),
            ),
            GestureDetector(
              onTap: press,
              child: Container(
                color: Colors.grey,
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
                child: TextWidget(
                  text: inputAmount,
                  size: 14.0,
                  textAlignment: TextAlign.center,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
              child: TextWidget(
                text: totalPayout,
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
