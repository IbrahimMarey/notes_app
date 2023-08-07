import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubit/add_note/note_cubit.dart';
import 'package:notes_app/views/widgets/add_note_form.dart';

class AddNoteSheet extends StatelessWidget {
  const AddNoteSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteDone) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'success',
                ),
              ),
            );
            Navigator.pop(context);
          }
          if (state is AddNoteError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'failure',
                ),
              ),
            );
          }
        },
        builder: (context, state) => AbsorbPointer(
          absorbing: state is AddNoteLoading,
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(child: AddNoteForm(),),
          ),
        ),
      ),
    );
  }
}
