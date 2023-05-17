import 'package:flutter/material.dart';
// import 'package:notes_app/models/note_modelield.dart';
import 'package:notes_app/views/widgets/edit_note_body.dart';

import '../models/note_model.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({
    Key? key,
    required this.model,
  }) : super(key: key);
  final Notemodel model;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: EditNotesbody(
        note: model,
      )),
    );
  }
}
