import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/providers.dart';

class CustomTextButtom extends StatelessWidget {
  const  CustomTextButtom({this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.greenAccent,
        ),
        child: TextButton(onPressed: onPressed, child:Text('Add',style: TextStyle(color: Colors.black),) ));
  }
}
