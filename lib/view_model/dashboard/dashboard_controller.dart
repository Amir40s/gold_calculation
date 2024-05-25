import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class DashboardController extends GetxController {
  RxDouble goldSpotPrice = 2350.0.obs;
  RxDouble platinumSpotPrice = 990.0.obs;
  RxDouble silverSpotPrice = 30.0.obs;
  RxDouble totalPayout10X = 0.0.obs;
  RxDouble totalPayout14X = 0.0.obs;
  RxDouble totalPayout18X = 0.0.obs;
  RxDouble totalPayout22X = 0.0.obs;
  RxDouble totalPayout24X = 0.0.obs;
  RxDouble platinum = 0.0.obs;
  RxDouble silver = 0.0.obs;
  RxDouble diamondMisc = 0.0.obs;
  RxDouble totalAmount = 0.0.obs;

  RxString edit10x = "".obs;
  RxString edit14x = "".obs;
  RxString edit18x = "".obs;
  RxString edit22x = "".obs;
  RxString edit24x = "".obs;
  RxString edPlatinum = "".obs;
  RxString edSilver = "".obs;
  RxString edDiamondMisc = "".obs;


  void calculateTotalAmount(){
    totalAmount.value = totalPayout10X.toDouble() + totalPayout14X.toDouble()
        + totalPayout18X.toDouble() + totalPayout22X.toDouble()
        + totalPayout24X.toDouble() + platinum.toDouble() + silver.toDouble() + diamondMisc.toDouble();
    update();
  }

  void calculateK(double value, double middleValue) {
    double total = 0.0;
    total = ((goldSpotPrice / 31.1) * middleValue * 0.68 * value);
    totalPayout10X.value = total;
    update();
  }

  void clear(){
    totalPayout10X.value = 0.0;
    totalPayout14X.value = 0.0;
    totalPayout18X.value = 0.0;
    totalPayout22X.value = 0.0;
    totalPayout24X.value = 0.0;
    platinum.value = 0.0;
    silver.value = 0.0;
    diamondMisc.value = 0.0;
    totalAmount.value = 0.0;
    edit10x.value = "";
    edit14x.value = "";
    edit18x.value = "";
    edit22x.value = "";
    edit24x.value = "";
    edPlatinum.value = "";
    edSilver.value = "";
    edDiamondMisc.value = "";
    update();
  }

  void calculates14K(double value) {
    double total = 0.0;
    total = ((goldSpotPrice / 31.1) * 0.583 * 0.68 * value);
    totalPayout14X.value = total;
    update();
  }

  void calculates18K(double value) {
    double total = 0.0;
    total = ((goldSpotPrice / 31.1) * 0.75 * 0.68 * value);
    totalPayout18X.value = total;
    update();
  }

  void calculates22K(double value) {
    double total = 0.0;
    total = ((goldSpotPrice / 31.1) * 0.917 * 0.68 * value);
    totalPayout22X.value = total;
    update();
  }

  void calculates24K(double value) {
    double total = 0.0;
    total = ((goldSpotPrice / 31.1) * 0.999 * 0.68 * value);
    totalPayout24X.value = total;
    update();
  }

  void calculatePlatinum(double value) {
    double total = 0.0;
    total = ((platinumSpotPrice / 31.1) * 0.9 * 0.68 * value);
    platinum.value = total;
    update();
  }

  void calculateSilver(double value) {
    double total = 0.0;
    total = ((silverSpotPrice / 31.1) * 0.925 * 0.25 * value);
    silver.value = total;
    update();
  }

  void calculateDiamond(double value) {
    double total = 0.0;
    total = ((silverSpotPrice / 31.1) * 0.999 * 0.68 * value);
    diamondMisc.value = total;
    update();
  }


}
