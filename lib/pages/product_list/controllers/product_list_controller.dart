import 'package:get/get.dart';
import 'package:products_crud/repositories/repositories.dart';

class ProductListController extends GetxController
    with StateMixin<List<ProductModel>> {
  final ProductProvider productProvider;

  ProductListController({required this.productProvider});

  @override
  void onInit() {
    super.onInit();
    _getProducts();
  }

  Future<void> _getProducts() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await productProvider.getProducts();
      change(response.body, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    } finally {}
  }
}
