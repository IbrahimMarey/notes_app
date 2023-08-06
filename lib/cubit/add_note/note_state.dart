part of 'note_cubit.dart';

abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}
class AddNoteLoading extends AddNoteState {}
class AddNoteError   extends AddNoteState {}
class AddNoteDone    extends AddNoteState {}
class AddNoteUpdate  extends AddNoteState {}