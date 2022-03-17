import 'package:store_api/helper/api_helper.dart';
import 'package:store_api/models/product_model.dart';

class UpdateProductService{

  Future<ProductModel> updateProduct({required String title,required String price,required String description,
    required String img,required String cat,required int id})async{

    Map<String,dynamic> data= await ApiHelper().put(url: 'https://fakestoreapi.com/products/$id',
        body: {
          ' title': title,
          'price': price,
          ' description': description,
          'image':  img,
          ' category': cat,

        },

    );
    return ProductModel.fromjson(data);
  }
}
