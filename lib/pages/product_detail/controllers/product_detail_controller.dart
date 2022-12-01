import 'package:get/get.dart';
import 'package:products_crud/repositories/models/models.dart';
import 'package:products_crud/repositories/providers/firebase_provider.dart';

class ProductDetailController extends GetxController {
  final Rxn<ProductModel> product = Rxn<ProductModel>();
  final RxBool isMyProduct = false.obs;
  final FirebaseProvider _firebaseProvider = FirebaseProvider();
  final RxBool isLoading = false.obs;
  final RxBool isEdited = false.obs;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    if (arguments['product'] != null) {
      product.value = arguments['product'];
      isMyProduct.value = arguments['isMyProduct'];
    }
    update();
  }

  //Update Product after edit
  void getProduct() async {
    try {
      isLoading.value = true;
      isEdited.value = true;
      update();
      final ProductModel productModel =
          await _firebaseProvider.getProductById(product.value!.id);
      product.value = productModel;
    } catch (err) {
      rethrow;
    } finally {
      isLoading.value = false;
      update();
    }
  }

  //Delete Product
  void deleteProduct() async {
    try {
      update();
      await _firebaseProvider.deleteProduct(product.value!.id);
      Get.back(result: true);
      Get.snackbar(
        'Success',
        'Product deleted successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (err) {
      rethrow;
    }
  }
}
