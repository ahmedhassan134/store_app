import 'package:flutter/material.dart';
class CustomeTextField extends StatelessWidget {
  CustomeTextField({Key? key, required this.text,required this.onchange, this.keyBoard}) : super(key: key) ;

  String text;
  Function(String data)? onchange;
  TextInputType ? keyBoard;

  @override
  Widget build(BuildContext context) {
    return  TextField(
      decoration: InputDecoration(
          hintText: text,
          border: const OutlineInputBorder(),

      ),
      onChanged: onchange!,
        keyboardType: keyBoard,
    );
  }
}
