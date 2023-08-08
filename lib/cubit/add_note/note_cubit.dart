import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  static AddNoteCubit get(context) => BlocProvider.of(context);

  void init() {
  }

  Color color= const Color(0xFF4A4063);
  addNote({required NoteModel noteModel})async
  {
    noteModel.color = color.value;
    emit(AddNoteLoading());
    try{
      var noteBox= Hive.box<NoteModel>(kNoteBox);
      await noteBox.add(noteModel);
      emit(AddNoteDone());
    }catch(e){

      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      emit(AddNoteError());
    }

  }
}