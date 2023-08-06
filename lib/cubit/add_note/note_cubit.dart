import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  static AddNoteCubit get(context) => BlocProvider.of(context);

  void init() {
  }

  addNote({required NoteModel noteModel})async
  {
    emit(AddNoteLoading());
    try{
      var noteBox= Hive.box<NoteModel>(kNoteBox);
      await noteBox.add(noteModel);
      emit(AddNoteDone());
    }catch(e){

      emit(AddNoteError());
    }

  }
}