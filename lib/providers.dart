// import 'package:flutter/cupertino.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:notes_app/constants/constant.dart';
// import 'package:notes_app/models/note_model.dart';
//
// class NoteProviders extends ChangeNotifier {
//  List <Notemodel>?notesList;
//  // Box<Notemodel>? box;
//
//  Future<void> HiveProvider() async {
//   return _initHive();
//  }
//
//  Future<void> _initHive() async {
//   await Hive.initFlutter();
//   Hive.registerAdapter(NotemodelAdapter());
//   var notesBox =await Hive.box<Notemodel>(kboxName);
//   notifyListeners();
//  }
//
//  addNote(Notemodel note) async {
//   try {
//    var notesBox = Hive.box<Notemodel>(kboxName);
//    await notesBox.add(note);
//    notesList = notesBox.values.toList();
//    notifyListeners();
//   } catch (e) {
//    (e.toString());
//   }
//   notifyListeners();
//  }
//
//  fetchAllNotes()   {
//   var notesBox = Hive.box<Notemodel>(kboxName);
//    notesList = notesBox.values.toList();
//   notifyListeners();
//  }
//   Future<void>deletenote( Notemodel note) async {
//   var notesBox = Hive.box<Notemodel>(kboxName);
//   await notesBox.delete(note.key);
//   notesList=notesBox.values.toList();
//   notifyListeners();
//  }
//
// }
//
//
//
//
