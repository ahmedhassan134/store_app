import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_api/models/product_model.dart';
import 'package:store_api/sevices/product_service.dart';
import 'package:store_api/view/widget/stack_widget.dart';

class HomePage extends StatelessWidget {
   const HomePage({Key? key}) : super(key: key);

   static String id = 'HomePAge';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const IconButton(
          onPressed: null,
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'New Trend ',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.cartPlus,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 50),
        child: FutureBuilder<List<ProductModel>>(
          future:AllProductsService().getAllProducts() ,

          builder: (context , AsyncSnapshot<List<ProductModel>> snapshot){
            if(snapshot.hasData){
              List<ProductModel>  products=snapshot.data!;
              return  GridView.builder(
                itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 100,
                  ),
//itemCount: 10,


                  itemBuilder: (context,index){

                    return  CoustomeStack(product: products[index],);
                  });
            }
            else{
              return const Center(child: CircularProgressIndicator(),);
            }

          },

        )
      )
    );
  }
}
