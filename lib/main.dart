import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:products_crud/crud_app.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const CrudApp());
}
