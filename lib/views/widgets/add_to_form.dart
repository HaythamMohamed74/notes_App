import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/models/note_model.dart';

import '../../cubits/add_note/add_note_cubit.dart';
import 'colors_list.dart';
import 'custom_text_buttom.dart';
import 'custom_text_form_field.dart';

class AddtoForm extends StatefulWidget {
  const AddtoForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AddtoForm> createState() => _AddtoFormState();
}

class _AddtoFormState extends State<AddtoForm> {
  final GlobalKey<FormState> form = GlobalKey();
  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;
  // Notemodel notee =
  //     Notemodel(date: '', color: 00, title: 'title', content: 'content');
  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            hint: 'Title',
            maxlines: 1,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'plaese fill title ';
              } else {
                return null;
              }
            },
            onSaved: (titleValue) {
              title = titleValue;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            hint: 'content',
            maxlines: 4,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'plaese fill content ';
              } else {
                return null;
              }
            },
            onSaved: (contentValue) {
              content = contentValue;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(height: 70, child: Colorwidget()),
          const SizedBox(
            height: 15,
          ),
          CustomTextButtom(
            onPressed: () {
              final DateTime now = DateTime.now();
              final DateFormat formatter = DateFormat('EEE, yyyy-MM-dd');
              if (form.currentState!.validate()) {
                form.currentState!.save();
                Notemodel note = Notemodel(
                    date: formatter.format(now).toString(),
                    color: Colors.red.value,
                    title: title!,
                    content: content!);
                BlocProvider.of<AddnoteCubit>(context).addnote(note);
                // print(title);
                // Navigator.pop(context);
              } else {
                AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}

// class Colorwidget extends StatefulWidget {
//   // const Colorwidget({
//   //    super.key,
//   //  });
//
//   List<Color> col = [
//     Colors.pink,
//     Colors.orange,
//     Colors.yellow,
//     Colors.cyan,
//     Colors.redAccent,
//     Colors.lightGreenAccent,
//     Colors.blueGrey,
//     Colors.teal,
//   ];
//
//   @override
//   State<Colorwidget> createState() => _ColorwidgetState();
// }
//
// int activeColorIndex = 0;
//
// class _ColorwidgetState extends State<Colorwidget> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       scrollDirection: Axis.horizontal,
//       itemCount: widget.col.length,
//       itemBuilder: (BuildContext context, int index) {
//         return GestureDetector(
//           onTap: () {
//             activeColorIndex = index;
//             BlocProvider.of<AddnoteCubit>(context).color = widget.col[index];
//             setState(() {});
//           },
//           child: ColorItem(
//             isActive: activeColorIndex == index,
//             col: widget.col,
//             index: index,
//           ),
//         );
//       },
//     );
//   }
// }
//
// class ColorItem extends StatelessWidget {
//   const ColorItem({
//     super.key,
//     this.isActive = true,
//     required this.col,
//     required this.index,
//   });
//
//   final bool isActive;
//   final List<Color> col;
//   final int index;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(1.0),
//       child: isActive
//           ? Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(40), color: Colors.white),
//               child: CircleAvatar(
//                 radius: 40,
//                 backgroundColor: col[index],
//               ),
//             )
//           : CircleAvatar(
//               radius: 35,
//               backgroundColor: col[index],
//             ),
//     );
//   }
// }
