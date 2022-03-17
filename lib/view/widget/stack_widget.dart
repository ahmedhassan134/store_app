import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_api/models/product_model.dart';
import 'package:store_api/view/screens/update_product.dart';
class CoustomeStack extends StatelessWidget {
   CoustomeStack({Key? key, required this.product}) : super(key: key) ;
   ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProduct.id ,arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            width: 150,
            height: 120,
            child: Card(
              elevation: 10,
              shadowColor: Colors.black,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 8, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      product.title.substring(0,6),
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text(
                          r'$' '${product.price.toString()}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: -60,
              right:20,

              child: Image.network(
               product.image,
                fit: BoxFit.cover,

                width:80,
                height:100,
              )),
        ],
      ),
    );
  }
}
