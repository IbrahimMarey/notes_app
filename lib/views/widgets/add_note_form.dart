import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/add_note/note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';
import 'package:intl/intl.dart';


class AddNoteForm extends StatefulWidget {
  const AddNoteForm({Key? key}) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            hint: 'Title',
            onSaved: (v) {
              title = v;
            },
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            hint: 'Content',
            maxLines: 5,
            onSaved: (v) {
              subTitle = v;
            },
          ),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<AddNoteCubit,AddNoteState>(
            builder: (context, state) => CustomButton(
              isLoading: state is AddNoteLoading,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  final noteModel = NoteModel(
                      title: title!,
                      subTitle: subTitle!,
                      date: DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now())
                      .toString(),
                      color: Colors.teal.value,
                  );
                  BlocProvider.of<AddNoteCubit>(context)
                      .addNote(noteModel: noteModel);
                  formKey.currentState!.save();
                } else {
                  autoValidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
