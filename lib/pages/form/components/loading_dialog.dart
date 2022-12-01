import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future loadingDialog() {
  return showDialog(
    context: Get.context!,
    barrierDismissible: false,
    builder: (_) => const Dialog(
      backgroundColor: Colors.transparent,
      child: Center(child: CircularProgressIndicator()),
    ),
  );
}
