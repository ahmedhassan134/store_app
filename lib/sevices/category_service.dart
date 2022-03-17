

import 'package:store_api/helper/api_helper.dart';
import 'package:store_api/models/product_model.dart';

class CategoryService{

  Future<List<ProductModel >> getCategory({required String categoryName}) async{
  List<dynamic> data =await ApiHelper().get(url: 'https://fakestoreapi.com/products/category/$categoryName');






      List<ProductModel> productList=[];
      for(int i=0;i<data.length;i++){
        productList.add(ProductModel.fromjson(data[i]));
      }


      return productList;










  }

}