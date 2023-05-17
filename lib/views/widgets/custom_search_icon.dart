import 'package:flutter/material.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({Key? key, required this.icon, required this.onPressed})
      : super(key: key);
  final IconData icon;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15)),
        child: IconButton(onPressed: onPressed, icon: Icon(icon)));
  }
}
