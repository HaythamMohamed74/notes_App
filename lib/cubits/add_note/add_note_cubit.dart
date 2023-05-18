import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants/constant.dart';
import 'package:notes_app/models/note_model.dart';

import 'add_note_state.dart';

class AddnoteCubit extends Cubit<Addnotestates> {
  AddnoteCubit() : super(AddNoteInitial());

  Color color = Color(0xffAC3931);
  Future<void> addnote(Notemodel note) async {
    note.color = color.value;
    emit(Inprogress());
    try {
      var notesBox = Hive.box<Notemodel>(kboxName);
      await notesBox.add(note);
      emit(AddedSuccsess());
    } on Exception catch (e) {
      emit(AddedFailure(e.toString()));
    }
  }
}
