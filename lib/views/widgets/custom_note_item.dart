
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubit/notes/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({
    Key? key,
    required this.noteModel,
  }) : super(key: key);

  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async
      {
       await Navigator.push(context, MaterialPageRoute(builder: (context) =>  EditNoteView(note: noteModel,),));
       BlocProvider.of<NotesCubit>(context).fetchAllNotes();
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24,bottom: 24,left: 16,),
        decoration: BoxDecoration(
          color:  Color(noteModel.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title:  Text(
                noteModel.title,
                style: const TextStyle(color: Colors.black, fontSize: 26),
              ),
              subtitle:  Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  noteModel.subTitle,
                  style: TextStyle(color: Colors.black.withOpacity(.4), fontSize: 18),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  noteModel.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
                icon: const Icon(FontAwesomeIcons.trash,
                  color: Colors.black,size: 24,),
              ),
            ),
             Padding(
               padding: const EdgeInsets.only(right: 24.0,),
               child: Text(noteModel.date,style: TextStyle(fontSize: 16,color: Colors.black.withOpacity(.4)),),
             ),
          ],
        ),
      ),
    );
  }
}
