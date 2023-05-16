import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_note_item.dart';

class ListNotesItem extends StatefulWidget {
  const ListNotesItem({Key? key}) : super(key: key);

  @override
  State<ListNotesItem> createState() => _ListNotesItemState();
}

class _ListNotesItemState extends State<ListNotesItem> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<Notemodel> list =
            BlocProvider.of<NotesCubit>(context).noteslist ?? [];
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return NoteItem(
              note: list[index],
            );
          },
        );
      },
    );
  }
}
