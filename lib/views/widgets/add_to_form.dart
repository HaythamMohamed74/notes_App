import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';

import '../../cubits/add_note/add_note_cubit.dart';
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
  Notemodel notee =
      Notemodel(date: '', color: 00, title: 'title', content: 'content');
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
            height: 150,
          ),
          CustomTextButtom(
            onPressed: () {
              if (form.currentState!.validate()) {
                form.currentState!.save();
                Notemodel note = Notemodel(
                    date: DateTime.now().toString(),
                    color: 0,
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
          )
        ],
      ),
    );
  }
}
