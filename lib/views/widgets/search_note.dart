import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/models/note_model.dart';

import '../../constants/constant.dart';

class NoteSearchDelegate extends SearchDelegate<String> {
  // final Notemodel notesBox;
  // var notesBox = Hive.box<Notemodel>(kboxName);
  List<Notemodel> noteslist = Hive.box<Notemodel>(kboxName).values.toList();
  // NoteSearchDelegate({required this.notesBox});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          // Navigator.pop(context);
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Notemodel> searchResults = noteslist
        .where((note) =>
            note.title.toLowerCase().contains(query.toLowerCase()) ||
            note.content.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final note = searchResults[index];
        return ListTile(
          title: Text(note.title),
          subtitle: Text(note.content),
          onTap: () {
            close(context,
                note.title); // Pass the selected note title back to the caller
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // return Center(child: Text('Search Note '));
    final List<Notemodel> searchResults = query.isEmpty
        ? []
        : noteslist
            .where((note) =>
                note.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
    if (searchResults.isEmpty) {
      return Image.asset(logo);
    } else {
      return ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          final note = searchResults[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.only(top: 24, left: 16, bottom: 24),
              decoration: const BoxDecoration(
                color: Colors.cyanAccent,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        note.title,
                        style:
                            const TextStyle(fontSize: 25, color: Colors.black),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          note.content,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      note.date,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}
