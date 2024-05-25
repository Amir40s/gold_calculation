import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_calculation/model/res/widgets/app_text_field.dart';
import 'package:gold_calculation/model/res/widgets/next_button.dart';
import 'package:gold_calculation/model/res/widgets/table_field_wodget.dart';
import 'package:gold_calculation/model/res/widgets/text_widget.dart';
import 'package:gold_calculation/view/dashboard/components/head_design.dart';
import 'package:gold_calculation/view/dashboard/components/input_table_design.dart';
import 'package:gold_calculation/view/dashboard/components/total_table_design.dart';
import 'package:gold_calculation/view/dashboard/pdf/pdf_design_screen.dart';
import 'package:gold_calculation/view_model/dashboard/dashboard_controller.dart';
import '../../../constant.dart';
import '../../../model/controller/image_controller.dart';

class HomeScreen extends GetView<DashboardController> {
  final String? mt;
  HomeScreen({super.key, this.mt});

  TextEditingController editingController = TextEditingController();
  final CameraController _cameraController = Get.put(CameraController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (dashController) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: appColor,
          centerTitle: true,
          title: const TextWidget(
            text: "Gold/Platinum/Silver Buying",
            size: 18.0,
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadDesign(
                    goldPrice: dashController.goldSpotPrice.toDouble(),
                    platinumPrice: dashController.platinumSpotPrice.toDouble(),
                    silverPrice: dashController.silverSpotPrice.toDouble(),
                  ),
                  TotalTableDesign(firstText: 'Total Own Customer', secondText: dashController.totalAmount.toStringAsFixed(2),),
                  SizedBox(height: 20.0,),
                  InputTableDesign(),

                 // TotalTableDesign(firstText: '', secondText: '',),

                  TableFieldWodget(
                    press: () {
                      Get.bottomSheet(bottomSheet(dashController, 10));
                    },
                    firstTest: "10K",
                    totalPayout:
                        dashController.totalPayout10X.toStringAsFixed(2),
                    inputAmount: dashController.edit10x.toString(),
                  ),
                  TableFieldWodget(
                    press: () {
                      Get.bottomSheet(bottomSheet(dashController, 14));
                    },
                    firstTest: "14K",
                    totalPayout:
                        dashController.totalPayout14X.toStringAsFixed(2),
                    inputAmount: dashController.edit14x.toString(),
                  ),
                  TableFieldWodget(
                    press: () {
                      Get.bottomSheet(bottomSheet(dashController, 18));
                    },
                    firstTest: "18K",
                    totalPayout:
                        dashController.totalPayout18X.toStringAsFixed(2),
                    inputAmount: dashController.edit18x.toString(),
                  ),
                  TableFieldWodget(
                    press: () {
                      Get.bottomSheet(bottomSheet(dashController, 22));
                    },
                    firstTest: "22K",
                    totalPayout:
                        dashController.totalPayout22X.toStringAsFixed(2),
                    inputAmount: dashController.edit22x.toString(),
                  ),
                  TableFieldWodget(
                    press: () {
                      Get.bottomSheet(bottomSheet(dashController, 24));
                    },
                    firstTest: "24K",
                    totalPayout:
                        dashController.totalPayout24X.toStringAsFixed(2),
                    inputAmount: dashController.edit24x.toString(),
                  ),

                  TableFieldWodget(
                    press: () {
                      Get.bottomSheet(bottomSheet(dashController, 30));
                    },
                    firstTest: "Platinum",
                    totalPayout:
                    dashController.platinum.toStringAsFixed(2),
                    inputAmount: dashController.edPlatinum.toString(),
                  ),

                  TableFieldWodget(
                    press: () {
                      Get.bottomSheet(bottomSheet(dashController, 31));
                    },
                    firstTest: "Silver",
                    totalPayout:
                    dashController.silver.toStringAsFixed(2),
                    inputAmount: dashController.edSilver.toString(),
                  ),

                  TableFieldWodget(
                    press: () {
                      Get.bottomSheet(bottomSheet(dashController, 32));
                    },
                    firstTest: "Diamond Misc",
                    totalPayout:
                    dashController.diamondMisc.toStringAsFixed(2),
                    inputAmount: dashController.edDiamondMisc.toString(),
                  ),
                  const SizedBox(height: 20.0,),
                  GestureDetector(
                    onTap: () {
                      _cameraController.getImage();
                    },
                    child: Container(
                      width: Get.width,
                      height: 200.0,
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20.0),
                        // border: Border.all(color: Colors.black,width: 0.9,style: BorderStyle.solid)
                      ),
                      child:   Center(
                        child:  Obx(() {
                          if (_cameraController.imagePath.isEmpty) {
                            return Text('No image selected.');
                          } else {
                            return Image.file(File(_cameraController.imagePath.value));
                          }
                        }),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20.0,),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.to(PdfDesignScreen());
                        },
                        child: Container(
                          width: Get.width,
                          height: 50.0,
                          margin: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(child: Text("Generate PDF")),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                        dashController.clear();
                        _cameraController.imageClear();
                        },
                        child: Container(
                          width: Get.width,
                          height: 50.0,
                          margin: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(child: Text("Clear")),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }

  Widget bottomSheet(DashboardController dashController, int amountk) {
    return Container(
      width: Get.width,
      padding: const  EdgeInsets.all(20.0),
      decoration:const  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))),
      child: Column(
        children: [
          TextWidget(
            text: "Add Amount",
            size: 14.0,
            color: appColor,
            isBold: true,
          ),
         const  SizedBox(
            height: 20.0,
          ),
          AppTextField(
            hintText: "Enter Amount",
            controller: editingController,
            keyboardType: TextInputType.number,
          ),
         const  SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
              onPressed: () {
                if (amountk == 10) {
                  dashController.edit10x.value =
                      editingController.text.toString();
                  dashController.calculateK(
                      double.parse(editingController.text.toString()), 0.417);


                } else if (amountk == 14) {
                  dashController.edit14x.value =
                      editingController.text.toString();
                  dashController.calculates14K(
                      double.parse(editingController.text.toString()));

                } else if (amountk == 18) {
                  dashController.edit18x.value =
                      editingController.text.toString();
                  dashController.calculates18K(
                      double.parse(editingController.text.toString()));

                } else if (amountk == 22) {
                  dashController.edit22x.value =
                      editingController.text.toString();
                  dashController.calculates22K(
                      double.parse(editingController.text.toString()));

                } else if (amountk == 24) {
                  dashController.edit24x.value =
                      editingController.text.toString();
                  dashController.calculates24K(
                      double.parse(editingController.text.toString()));
                } else if (amountk == 30) {
                  dashController.edPlatinum.value =
                      editingController.text.toString();
                  dashController.calculatePlatinum(
                      double.parse(editingController.text.toString()));
                }else if (amountk == 31) {
                  dashController.edSilver.value =
                      editingController.text.toString();
                  dashController.calculateSilver(
                      double.parse(editingController.text.toString()));
                }else if (amountk == 32) {
                  dashController.edDiamondMisc.value =
                      editingController.text.toString();
                  dashController.calculateDiamond(
                      double.parse(editingController.text.toString()));
                }
                dashController.calculateTotalAmount();
                Get.back();
              },
              child: const Text("Calculate"))
        ],
      ),
    );
  }
}
