import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../cubits/add_note/add_note_cubit.dart';
import '../../cubits/add_note/add_note_state.dart';
import '../../cubits/notes/notes_cubit.dart';
import 'add_to_form.dart';

class AddNoteButtomsheet extends StatelessWidget {
  const AddNoteButtomsheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (BuildContext context) => AddnoteCubit(),
        child: BlocConsumer<AddnoteCubit, Addnotestates>(
          listener: (BuildContext context, Object? state) {
            if (state is AddedSuccsess) {
              BlocProvider.of<NotesCubit>(context).fetchNotes();
              Navigator.pop(context);
            }
            if (state is AddedFailure) {
              Center(child: Text('${state.errormsg}'));
            }
          },
          builder: (BuildContext context, state) {
            return ModalProgressHUD(
                color: Colors.white,
                inAsyncCall: state is Inprogress ? true : false,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 16,
                      left: 16,
                      right: 16,
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: SingleChildScrollView(child: AddtoForm()),
                ));
          },
        ),
      ),
    );
  }
}
