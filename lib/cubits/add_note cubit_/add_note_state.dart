part of'add_note_cubit.dart';
//import 'package:flutter/cupertino.dart';


// @immutable
abstract class AddNoteState{}

class AddNoteInitial extends AddNoteState{}
class AddNoteLoadind extends AddNoteState{}
class AddNoteSuccess extends AddNoteState{}
class AddNoteFailiar extends AddNoteState{

  final String errMessage;

  AddNoteFailiar(this.errMessage);


}
