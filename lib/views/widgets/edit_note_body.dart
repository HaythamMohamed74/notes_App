import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_form_field.dart';

class EditNotesbody extends StatefulWidget {
  const EditNotesbody({
    Key? key,
    required this.note,
  }) : super(key: key);
  final Notemodel note;

  @override
  State<EditNotesbody> createState() => _EditNotesbodyState();
}

class _EditNotesbodyState extends State<EditNotesbody> {
  String? title;
  String? content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppbar(
          icon: Icons.check,
          title: 'EditNote',
          onPressed: () {
            widget.note.title = title ?? widget.note.title;
            widget.note.content = content ?? widget.note.content;
            widget.note.save();
            BlocProvider.of<NotesCubit>(context).fetchNotes();
            Navigator.pop(context);
          },
        ),
        SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          hint: widget.note.title,
          maxlines: 1,
          onChanged: (value) {
            title = value;
          },
        ),
        SizedBox(
          height: 25,
        ),
        CustomTextFormField(
          hint: widget.note.content,
          maxlines: 5,
          onChanged: (value) {
            content = value;
          },
        )
      ],
    );
  }
}
