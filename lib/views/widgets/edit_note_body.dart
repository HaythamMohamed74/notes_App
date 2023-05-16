import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_note_item.dart';
import 'package:notes_app/views/widgets/custom_text_form_field.dart';

class EditNotesbody extends StatelessWidget {
  const EditNotesbody({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children :const [
      CustomAppbar(icon: Icons.check, title: 'EditNote', ),
      // NoteItem(note: note!)
    ],);
  }
}