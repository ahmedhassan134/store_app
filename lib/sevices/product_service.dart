

import 'package:store_api/helper/api_helper.dart';
import 'package:store_api/models/product_model.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
    await ApiHelper().get(url: 'https://fakestoreapi.com/products');


    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.fromjson(data[i]),
      );
    }
    return productsList;
  }
}