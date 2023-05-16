import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants/constant.dart';
import 'package:notes_app/models/note_model.dart';

part 'delete_note_state.dart';

class DeleteNoteCubit extends Cubit<DeleteNoteState> {
  DeleteNoteCubit() : super(DeleteNoteInitial());
  deletnote(Notemodel note) {
    var box = Hive.box<Notemodel>(kboxName);
    box.delete(note.key);
    emit(DeleteNoteSuccess());
  }
}
