import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants/constant.dart';
import 'package:notes_app/models/note_model.dart';

import 'add_note_state.dart';

class AddnoteCubit extends Cubit<Addnotestates> {
  AddnoteCubit() : super(AddNoteInitial());

  Future<void> addnote(Notemodel note) async {
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
