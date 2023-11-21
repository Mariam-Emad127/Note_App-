import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/models/note_model.dart';
 part 'note_state.dart';
class NoteCubit extends Cubit<NoteState>{
  NoteCubit(): super(NoteInitial());

  List<NoteModel>?notes;
fetchAllNote()async{
  var noteBox=Hive.box<NoteModel>(kNotesBox);
notes=noteBox.values.toList();
 emit(NoteSuccess());


}

}



