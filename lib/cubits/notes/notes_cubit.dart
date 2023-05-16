import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../constants/constant.dart';
import '../../models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<Notemodel>? noteslist;
  fetchNotes() {
    var notesBox = Hive.box<Notemodel>(kboxName);
    noteslist = notesBox.values.toList();
    emit(Succes());
  }
}
