import 'package:flutter/material.dart';

double displayWidth(BuildContext context) {
  return MediaQuery.sizeOf(context).width;
}

double displayHeight(BuildContext context) {
  return MediaQuery.sizeOf(context).height;
}

dynamic displaySize(BuildContext context) {
  return MediaQuery.of(context);
}
extension MySnackBar on BuildContext {
  snackBarWidget({
    required String message,
    required BuildContext context,
    int? durationInSeconds,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue.shade400,
        duration: Duration(seconds: durationInSeconds ?? 3),
        content: Text(message),
      ),
    );
  }
}
