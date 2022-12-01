import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_crud/pages/pages.dart';

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
        fontFamily: 'Poppins',
      ),
      initialRoute: ProductListPage.routeName,
      initialBinding: ProductListBindings(),
      getPages: [
        GetPage(
          name: ProductListPage.routeName,
          page: () => const ProductListPage(),
          binding: ProductListBindings(),
        ),
        GetPage(
          name: ProductDetailPage.routeName,
          page: () => const ProductDetailPage(),
          binding: ProductDetailBindings(),
        ),
        GetPage(
          name: FormPage.routeName,
          page: () => const FormPage(),
          binding: FormBindings(),
        ),
      ],
    );
  }
}
