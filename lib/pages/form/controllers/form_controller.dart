import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
}
