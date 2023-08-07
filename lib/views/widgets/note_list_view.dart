import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/notes/notes_cubit.dart';
import 'package:notes_app/views/widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit,NotesState>(
      builder: (context, state) =>  Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: BlocProvider.of<NotesCubit>(context).notes.length,
          itemBuilder: (context, index) =>  Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: CustomNoteItem(noteModel: BlocProvider.of<NotesCubit>(context).notes[index],),
          ),
        ),
      ),
    );
  }
}
