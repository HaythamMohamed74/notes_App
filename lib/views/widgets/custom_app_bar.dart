import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_search_icon.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    required this.icon,
    required this.title,
    required this.onPressed,
    // this.togllebuttom,
    // required this.togleicon,
  });
  final IconData icon;
  final String title;
  final void Function() onPressed;
  // final void Function()? togllebuttom;
  // final Widget togleicon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12, right: 12, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          SearchIcon(
            icon: icon,
            onPressed: onPressed,
          ),
          // IconButton(onPressed: onPressed, icon: togleicon)
        ],
      ),
    );
  }
}
