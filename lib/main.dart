import 'package:flutter/material.dart';
import 'package:store_api/view/screens/home_page.dart';
import 'package:store_api/view/screens/update_product.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
    HomePage.id : (context) => const HomePage(),
    UpdateProduct.id : (context) => const UpdateProduct(),

    },
    initialRoute: HomePage.id,

    );
  }
}
