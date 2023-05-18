import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constant.dart';
import '../../cubits/add_note/add_note_cubit.dart';

class Colorwidget extends StatefulWidget {
  const Colorwidget({
    super.key,
  });

  @override
  State<Colorwidget> createState() => _ColorwidgetState();
}

int activeColorIndex = 0;

class _ColorwidgetState extends State<Colorwidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: col.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            activeColorIndex = index;
            BlocProvider.of<AddnoteCubit>(context).color = col[index];
            setState(() {});
          },
          child: ColorItem(
            isActive: activeColorIndex == index,
            col: col,
            index: index,
          ),
        );
      },
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    this.isActive = true,
    required this.col,
    required this.index,
  });

  final bool isActive;
  final List<Color> col;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: isActive
          ? Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40), color: Colors.white),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: col[index],
              ),
            )
          : CircleAvatar(
              radius: 35,
              backgroundColor: col[index],
            ),
    );
  }
}
