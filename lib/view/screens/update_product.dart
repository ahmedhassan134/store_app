import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_api/models/product_model.dart';
import 'package:store_api/sevices/update_product.dart';
import 'package:store_api/view/widget/textfield.dart';


class UpdateProduct extends StatefulWidget {
  static String id = 'update product';

  const UpdateProduct({Key? key}) : super(key: key);

  @override
  _UpdateProductState createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {


  String ? productName, desc, img,price;
bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    ProductModel p =ModalRoute.of(context)!.settings.arguments as ProductModel;
    return  ModalProgressHUD(
      inAsyncCall:isLoading ,

      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Update Product', style: TextStyle(color: Colors.black),),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(

          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(

                children: [
                  const SizedBox(height: 200,),

                  CustomeTextField(text: 'Product Name', onchange: (data) {
                    productName = data;
                  }),
                  const SizedBox(height: 10,),
                  CustomeTextField(text: 'Description ', onchange: (data) {
                    desc = data;
                  }),
                  const SizedBox(height: 10,),
                  CustomeTextField(text: 'Price',
                      keyBoard: TextInputType.number,
                      onchange: (data) {
                        price = data;
                      }),
                  const SizedBox(height: 10,),
                  CustomeTextField(text: 'Image ', onchange: (data) {
                    img = data;
                  }),
                  const SizedBox(height: 15,),
                  Container(
                    width: double.infinity,
                    height: 20,
                    color: Colors.blue,
                    child: GestureDetector(
                      onTap: () async {
                        isLoading=true;
                        setState(() {

                        });
                        try{
                         await UpdateProductService().updateProduct(
                           id: p.id,
                              title: productName==null?p.title:productName!,
                              price: price==null?p.price.toString():price!,
                              description: desc==null?p.description:desc!,
                              img: img==null?p.image:img!,
                              cat:p.category);
                        }catch(e){print(e.toString());}
                        isLoading=false;
                        setState(() {

                        });

                      },


                      child: const Text('update', style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,),
                    ),
                  )
                ],
              ),

            ),
          ),
        ),
      ),
    );

  }

}
