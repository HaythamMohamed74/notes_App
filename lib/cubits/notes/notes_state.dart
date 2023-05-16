part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}

// class NotesExist extends NotesState {
//   final List<Notemodel> notelist;
//
//   NotesExist({required this.notelist});
// }
class Succes extends NotesState {}
// class NotesNotExist extends NotesState {
//   final String errormsg;
//   NotesNotExist(this.errormsg);
// }
