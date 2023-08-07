import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  static NotesCubit get(context) => BlocProvider.of(context);

  void init() {
  }

  List<NoteModel>notes=[];
  fetchAllNotes()
  {
   // try{
      var noteBox= Hive.box<NoteModel>(kNoteBox);
       notes= noteBox.values.toList();
      emit(NotesDone());
    // }catch(e){
    //
    //   Fluttertoast.showToast(
    //       msg: e.toString(),
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.CENTER,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.red,
    //       textColor: Colors.white,
    //       fontSize: 16.0
    //   );
    //   emit(NotesError());
    // }
  }
}