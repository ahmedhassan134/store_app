import 'package:store_api/helper/api_helper.dart';
import 'package:store_api/models/product_model.dart';

class AddProductService{

  Future<ProductModel> addProduct({required String title,required String price,required String description,
  required String img,required String cat})async{

    Map<String,dynamic> data= await ApiHelper().post(url: 'https://fakestoreapi.com/products',
        body: {
       ' title': title,
        'price': price,
       ' description': description,
        'image':  img,
       ' category': cat,

        }

    );
    return ProductModel.fromjson(data);
  }
}
