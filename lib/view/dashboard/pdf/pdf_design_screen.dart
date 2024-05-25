import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gold_calculation/view/dashboard/components/input_table_design.dart';
import 'package:gold_calculation/view/dashboard/pdf/preview_pdf.dart';
import 'package:gold_calculation/view_model/dashboard/dashboard_controller.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

import '../../../constant.dart';
import '../../../model/controller/image_controller.dart';
import '../../../model/res/widgets/text_widget.dart';
class PdfDesignScreen extends StatelessWidget {
  const PdfDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                generatePDF(context);
              },
              child: Container(
                width: Get.width,
                height: 50.0,
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(child: Text("Preview")),
              ),
            ),
          ],
        ),
      )
    );
  }

  Future<void> generatePDF(BuildContext context) async {
    final CameraController _cameraController = Get.put(CameraController());
    final DashboardController dashboardController = Get.put(DashboardController());
    final pdf = pw.Document();
    final imageFile = _cameraController.imagePath;
    var companyLogo;
    if (imageFile.isNotEmpty) {
      var image = File(imageFile.toString());
      companyLogo = pw.MemoryImage(image.readAsBytesSync());}

    List<pw.Widget> widgets = [];

    final imageBox = imageFile.isNotEmpty
        ? pw.Center(
      child: pw.Container(
          decoration: const pw.BoxDecoration(
              color: PdfColors.grey),
          height: 200.0,
          width: MediaQuery.sizeOf(context).width,
          child: pw.Center(
            child: pw.Image(companyLogo, fit: pw.BoxFit.cover),
          ))
    )
        : pw.SizedBox();

    final _totalTableDesign = TotalTableDesign(firstText: 'Total Own Customer', secondText: dashboardController.totalAmount.toStringAsFixed(2));




    widgets.add(header(dashboardController));
    widgets.add(_totalTableDesign);
    widgets.add(pw.SizedBox(height: 20.0,));
    widgets.add(InputTableDesign(pdfColor : PdfColors.amber,
        firstText: "Purity",secondText: "Weight in Gram",thirdText: "Total Payout"));
    widgets.add(InputTableDesign(
        pdfColor : PdfColors.white,
        firstText: "10X",
        secondText: dashboardController.edit10x.toString(),
        thirdText: dashboardController.totalPayout10X.toStringAsFixed(2)
    ));
    widgets.add(InputTableDesign(
        pdfColor : PdfColors.white,
        firstText: "14X",
        secondText: dashboardController.edit14x.toString(),
        thirdText: dashboardController.totalPayout14X.toStringAsFixed(2)
    ));
    widgets.add(InputTableDesign(
        pdfColor : PdfColors.white,
        firstText: "18X",
        secondText: dashboardController.edit18x.toString(),
        thirdText: dashboardController.totalPayout18X.toStringAsFixed(2)
    ));
    widgets.add(InputTableDesign(
        pdfColor : PdfColors.white,
        firstText: "22X",
        secondText: dashboardController.edit22x.toString(),
        thirdText: dashboardController.totalPayout22X.toStringAsFixed(2)
    ));
    widgets.add(InputTableDesign(
        pdfColor : PdfColors.white,
        firstText: "24X",
        secondText: dashboardController.edit24x.toString(),
        thirdText: dashboardController.totalPayout24X.toStringAsFixed(2)
    ));
    widgets.add(InputTableDesign(
        pdfColor : PdfColors.white,
        firstText: "Platinum",
        secondText: dashboardController.edPlatinum.toString(),
        thirdText: dashboardController.platinum.toStringAsFixed(2)
    ));
    widgets.add(InputTableDesign(
        pdfColor : PdfColors.white,
        firstText: "Silver",
        secondText: dashboardController.edSilver.toString(),
        thirdText: dashboardController.silver.toStringAsFixed(2)
    ));
    widgets.add(InputTableDesign(
        pdfColor : PdfColors.white,
        firstText: "Diamond Misc",
        secondText: dashboardController.edDiamondMisc.toString(),
        thirdText: dashboardController.diamondMisc.toStringAsFixed(2)
    ));
    widgets.add(pw.SizedBox(height: 20.0));
    widgets.add(imageBox);




    pdf.addPage(pw.MultiPage(
        margin: const pw.EdgeInsets.all(0.0),
        pageFormat: PdfPageFormat.a4,
        build: (context) => widgets));

    Get.to(PreviewPdf(
      doc: pdf,
    ));
  }

  pw.Padding header(DashboardController controller){
    return pw.Padding(
      padding: const pw.EdgeInsets.all(10.0),
      child: pw.Table(
        columnWidths: {
          0 : pw.FlexColumnWidth(1),
          1 : pw.FlexColumnWidth(1),
          2 : pw.FlexColumnWidth(1),
        },
        border: pw.TableBorder.all(color: PdfColors.black, width: 1.0),
        children: [
          pw.TableRow(children: [
            pw.Container(
              color: PdfColors.amber,
              padding: pw.EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
              child: TextWidget(
                text: "Gold Price",
                size: 14.0,
                textAlignment: false, isBold: false, italic: false,
              ),
            ),
            pw.Container(
              color: PdfColors.amber,
              padding: pw.EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
              child: TextWidget(
                text: "Platinum Price",
                size: 14.0,
                textAlignment: false, isBold: false, italic: false,
              ),
            ),
            pw.Container(
              color: PdfColors.amber,
              padding: pw.EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
              child: TextWidget(
                text: "Silver Price",
                size: 14.0,
                textAlignment: false, isBold: false, italic: false,
              ),
            )
          ]),
          pw.TableRow(children: [
            pw.Container(
              padding: pw.EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
              child: TextWidget(
                text: controller.goldSpotPrice.toDouble().toString(),
                size: 14.0,
                textAlignment: false, isBold: false, italic: false,
              ),
            ),
            pw.Container(
              padding: pw.EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
              child: TextWidget(
                text: controller.platinumSpotPrice.toDouble().toString(),
                size: 14.0,
                textAlignment: false, isBold: false, italic: false,
              ),
            ),
            pw.Container(
              padding: pw.EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
              child: TextWidget(
                text: controller.silverSpotPrice.toDouble().toString(),
                size: 14.0,
                textAlignment: false, isBold: false, italic: false,
              ),
            )
          ])
        ],
      ),
    );
  }

  pw.Text TextWidget({required text,required bool textAlignment,required size,required isBold,required italic}){
    return pw.Text(
      text,
      softWrap: true,
      textAlign: textAlignment == true ? pw.TextAlign.start : pw.TextAlign.center,
      style: pw.TextStyle(
          color: PdfColors.black,
          fontSize: size,
          fontWeight: isBold ? pw.FontWeight.bold : pw.FontWeight.normal,
          fontStyle: italic ? pw.FontStyle.italic : pw.FontStyle.normal,
         ),
    );
  }

  pw.Padding TotalTableDesign({required firstText,required secondText}){
    return pw.Padding(
      padding:  pw.EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0),
      child: pw.Table(
        columnWidths: {
          0 : pw.FlexColumnWidth(1),
          1 : pw.FlexColumnWidth(1),
        },
        border: pw.TableBorder.all(color: PdfColors.black, width: 1.0),
        children: [
          pw.TableRow(children: [
            pw.Container(
              color: PdfColors.blueAccent,
              padding: pw.EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
              child: TextWidget(
                text: firstText,
                size: 14.0,
                textAlignment: false, isBold: false, italic: false,
              ),
            ),
            pw.Container(
              padding: pw.EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
              child: TextWidget(
                text: secondText,
                size: 14.0,
                textAlignment: false,isBold: false, italic: false
              ),
            )
          ])
        ],
      ),
    );
  }

  pw.Padding InputTableDesign({pdfColor= PdfColors.white,required firstText,required secondText, required thirdText}){
    return pw.Padding(
      padding: const pw.EdgeInsets.only(left: 10.0,right: 10.0),
      child: pw.Table(
        columnWidths: {
          0 : pw.FlexColumnWidth(1),
          1 : pw.FlexColumnWidth(1),
          2 : pw.FlexColumnWidth(1),
        },
        border: pw.TableBorder.all(color: PdfColors.black, width: 1.0),
        children: [
          pw.TableRow(children: [
            pw.Container(
              color: pdfColor,
              padding: pw.EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
              child: TextWidget(
                text: firstText,
                size: 14.0,
                textAlignment: false, isBold: false, italic: false,
              ),
            ),
            pw.Container(
              color: pdfColor,
              padding: pw.EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
              child: TextWidget(
                text: secondText,
                size: 14.0,
                textAlignment: false, isBold: false, italic: false,
              ),
            ),
            pw.Container(
              color: pdfColor,
              padding: pw.EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
              child: TextWidget(
                text: thirdText,
                size: 14.0,
                textAlignment: false, isBold: false, italic: false,
              ),
            )
          ]),
        ],
      ),
    );
  }
}

