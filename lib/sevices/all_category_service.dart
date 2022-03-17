
import 'package:store_api/helper/api_helper.dart';

class AllCategory{
  
  
  Future<List<dynamic>> getAllCategory() async{
    List<dynamic> data=await ApiHelper().get(url: 'https://fakestoreapi.com/products/categories');

        return data;


    
    
  }
  
}