import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';
class AddNoteCubit extends Cubit<AddNoteState>{
  AddNoteCubit():super(AddNoteInitial()) ;
  Color? color=  Color(0xffAC3931);

  addNote(NoteModel note)async{
note.color=color!.value;
    emit(AddNoteLoadind());
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(note);
      emit(AddNoteSuccess());
      //noteBox.add(note);
    }catch (e){

      emit(AddNoteFailiar(e.toString()));

    }
  }

}