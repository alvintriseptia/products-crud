import 'package:get/get.dart';
import 'package:products_crud/repositories/models/models.dart';

class ProductDetailController extends GetxController {
  final Rxn<ProductModel> product = Rxn<ProductModel>();
  @override
  void onInit() {
    super.onInit();
    final ProductModel productArgument = Get.arguments;
    product.value = productArgument;
    update();
  }
}
