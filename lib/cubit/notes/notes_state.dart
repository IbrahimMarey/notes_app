part of 'notes_cubit.dart';

abstract class NotesState {}

class NotesInitial extends NotesState {}

class NotesLoading extends NotesState {}

class NotesError extends NotesState {}

class NotesDone extends NotesState {}

class NotesUpdate extends NotesState {}