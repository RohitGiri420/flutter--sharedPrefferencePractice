import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiHelper{

  static customTextField(TextEditingController controller, String label,IconData icon,TextInputType keyboardListener){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: controller,
        keyboardType:keyboardListener,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          label:Text('$label'),
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }

  static customButton(VoidCallback onPressed,String text){
    return ElevatedButton(onPressed: onPressed, child: Text("$text"));

  }

}