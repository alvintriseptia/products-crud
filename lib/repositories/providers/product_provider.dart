import 'package:get/get.dart';
import 'package:products_crud/configs/configs.dart';
import 'package:products_crud/repositories/models/models.dart';

class ProductProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (json) => ProductModel.listFromJson(json);
    httpClient.baseUrl = ApiConfig.baseUrl;
  }

  Future<Response<List<ProductModel>>> getProducts() =>
      get<List<ProductModel>>('/products');
}
