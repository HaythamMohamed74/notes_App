import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/list_notes_item.dart';

class NotesBody extends StatefulWidget {
  const NotesBody({Key? key}) : super(key: key);

  @override
  State<NotesBody> createState() => _NotesBodyState();
}

class _NotesBodyState extends State<NotesBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(
            icon: Icons.search,
            title: 'Notes',
            onPressed: () {},
          ),
          Expanded(child: ListNotesItem())
        ],
      ),
    );
  }
}
