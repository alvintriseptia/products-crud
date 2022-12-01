import 'package:get/get.dart';
import 'package:products_crud/repositories/providers/firebase_provider.dart';
import 'package:products_crud/repositories/repositories.dart';

class APIProductListController extends GetxController
    with StateMixin<List<ProductModel>> {
  final ProductProvider productProvider;

  APIProductListController({required this.productProvider});

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

class DatabaseProductListController extends GetxController
    with StateMixin<List<ProductModel>> {
  final FirebaseProvider firebaseProvider = FirebaseProvider();

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  Future<void> getProducts() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await firebaseProvider.getAllProducts();
      change(response, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    } finally {}
  }
}
